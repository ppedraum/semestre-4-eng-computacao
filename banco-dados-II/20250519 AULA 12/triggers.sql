-- TRIGGERS

-- Servem para executar ações adicionais antes ou após de alterar dados com UPDATE, INSERT ou DELETE
-- Ao executar um comando, o sistema procura se existe alguma trigger para o tipo de comando utilizado
-- Ex: Criar um LOG depois de alterar registros no banco de dados
-- Ex 2: Alterar o estoque de um produto com base em entradas e saídas

CREATE TABLE produto(
	idproduto serial PRIMARY KEY,
	descricao varchar(255) NOT NULL,
	saldoinicial numeric(12, 2) NOT NULL DEFAULT 0,
	saldoatual numeric(12, 2) NOT NULL DEFAULT 0
);

CREATE TABLE movimentoestoque(
	idmovimento serial PRIMARY KEY,
	idproduto integer NOT NULL,
	"data" date NOT NULL,
	hora time NOT NULL,
	quantidade numeric(12, 2) NOT NULL,
	tipo varchar(10) NOT NULL CHECK (tipo IN ('Entrada','Saída')),
	CONSTRAINT fk_produto FOREIGN KEY (idproduto) REFERENCES produto (idproduto)
);

INSERT INTO produto (descricao, saldoinicial, saldoatual)
VALUES
  ('Cimento Portland 50kg', 100, 100),
  ('Tijolo Baiano 9 furos', 5000, 5000),
  ('Areia Média Lavada m³', 30, 30),
  ('Brita 1 m³', 25, 25),
  ('Cal Hidratada 20kg', 200, 200),
  ('Bloco de Concreto 39x14x19 cm', 3000, 3000),
  ('Vergalhão 10mm 12m', 150, 150),
  ('Telha Cerâmica 40x40 cm', 1200, 1200),
  ('Argamassa AC1 20kg', 180, 180),
  ('Tubo PVC 100mm', 90, 90);

-- Primeiro devemos criar uma função que a trigger vai executar (exclusivo do Postgres)
CREATE OR REPLACE FUNCTION atualiza_saldo_produto()
-- O tipo de retorno vai ser trigger
RETURNS TRIGGER AS $$
BEGIN
	IF NEW.tipo = 'Entrada' THEN
		UPDATE produto
		-- Podemos pegar os novos valores inseridos ou alterados com o NEW
		SET saldoatual = saldoatual + NEW.quantidade
		WHERE idproduto = NEW.idproduto;
	ELSIF NEW.tipo = 'Saída' THEN
		UPDATE produto
		SET saldoatual = saldoatual - NEW.quantidade
		WHERE idproduto = NEW.idproduto;
	ELSE
		RAISE EXCEPTION 'Valor inválido para a coluna TIPO: %. Utilize apenas "Entrada" ou "Saída"', NEW.tipo;
	END IF;

	-- Retornamos o NEW como padrão
	RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Cria a trigger que é executada após o comando insert, que executa a função acima
CREATE TRIGGER trg_atualiza_saldo_apos_movimento
AFTER INSERT ON movimentoestoque
FOR EACH ROW
EXECUTE FUNCTION atualiza_saldo_produto();

CREATE OR REPLACE FUNCTION verifica_saldo_antes_saida()
RETURNS TRIGGER AS $$
DECLARE
	saldo_atual numeric;
BEGIN
	IF NEW.tipo = 'Saída' THEN
		SELECT saldoatual INTO saldo_atual
		FROM produto
		WHERE idproduto = NEW.idproduto;

		IF NEW.quantidade > saldo_atual THEN
			RAISE EXCEPTION 'Estoque insuficiente para o produto ID %. O saldo atual é % e a tentativa de saída foi %', NEW.idproduto, saldo_atual, NEW.quantidade;
		END IF;
	END IF;
	RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Mesma coisa porém a trigger é ativada antes do insert, podendo assim barrar a execução do comando por completo caso necessário
CREATE TRIGGER trg_verifica_saldo_antes_insert
BEFORE INSERT ON movimentoestoque
FOR EACH ROW
EXECUTE FUNCTION verifica_saldo_antes_saida();
	
INSERT INTO movimentoestoque (idproduto, "data", hora, quantidade, tipo)
VALUES (1, NOW(), NOW(), 100, 'Saída');

















