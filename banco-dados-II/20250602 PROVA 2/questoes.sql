-- TRIGGERS

-- 1

CREATE OR REPLACE FUNCTION fn_atualiza_contas_pagar()
RETURNS TRIGGER AS $$
BEGIN

	UPDATE contaspagar
	SET status = 'Pago'
	WHERE idcontapagar = NEW.idcontapagar
	AND parcela = NEW.parcela;

	RETURN NEW;

END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_atualiza_contas_pagar
AFTER INSERT ON pagamentos
FOR EACH ROW
EXECUTE FUNCTION fn_atualiza_contas_pagar();

-- 2

CREATE OR REPLACE FUNCTION fn_atualiza_saldo_conta()
RETURNS TRIGGER AS $$
BEGIN

	UPDATE contacorrente
	SET saldoatual = saldoatual - NEW.valorpago
	WHERE idconta = NEW.idcontacorrente;

	RETURN NEW;

END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_atualiza_saldo_conta
AFTER INSERT ON pagamentos
FOR EACH ROW
EXECUTE FUNCTION fn_atualiza_saldo_conta();

-- 3

CREATE OR REPLACE FUNCTION fn_impedir_saldo_negativo_conta()
RETURNS TRIGGER AS $$
DECLARE
	saldo INTEGER;
BEGIN

	SELECT saldoatual INTO saldo
	FROM contacorrente
	WHERE idconta = NEW.idcontacorrente;

	IF NEW.valorpago > saldo THEN
		RAISE EXCEPTION 'O valor pago excede o saldo atual em conta';
	END IF;

	RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_impedir_saldo_negativo_conta
BEFORE INSERT ON pagamentos
FOR EACH ROW
EXECUTE FUNCTION fn_impedir_saldo_negativo_conta();

-- 4

CREATE OR REPLACE FUNCTION fn_criar_movimentofinanceiro()
RETURNS TRIGGER AS $$
BEGIN

	INSERT INTO movimentofinanceiro (idmovto, datamovto, hora, valor, idrecebepagtoorigem, tabelaorigem, tipo)
	VALUES (default, now(), now(), NEW.valorpago, NEW.idcontapagar, 'pagamentos', 'Saída');

	RETURN NEW;

END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_criar_movimentofinanceiro
AFTER INSERT ON pagamentos
FOR EACH ROW
EXECUTE FUNCTION fn_criar_movimentofinanceiro();

-- PROCEDURES/FUNCTIONS

-- 1

CREATE OR REPLACE PROCEDURE sp_inserir_contacorrente (p_idconta INT, p_idbanco INT, p_numeroconta VARCHAR, p_digitoconta VARCHAR, p_saldo NUMERIC)
LANGUAGE plpgsql
AS $$
BEGIN

	INSERT INTO contacorrente(idconta, idbanco, numeroconta, digitoconta, saldoinicial, saldoatual)
	VALUES (p_idconta, p_idbanco, p_numeroconta, p_digitoconta, p_saldo, p_saldo);

END;
$$

-- 2

CREATE OR REPLACE PROCEDURE sp_inserir_contaspagar(
	p_idcontapagar INT, p_parcela INT, p_idfornecedor INT, p_datadigitacao DATE, 
	p_datavencimento DATE, p_valorconta NUMERIC, p_observacao TEXT
)
LANGUAGE plpgsql
AS $$
BEGIN

	INSERT INTO contaspagar (idcontapagar, parcela, idfornecedor, datadigitacao, datavencimento, valorconta, status, observacao)
	VALUES (p_idcontapagar, p_parcela, p_idfornecedor, p_datadigitacao, p_datavencimento, p_valorconta, 'Aberto', p_observacao);

END;
$$;

-- 3

CREATE OR REPLACE PROCEDURE sp_inserir_pagamento_conta_aberto(
	p_idpagamento INT, p_idcontapagar INT, p_parcela INT, p_datapagamento DATE, p_valorpago NUMERIC, p_idcontacorrente INT
)
LANGUAGE plpgsql
AS $$
DECLARE v_status VARCHAR;
BEGIN

	SELECT status INTO v_status FROM contaspagar WHERE idcontapagar = p_idcontapagar;

	IF v_status != 'Aberto' THEN
		RAISE EXCEPTION 'Erro: Você só pode pagar uma conta a pagar com status em aberto';
	END IF;

	INSERT INTO pagamentos (idpagamento, idcontapagar, parcela, datapagamento, valorpago, idcontacorrente)
	VALUES (p_idpagamento, p_idcontapagar, p_parcela, p_datapagamento, p_valorpago, p_idcontacorrente);

END;
$$;

-- VIEWS

-- 1

CREATE VIEW view_imprimir_contas_aberto AS
SELECT idcontapagar, parcela, idfornecedor, datadigitacao, datavencimento, valorconta, observacao
FROM contaspagar
WHERE status = 'Aberto';

-- 2

CREATE OR REPLACE VIEW view_imprimir_soma_contaspagar_por_fornecedor AS
SELECT SUM(c.valorconta), f.idfornecedor, f.nome, f.telefone, f.email
FROM contaspagar c
JOIN fornecedores f ON f.idfornecedor = c.idfornecedor
GROUP BY f.idfornecedor, f.nome, f.telefone, f.email
ORDER BY SUM(c.valorconta) DESC;

-- 3

CREATE OR REPLACE VIEW view_imprimir_extrato AS
SELECT  c.parcela, c.idfornecedor, c.datadigitacao, c.datavencimento, c.valorconta, c.status, c.observacao, m.datamovto, m.hora, m.valor, m.tipo
FROM movimentofinanceiro m
JOIN contaspagar c ON c.idcontapagar = m.idrecebepagtoorigem
ORDER BY m.datamovto DESC;














