-- 1

-- CREATE OR REPLACE PROCEDURE ps_inserir_cliente(p_codcliente INT, p_nome VARCHAR, p_datanascimento DATE, p_cpf VARCHAR)
-- LANGUAGE plpgsql
-- AS $$
-- BEGIN
-- 	INSERT INTO cliente (codcliente, nome, datanascimento, cpf)
-- 	VALUES (p_codcliente, p_nome, p_datanascimento, p_cpf);

-- 	INSERT INTO "log" (tabelabanco, acao, "data", hora, usuario, codigoorigem)
-- 	VALUES ('cliente', 'Inserir cliente', CURRENT_DATE, CURRENT_TIME, CURRENT_USER, p_codcliente);

-- END;
-- $$;

-- CALL ps_inserir_cliente(11, 'Zé da Manga', '2025-01-01', '11111111112');

-- 2

-- CREATE OR REPLACE PROCEDURE ps_alterar_limitecredito_cliente(p_codcliente INT, p_percentual DECIMAL, p_tipo VARCHAR)
-- LANGUAGE plpgsql
-- AS $$
-- BEGIN
-- 	UPDATE cliente 
-- 	SET limitecredito = (
-- 		CASE WHEN p_tipo = 'Aumento' THEN (limitecredito + (limitecredito * p_percentual))
-- 		ELSE (limitecredito - (limitecredito * p_percentual))
-- 		END
-- 	)
-- 	WHERE codcliente = p_codcliente;

-- 	INSERT INTO "log" (tabelabanco, acao, "data", hora, usuario, codigoorigem)
-- 	VALUES ('cliente','Alterar limitecredito', CURRENT_DATE, CURRENT_TIME, CURRENT_USER, p_codcliente);

-- END;
-- $$;

-- CALL ps_alterar_limitecredito_cliente(1, 0.5, 'Aumento');
-- SELECT * FROM cliente WHERE codcliente = 1;
-- SELECT * FROM "log" ORDER BY codlog DESC;

-- 3

-- CREATE OR REPLACE PROCEDURE ps_inserir_produto(p_codproduto INT, p_descricao VARCHAR, p_saldo DECIMAL)
-- LANGUAGE plpgsql
-- AS $$
-- BEGIN
-- 	INSERT INTO produto (codproduto, descricao, saldoatual, saldoinicial)
-- 	VALUES (p_codproduto, p_descricao, p_saldo, p_saldo);

-- 	INSERT INTO "log" (tabelabanco, acao, "data", hora, usuario, codigoorigem)
-- 	VALUES ('produto','Inserir produto', CURRENT_DATE, CURRENT_TIME, CURRENT_USER, p_codproduto);

-- END;
-- $$;

-- CALL ps_inserir_produto(6, 'Macaco Hidráulico', 150);

-- select * from produto;
-- select * from "log";

-- 4

-- CREATE OR REPLACE PROCEDURE ps_inserir_pedidovenda(p_codpedido INT, p_codcliente INT, p_datapedido DATE, p_nf VARCHAR, p_valortotal DECIMAL, p_obs TEXT)
-- LANGUAGE plpgsql
-- AS $$
-- BEGIN
-- 	INSERT INTO pedidovenda (codpedido, codcliente, datapedido, nf, valortotal, obs)
-- 	VALUES (p_codpedido, p_codcliente, p_datapedido, p_nf, p_valortotal, p_obs);

-- 	INSERT INTO "log" (tabelabanco, acao, "data", hora, usuario, codigoorigem)
-- 	VALUES ('pedidovenda', 'Inserir pedidovenda', CURRENT_DATE, CURRENT_TIME, CURRENT_USER, p_codpedido);

-- END;
-- $$;
	
-- CALL ps_inserir_pedidovenda(1,1,CURRENT_DATE,'12345678901234567890', 2000, 'Teste');

-- select * from pedidovenda;
-- select * from "log";

-- 5

CREATE OR REPLACE PROCEDURE ps_inserir_itempedido(p_codpedido INT, p_numeroitem INT, p_valorunitario DECIMAL, p_quantidade INT, p_codproduto INT)
LANGUAGE plpgsql
AS $$
BEGIN
	INSERT INTO itempedido(codpedido, numeroitem, valorunitario, quantidade, codproduto)
	VALUES (p_codpedido, p_numeroitem, p_valorunitario, p_quantidade, p_codproduto);

	INSERT INTO "log" (tabelabanco, acao, "data", hora, usuario, codigoorigem)
	VALUES('itempedido','Inserir itempedido', CURRENT_DATE, CURRENT_TIME, CURRENT_USER, p_codpedido);

END;
$$;

	











