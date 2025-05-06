-- VIEWS

-- Forma de guardar os SELECTS para utilizar mais tarde.
-- O usuário da view não precisa saber como o select funciona
-- A view permite você tratar as permissões de forma customizada
-- Exemplos: BI, relatórios

-- create view view_ponto_funcionario as 
-- select nome_func, profissao, entrada, hora_entrada
-- from funcionarios
-- join registro_ponto on codigo = cod_func

-- select * from view_ponto_funcionario

-- tabela materializada
-- armazena os dados fisicamente, bate uma "foto" da tabela naquela hora, atualizando só quando é pedido

-- create materialized view view_materializada_funcionario as select * from funcionarios with no data;
-- refresh materialized view view_materializada_funcionario;

select * from view_materializada_funcionario;