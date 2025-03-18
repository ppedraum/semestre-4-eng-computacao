/*
Permissões e Usuários
---------------------
Objetivo: Solucionar problemas inerentes do acesso a dados e sua segurança em um SGDB

Usuários e Grupos

create user teste1 password '123';
alter user teste1 rename to teste2;
*/

select idcargo, nome from cargos;

-- insert into cargos values (5, 'Analista de Banco de Dados');

select f.idfuncionario, f.nome, f.salario, f.idcargo, c.nome as nomecargo
from funcionarios f
inner join cargos c on f.idcargo = c.idcargo;

---Criando e definindo permissões---

-- create user pedro password '123456';

---Cria grupo---
-- create group estagiario;

---Adiciona o usuário pedro ao grupo estagiário---
-- alter group estagiario add user pedro;

---Adiciona a permissão de select e insert para o grupo estagiario (ou user) na tabela cargos---
-- grant select, insert on cargos to estagiario with grant option;

-- Os usuários e grupos não são guardadas no backup, sendo necessário cria-los para as permissões terem efeito no outro servidor 
-- Para apagar um usuário/grupo, é necessário apagar as permissões dele primeiro

-- Seleciona todos os usuários/grupos
select * from pg_user;
select * from pg_group;



