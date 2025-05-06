-- FUNCTIONS E STORED PROCEDURES (Procedimentos)

-- Functions retornam um valor (pode retornar void) e procedures não retornam valor
-- Chamamos as functions com SELECT, e as procedures com CALL

---- Criando Procedure
-- CREATE OR REPLACE PROCEDURE sp_inserir_clientes(
-- 	p_codcliente INT,
-- 	p_nome VARCHAR,
-- 	p_datanascimento DATE,
-- 	p_cpf VARCHAR
-- )
-- LANGUAGE plpgsql
-- AS $$
-- BEGIN
-- 	INSERT INTO cliente (codcliente, nome, datanascimento, cpf)
-- 	VALUES (p_codcliente, p_nome, p_datanascimento, p_cpf);
-- END;
-- $$;

---- Chamando a procedure
-- CALL sp_inserir_clientes(8, 'Zézinho', '2025-01-01','11111111111');

---- Adicionando exceções
-- CREATE OR REPLACE PROCEDURE sp_inserir_clientes(
-- 	p_codcliente INT,
-- 	p_nome VARCHAR,
-- 	p_datanascimento DATE,
-- 	p_cpf VARCHAR
-- )
-- LANGUAGE plpgsql
-- AS $$
-- BEGIN
-- 	INSERT INTO cliente (codcliente, nome, datanascimento, cpf)
-- 	VALUES (p_codcliente, p_nome, p_datanascimento, p_cpf);
-- EXCEPTION
-- 	WHEN unique_violation THEN
-- 		RAISE NOTICE 'Erro: Código de cliente já existe';
-- 	WHEN others THEN
-- 		RAISE NOTICE 'Erro ao inserir cliente: %', SQLERRM;
-- END;
-- $$;

-- CALL sp_inserir_clientes(8, 'Zézinho', '2025-01-01','11111111111');

---- Criando function que retorna INT
-- CREATE OR REPLACE FUNCTION fn_inserir_clientes(
-- 	p_codcliente INT,
-- 	p_nome VARCHAR,
-- 	p_datanascimento DATE,
-- 	p_cpf VARCHAR
-- )
-- RETURNS INT
-- LANGUAGE plpgsql
-- AS $$
-- DECLARE v_codcliente INT;
-- BEGIN
-- 	INSERT INTO cliente (codcliente, nome, datanascimento, cpf)
-- 	VALUES (p_codcliente, p_nome, p_datanascimento, p_cpf)
-- 	RETURNING codcliente INTO v_codcliente;

-- 	RETURN v_codcliente;
-- EXCEPTION
-- 	WHEN unique_violation THEN
-- 		RAISE NOTICE 'Erro: Código de cliente já existe';
-- 	WHEN others THEN
-- 		RAISE NOTICE 'Erro ao inserir cliente: %', SQLERRM;
-- END;
-- $$;

---- Chamando a função
-- SELECT fn_inserir_clientes(9, 'Joaozinho','2025-01-01','22222222222');







