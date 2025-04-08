---- PERMISSOES

---- CEO
-- create group ceo;

-- grant pg_read_all_data to ceo;
-- grant pg_write_all_data to ceo;
-- create user ceo_pedro with password '123456';
-- alter group ceo add user ceo_pedro;

---- SUPRIMENTOS
-- create group suprimentos;
-- grant select, insert, update, delete on cidades, fornecedores, produtos, categorias, itens_entrada, entradas to suprimentos with grant option;
-- create user sup_joao with password '123456';
-- alter group suprimentos add user sup_joao;

---- COMERCIAL
-- create group comercial;
-- grant select, insert, update, delete on vendas, itens_venda to comercial with grant option;
-- create user com_tiago with password '123456';
-- alter group comercial add user com_tiago;


---- INDICES

-- create index idx_ien_for_codigo on itens_entrada (for_codigo);
-- create index idx_ent_data on entradas (ent_data);
-- create index idx_ven_data_hora on vendas (ven_data, ven_hora);
-- create unique index idx_cat_nome on categorias (cat_nome);
-- create unique index idx_pro_nome on produtos (pro_nome);

---- SELECTS

-- 1
select cat.* from categorias cat where cat.cat_codigo not in (select distinct pro.cat_codigo from produtos pro);

-- 2
select cat.cat_nome, pro.* from produtos pro
inner join categorias cat on cat.cat_codigo = pro.cat_codigo
where lower(cat.cat_nome) like 'a%';

-- 3
select cid.cid_nome, cid.cid_estado, fo.*
from fornecedores fo
inner join cidades cid on cid.cid_cep = fo.cid_cep
order by cid.cid_nome ASC, cid.cid_estado ASC, fo.for_nome ASC;

-- 4
select pro.*, cat.cat_nome, fo.for_nome, cid.cid_nome
from produtos pro
inner join categorias cat on cat.cat_codigo = pro.cat_codigo
inner join fornecedores fo on fo.for_codigo = pro.for_codigo
inner join cidades cid on cid.cid_cep = fo.cid_cep;

-- 5

select pro.pro_nome, ivn.ivn_qnt, ivn.ivn_preco_unitario, ivn.ivn_preco_total, cat.cat_nome, ven.ven_data, ven.ven_hora
from vendas ven
inner join itens_venda ivn on ivn.ven_codigo = ven.ven_codigo
inner join produtos pro on pro.pro_codigo = ivn.pro_codigo
inner join categorias cat on cat.cat_codigo = pro.cat_codigo
where ven.ven_data between '2025-03-01' and '2025-03-31'
order by ven.ven_data DESC, ven.ven_hora DESC, pro.pro_codigo, ivn.ivn_qnt;

-- 6

select ent.ent_codigo, pro.pro_nome, ien.ien_preco_venda, fo.for_nome, cat.cat_nome, ien.ien_qnt, ent.ent_data, ent.ent_hora
from entradas ent
inner join itens_entrada ien on ien.ent_codigo = ent.ent_codigo
inner join produtos pro on pro.pro_codigo = ien.pro_codigo
inner join fornecedores fo on fo.for_codigo = pro.for_codigo
inner join categorias cat on cat.cat_codigo = pro.cat_codigo
where ent.ent_data between '2025-03-01' and '2025-03-31'
order by ien.ien_qnt desc;

-- 7

select pro.pro_nome, sum(ien.ien_preco_total) as sum_preco_entradas, sum(ivn.ivn_preco_total) as sum_preco_vendas
from produtos pro
inner join itens_entrada ien on ien.pro_codigo = pro.pro_codigo
inner join itens_venda ivn on ivn.pro_codigo = pro.pro_codigo
where pro.pro_qnt > 0
group by pro.pro_nome;

-- 8

select fo.for_nome, pro.pro_nome, pro.pro_preco, count(ien.pro_codigo) as qtd_entradas, count(ivn.pro_codigo) as qtd_vendas
from produtos pro
inner join fornecedores fo on fo.for_codigo = pro.for_codigo
inner join itens_entrada ien on ien.pro_codigo = pro.pro_codigo
inner join entradas ent on ent.ent_codigo = ien.ent_codigo
inner join itens_venda ivn on ivn.pro_codigo = pro.pro_codigo
inner join vendas ven on ven.ven_codigo = ivn.ven_codigo
inner join cidades cid on cid.cid_cep = fo.cid_cep
where cid.cid_estado in ('RS','SC','PR')
and ven.ven_data between '2025-03-01' and '2025-03-31' 
and ent.ent_data between '2025-03-01' and '2025-03-31' 
group by pro.pro_nome, fo.for_nome;

-- 9

select pro.pro_codigo, pro.pro_nome, cat.cat_nome, sum(ivn.ivn_qnt) as sum_ivn_qnt
from itens_venda ivn
inner join produtos pro on pro.pro_codigo = ivn.pro_codigo
inner join categorias cat on cat.cat_codigo = pro.cat_codigo
group by pro.pro_codigo, pro.pro_nome, cat.cat_nome
having sum(ivn.ivn_qnt) > 500

-- 10

select cid.cid_nome, sum(ien.ien_qnt) as sum_ien_qnt
from itens_entrada ien
inner join entradas ent on ent.ent_codigo = ien.ent_codigo
inner join fornecedores fo on fo.for_codigo = ien.for_codigo
inner join cidades cid on cid.cid_cep = fo.cid_cep
where ent.ent_data between '2025-01-01' and '2025-12-31'
group by cid.cid_nome
order by sum_ien_qnt desc;














