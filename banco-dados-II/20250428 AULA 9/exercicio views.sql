-- CREATE TABLE cliente( 
-- codcliente int, 
-- nome varchar(60), 
-- datanascimento date, 
-- cpf varchar(11), 
-- CONSTRAINT pk_ex_cliente PRIMARY KEY (codcliente)); 

-- CREATE TABLE pedido( 
-- codpedido int, 
-- codcliente int, 
-- datapedido date, 
-- nf varchar(12), 
-- valortotal decimal(10,2), 
-- obs text,
-- CONSTRAINT pk_ex_pedido PRIMARY KEY (codpedido), 
-- CONSTRAINT pk_ex_pedido_cliente FOREIGN KEY (codcliente) REFERENCES cliente(codcliente)); 

-- CREATE TABLE produto( 
-- codproduto int, 
-- descricao varchar(100), 
-- saldoatual numeric(15,3),
-- CONSTRAINT pk_ex_produto PRIMARY KEY (codproduto)); 

-- CREATE TABLE itempedido( 
-- codpedido int, 
-- numeroitem int, 
-- valorunitario decimal(10,2), 
-- quantidade int, 
-- codproduto int, 
-- CONSTRAINT pk_itempedido PRIMARY KEY (codpedido, numeroitem), 
-- CONSTRAINT fk_codpedido FOREIGN KEY (codpedido) REFERENCES pedido (codpedido), 
-- CONSTRAINT fk_itempedido_produto FOREIGN KEY (codproduto) REFERENCES produto (codproduto)); 

-- INSERT INTO CLIENTE VALUES (1, 'Sylvio Barbon', TO_DATE('05/12/1984', 'DD/MM/YYYY'), 
-- '12315541212'); 
-- INSERT INTO CLIENTE VALUES (2, 'Antonio Carlos da Silva', TO_DATE('01/11/1970', 'DD/MM/YYYY'), 
-- '12313345512'); 
-- INSERT INTO CLIENTE VALUES (3, 'Thiago Ribeiro', TO_DATE('15/11/1964', 'DD/MM/YYYY'), 
-- '12315544411'); 
-- INSERT INTO CLIENTE VALUES (4, 'Carlos Eduardo', TO_DATE('25/10/1924', 'DD/MM/YYYY'), 
-- '42515541212'); 
-- INSERT INTO CLIENTE VALUES (5, 'Maria Cristina Goes', TO_DATE('03/11/1981', 'DD/MM/YYYY'), 
-- '67715541212'); 
-- INSERT INTO CLIENTE VALUES (6, 'Ruan Manoel Fanjo', TO_DATE('06/12/1983', 'DD/MM/YYYY'), 
-- '32415541212');INSERT INTO CLIENTE VALUES (7, 'Patrícia Marques', TO_DATE('01/02/1944', 'DD/MM/YYYY'), 
-- '77715541212'); 
-- INSERT INTO PRODUTO VALUES (1, 'Mouse'); 
-- INSERT INTO PRODUTO VALUES (2, 'Teclado'); 
-- INSERT INTO PRODUTO VALUES (3, 'Monitor LCD'); 
-- INSERT INTO PRODUTO VALUES (4, 'Caixas Acústicas'); 
-- INSERT INTO PRODUTO VALUES (5, 'Scanner de Mesa'); 
-- INSERT INTO PEDIDO VALUES (1, 1, TO_DATE('01/04/2012', 'DD/MM/YYYY'), '00001', 400.00); 
-- INSERT INTO ITEMPEDIDO VALUES (1, 1, 10.90, 1, 1); 
-- INSERT INTO ITEMPEDIDO VALUES (1, 2, 389.10, 1, 3); 
-- INSERT INTO PEDIDO VALUES (2, 2, TO_DATE('01/04/2012', 'DD/MM/YYYY'), '00002', 10.90); 
-- INSERT INTO ITEMPEDIDO VALUES (2, 1, 10.90, 1, 1); 
-- INSERT INTO PEDIDO VALUES (3, 2, TO_DATE('01/04/2012', 'DD/MM/YYYY'), '00003', 21.80); 
-- INSERT INTO ITEMPEDIDO VALUES (3, 1, 10.90, 1, 1); 
-- INSERT INTO PEDIDO VALUES (4, 3, TO_DATE('01/05/2012', 'DD/MM/YYYY'), '00004', 169.10); 
-- INSERT INTO ITEMPEDIDO VALUES (4, 1, 10.90, 1, 1); 
-- INSERT INTO ITEMPEDIDO VALUES (4, 2, 15.90, 2, 2); 
-- INSERT INTO ITEMPEDIDO VALUES (4, 3, 25.50, 1, 4); 
-- INSERT INTO ITEMPEDIDO VALUES (4, 4, 100.90, 1, 5); 
-- INSERT INTO PEDIDO VALUES (5, 4, TO_DATE('01/05/2012', 'DD/MM/YYYY'), '00005', 100.90); 
-- INSERT INTO ITEMPEDIDO VALUES (5, 1, 100.90, 1, 5); 
-- INSERT INTO PEDIDO VALUES (6, 6, TO_DATE('02/05/2012', 'DD/MM/YYYY'), '00006', 51.35); 
-- INSERT INTO ITEMPEDIDO VALUES (6, 1, 25.50, 2, 4);

-- create index idx_nome_cliente on cliente(nome);

-- create index idx_descricao_produtos on produto(descricao);

-- CREATE EXTENSION pg_trgm;
-- CREATE INDEX inx_obs ON pedido USING gin (obs gin_trgm_ops);

-- create unique index idx_unique_descricao_produtos on produto(descricao);

-- create unique index idx_unique_nome_cliente on cliente(nome);

-- create index idx_data_valor_pedido on pedido(datapedido, valortotal);

-- CREATE OR REPLACE VIEW CLIENTES_MAIORES_VIEW AS 
-- Select cliente.NOME, TRUNC((CURRENT_DATE- cliente.DATANASCIMENTO)/366) 
-- IDADE from cliente 
-- WHERE TRUNC((CURRENT_DATE - cliente.DATANASCIMENTO)/366) > 18;

create or replace view ULTIMO_PEDIDO_VIEW as
select c.nome, p.datapedido, p.valortotal
from cliente c
join pedido p on p.codcliente = c.codcliente
order by p.datapedido desc;

















