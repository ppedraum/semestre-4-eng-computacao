/*
INSERT INTO public.nf(
	id_nf, id_item, cod_prod, valor_unit, quantidade, desconto)
	VALUES 
	(1, 1, 1, 25, 10, 5),
	(1, 2, 2, 13.50, 3, 0),
	(1, 3, 3, 15, 2, 0),
	(1, 4, 4, 10, 1, 0),
	(2, 1, 3, 15, 4, 0),
	(2, 2, 4, 10, 5, 0),
	(2, 3, 5, 30, 7, 0),
	(3, 1, 1, 25, 5, 0),
	(3, 2, 4, 10, 4, 0),
	(3, 3, 5, 30, 10, 15),
	(3, 4, 2, 13.50, 7, 0),
	(4, 1, 5, 30, 10, 15),
	(4, 2, 4, 10, 12, 5),
	(4, 3, 1, 25, 13, 5),
	(4, 4, 2, 13.5, 15, 5),
	(5, 1, 3, 15, 3, 0),
	(5, 2, 5, 30, 6, 0),
	(6, 1, 1, 25, 22, 15),
	(6, 2, 3, 15, 25, 20),
	(7, 1, 1, 25, 10, 4),
	(7, 2, 2, 13.5, 10, 4),
	(7, 3, 3, 15, 10, 4),
	(7, 4, 5, 30, 10, 1);
*/

select * from nf;

-- a)
select id_nf, id_item, cod_prod, valor_unit from nf where desconto = 0.00;

-- b)
select id_nf, id_item, cod_prod, valor_unit,
(valor_unit - (valor_unit*desconto/100)) as valor_vendido
from nf where desconto > 0;

-- c)
-- update nf set desconto = 0 where desconto is null;

-- d)
select id_nf, id_item, cod_prod, valor_unit,
(quantidade * valor_unit) as valor_total,
desconto,
(valor_unit - (valor_unit*desconto/100)) as valor_vendido
from nf where desconto > 0;

-- e) Utilizando o group by para somar os valores com mesmo id_nf
select id_nf, sum(quantidade * valor_unit) as valor_total
from nf
group by id_nf
order by valor_total desc;

/*
f)
Pesquise o valor vendido das NF e ordene o resultado do maior valor para o menor. 
As colunas presentes no resultado da consulta são: ID_NF, VALOR_VENDIDO. 
OBS: O VALOR_TOTAL é obtido pela fórmula: ∑ QUANTIDADE * VALOR_UNIT. 
O VALOR_VENDIDO é igual a ∑ VALOR_UNIT - (VALOR_UNIT*(DESCONTO/100)). 
Agrupe o resultado da consulta por ID_NF.
*/

select 
	id_nf, 
	sum(quantidade * valor_unit) as valor_total,
	sum(valor_unit - (valor_unit * desconto / 100)) as valor_vendido
from nf
group by id_nf
order by valor_vendido desc;
	

/*
g)
Consulte o produto que mais vendeu no geral. 
As colunas presentes no resultado da consulta são: COD_PROD, QUANTIDADE. Agrupe o resultado da consulta por COD_PROD. 
*/

select 
	cod_prod, 
	sum(quantidade) as quantidade, 
	sum(quantidade * (valor_unit - (valor_unit * desconto / 100))) as valor_vendido
from nf
group by cod_prod
order by quantidade desc;

/*
h)
Consulte as NF que foram vendidas mais de 10 unidades de pelo menos um produto. 
As colunas presentes no resultado da consulta são: ID_NF, COD_PROD, QUANTIDADE. 
Agrupe o resultado da consulta por ID_NF, COD_PROD

Esse codigo n faz mta coisa alem de mostrar os produtos com qtd >= 10, pois so ha 1 codigo de produto
para cada nf no banco
*/

select id_nf, cod_prod, sum(quantidade) as qtd_prod
from nf
group by id_nf, cod_prod
having sum(quantidade) >= 10
order by id_nf;

/*
i)
Pesquise o valor total das NF, onde esse valor seja maior que 500, e ordene o resultado do maior valor para o menor. 
As colunas presentes no resultado da consulta são: ID_NF, VALOR_TOT. 
OBS: O VALOR_TOTAL é obtido pela fórmula: ∑ QUANTIDADE * VALOR_UNIT. 
Agrupe o resultado da consulta por ID_NF.

Podemos fazer isso utilizando o HAVING, porem deve haver um jeito de fazer com subqueries
*/

select id_nf, sum(quantidade * valor_unit) as valor_total
from nf
group by id_nf
having sum(quantidade * valor_unit) > 500
order by valor_total desc;

/*
j)
Qual o valor médio dos descontos dados por produto. 
As colunas presentes no resultado da consulta são: COD_PROD, MEDIA. Agrupe o resultado da consulta por COD_PROD
*/

select cod_prod, avg(desconto) as desconto_medio
from nf
group by cod_prod
order by desconto_medio desc;

/*
k)
 Qual o menor, maior e o valor médio dos descontos dados por produto. 
 As colunas presentes no resultado da consulta são: COD_PROD, MENOR, MAIOR, MEDIA. Agrupe o resultado da consulta por COD_PROD. 
*/

select cod_prod, min(desconto) as desc_min, max(desconto) as desc_max, avg(desconto) as  desc_medio
from nf
group by cod_prod
order by cod_prod;

/*
l)
Quais as NF que possuem mais de 3 itens vendidos. 
As colunas presentes no resultado da consulta são: ID_NF, QTD_ITENS. 
OBS:: NÃO ESTÁ RELACIONADO A QUANTIDADE VENDIDA DO ITEM E SIM A QUANTIDADE DE ITENS POR NOTA FISCAL. 
Agrupe o resultado da consulta por ID_NF.
*/

select n1.id_nf, count(1) as qtd_itens
from nf n1
group by n1.id_nf
having count(1) > 3
order by n1.id_nf;



