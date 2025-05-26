CREATE TABLE produto(
 codproduto int,
 descricao varchar(100),
 quantidade int,
 CONSTRAINT pk2_produto PRIMARY KEY (codproduto)
);
CREATE TABLE cliente(
 codcliente int,
 nome varchar(60),
 datanascimento date,
 cpf varchar(11),
 CONSTRAINT pk2_cliente PRIMARY KEY (codcliente)
);
CREATE TABLE pedido (
 codpedido int,
 codcliente int,
 datapedido date,
 nf varchar(12),
 valortotal decimal(10,2),
 CONSTRAINT pk2_pedido PRIMARY KEY (codpedido),
 CONSTRAINT pk2_pedido_cliente FOREIGN KEY (codcliente) REFERENCES cliente(codcliente)
);
CREATE TABLE itempedido (
 codpedido int,
 numeroitem int,
 valorunitario decimal(10,2),
 quantidade int,
 codproduto int,
 CONSTRAINT pk2_itempedido PRIMARY KEY (codpedido, numeroitem),
 CONSTRAINT fk2_codpedido FOREIGN KEY (codpedido) REFERENCES pedido (codpedido),
 CONSTRAINT fk2_itempedido_produto FOREIGN KEY (codproduto) REFERENCES produto(codproduto)
);
CREATE TABLE log(
 codlog int,
 data date,
 descricao varchar(255),
 CONSTRAINT pk2_ex2_log PRIMARY KEY (codlog)
);
CREATE TABLE requisicao_compra(
 codrequisicaocompra int,
 codproduto int,
 data date,
 quantidade int,
 CONSTRAINT pk2_reqcompra PRIMARY KEY (codrequisicaocompra),
 CONSTRAINT fk2_reqcompra_produto FOREIGN KEY (codproduto) REFERENCES
produto(codproduto)
);
