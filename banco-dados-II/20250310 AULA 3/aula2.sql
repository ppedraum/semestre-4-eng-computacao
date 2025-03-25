/*
insert into cidades values (1,'Criciúma','SC');

insert into cidades values (2,'Içara','SC');

insert into cidades values (3,'Porto Alegre','RS');

insert into cidades values (4,'Curitiba','PR');
*/

/*
insert into clientes values (1, 'Jorge', 10000.00, 1);
insert into clientes values (2, 'Pedro', 5000.00, 2);
insert into clientes values (3, 'Carlos', 3000.00, 3);
insert into clientes values (4, 'Ana', 20000.00, 4);
*/
-- SELECTS
select idcidade, nome, uf from cidades;

select c.idcliente, c.nome as nomecliente, ci.nome as nomecidade from clientes c join cidades ci on c.idcidade = ci.idcidade;

-- Selecionar todas as cidades sem clientes por meio de subqueries

select * from cidades ci where ci.idcidade not in (select distinct c.idcidade from clientes c);

-- Selecionar todas as cidades sem cliente por meio de join
-- Note que ao dar left join aparece cidades sem clientes, e nas colunas de clientes é tudo null.
-- Então é só dar um where c.idcidade is null e acha as cidades sem clientes

select ci.* from cidades ci left join clientes c on ci.idcidade = c.idcidade where c.idcidade is null;

-- Exists: Verificar o retorno de uma subquery, altera a query se existe registros ou não
select * from cidades ci where exists (select 1 from clientes c where c.idcidade = ci.idcidade);
select * from cidades ci where not exists (select 1 from clientes c where c.idcidade = ci.idcidade);

-- Mostra a cidade onde o idcidade não está no conjunto criado pela subquery (idcidade de todos os clientes)
select * from cidades ci where ci.idcidade not in (select c.idcidade from clientes c);
