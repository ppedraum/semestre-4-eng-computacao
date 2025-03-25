create group gerente;
create group atendente;
create group estagiario;


grant select, insert, update, delete on reserva to atendente with grant option; 
grant select, insert, update, delete on all tables in schema public to gerente with grant option;
create user joao password '123';
alter group gerente add user joao;