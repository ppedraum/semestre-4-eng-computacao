-- EXERCÍCIOS

-- 1

create or replace function fn_baixar_estoque()
returns trigger as $$
begin

	update produto 
	set quantidade = quantidade - new.quantidade
	where codproduto = new.codproduto;

	return new;
end;
$$ language plpgsql;

create trigger trg_baixar_estoque
after insert on itempedido
for each row
execute function fn_baixar_estoque();

-- 2

create or replace function fn_insert_log_cliente()
returns trigger as $$
begin
	insert into "log"
	values (default, now(), "Insert cliente: " + new.codcliente);
end;
$$ language plpgsql;

create trigger trg_insert_log_cliente
after insert on cliente
for each row
execute function fn_insert_log_cliente();

-- 3

create or replace function fn_insert_log_produto()
returns trigger as $$
begin
	insert into "log"
	values (default, now(), "Insert produto: " + new.codproduto);
end;
$$ language plpgsql;

create trigger trg_insert_log_produto
after insert on produto
for each row
execute function fn_insert_log_produto();

-- 4

create function fn_insert_log_itempedido_sem_qtd()
returns trigger as $$
declare
	qtd_atual integer;
begin
	select quantidade into qtd_atual from produto where codproduto = new.codproduto;

	if new.quantidade > qtd_atual then
		insert into "log"
		values(default, now(), 'Erro: produto não possui a quandidade estabelecida para itempedido');

		raise exception 'Erro: produto não possui a quandidade estabelecida para itempedido';
	end if;

	return new;
end;
$$ language plpgsql;

create trigger trg_insert_log_itempedido_sem_qtd
before insert on itempedido
for each row
execute function fn_insert_log_itempedido_sem_qtd();

-- 5

create or replace function fn_insert_requisicao_compra_estoque_50_por_cento()
returns trigger as $$
declare
	media_mensal integer;
	qtd_estoque_atual integer;
begin

	select coalesce(sum(ip.quantidade), 0) into media_mensal
	from itempedido ip
	inner join pedido p on ip.codpedido = p.codpedido
	where ip.codproduto = new.codproduto
	and p.datapedido >= now() - interval '30 days';

	select quantidade into qtd_estoque_atual
	from produto
	where codprodto = new.codproduto;

	if media_mensal > 0 and qtd_estoque_atual <= (media_mensal / 2) then
		insert into requisicao_compra (codrequisicaocompra, codproduto, data, quantidade)
		values (default, new.codproduto, now(), media_mensal);
	end if;
	
	return new;
end;
$$ language plpgsql;

create trigger trg_insert_requisicao_compra_estoque_50_por_cento
after insert on itempedido
for each row
execute function fn_insert_requisicao_compra_estoque_50_por_cento();

-- 6

create or replace function fn_insert_log_delete_itempedido()
returns trigger as $$
begin
	insert into "log"
	values (default, now(), 'itempedido deletado');

	return old;
end;
$$ language plpgsql;

create trigger trg_insert_log_delete_itempedido
after delete on itempedido
for each row
execute function fn_insert_log_delete_itempedido();

-- 7

create or replace function fn_insert_log_pedido_maior_que_mil()
returns trigger as $$
declare
	valor_total integer;
begin
	select sum(ip.valorunitario * ip.quantidade) into valor_total
	from itempedido
	where ip.codpedido = new.codpedido;

	if valor_total > 1000 then
		insert into "log"
		values (default, now(), 'Pedido ' || new.codpedido || ' soma mais de mil reais');
	end if;

	return new;
end;
$$ language plpgsql;

-- 8

create trigger trg_insert_log_pedido_maior_que_mil
after insert on itempedido
for each row
execute function fn_insert_log_pedido_maior_que_mil();
		
create or replace function fn_impedir_qtd_negativa_itempedido()
returns trigger as $$
begin

	if new.quantidade < 0 then
		raise exception 'O valor da quantidade de itempedido deve ser maior ou igual a 0';
	end if;
	return new;
end;
$$ language plpgsql;

create trigger trg_impedir_qtd_negativa_itempedido
before insert on itempedido
for each row
execute function fn_impedir_qtd_negativa_itempedido();

-- 9

create or replace function fn_impedir_cadastro_nascimento_apos_data_atual()
returns trigger as $$
begin

	
	return new;
end;
$$ language plpgsql;

-- 10



-- 11

-- 12

create or replace function fn_inserir_prefixo_nome()
returns trigger as $$
begin

	if date_part('year',now()) - date_part('year', datanascimento) >= 30 then
		update cliente set nome = 'Sr(a) ' + nome where codcliente = new.codcliente;
	end if;
	return new;
end;
$$ language plpgsql;

create trigger trg_inserir_prefixo_nome
after insert on cliente
for each row
execute function fn_inserir_prefixo_nome();

-- 13

create or replace function fn_retornar_estoque_produto_delete_itempedido()
returns trigger as $$
begin

	update produto set quantidade = quantidade + old.quantidade
	where codproduto = old.codproduto;

	return old;
end;
$$ language plpgsql;

create trigger trg_retornar_estoque_produto_delete_itempedido
after delete on itempedido
for each row
execute function fn_retornar_estoque_produto_delete_itempedido();

-- 14

create or replace function fn_delete_requisicao_compra_on_delete_produto()
returns trigger as $$
begin
	delete from requisicao_compra where codproduto = old.codproduto;
	return old;
end;
$$ language plpgsql;

create trigger trg_delete_requisicao_compra_on_delete_produto
after delete on produto
for each row
execute function fn_delete_requisicao_compra_on_delete_produto();

-- 15

create or replace function fn_impedir_mesmo_produto_itempedido()
returns trigger as $$
declare 
	cod integer;
begin

	select codproduto into cod 
	from itempedido
	where codproduto = new.codproduto
	and codpedido = new.codpedido;

	if cod is not null then
		raise exception 'Ja existe um mesmo produto no pedido!';
	end if;

	return new;
end;
$$ language plpgsql;

create trigger trg_impedir_mesmo_produto_pedidoitem
before insert on itempedido
for each row
execute function fn_impedir_mesmo_produto_itempedido();









