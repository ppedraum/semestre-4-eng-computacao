/*
INSERT INTO public.nf(
	id_nf, id_item, cod_produto, valor_unit, quantidade, desconto_pct)
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
select id_nf, id_item, cod_produto, valor_unit from nf where desconto_pct = 0.00;

-- b)
select id_nf, id_item, cod_produto, valor_unit,
(valor_unit - (valor_unit*desconto_pct/100)) as valor_vendido
from nf where desconto_pct > 0;

-- c)
-- update nf set desconto_pct = 0 where desconto_pct is null;

-- d)
select id_nf, id_item, cod_produto, valor_unit,
(quantidade * valor_unit) as valor_total,
desconto_pct,
(valor_unit - (valor_unit*desconto_pct/100)) as valor_vendido
from nf where desconto_pct > 0;

-- e) Utilizando o group by para somar os valores com mesmo id_nf
select id_nf, sum(quantidade * valor_unit) as valor_total
from nf
group by id_nf
order by valor_total desc;

-- f)













