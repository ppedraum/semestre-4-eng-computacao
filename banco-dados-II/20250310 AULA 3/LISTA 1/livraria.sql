INSERT INTO public.livraria (
	cnpj, nome, endereco, telefone)
	VALUES ('11111111000111','Livraria do Zé', 'Rua Teste, 321 - Comerciário, Criciúma - SC, Brasil', '5548911111111');

INSERT INTO public.cliente(
	cpf_cnpj, nome, endereco, telefone, cnpj_livraria)
	VALUES ('11111111111', 'Pedro', 'Rua Teste, 322 - Comerciário, Criciúma - SC, Brasil', '5548991805046', '11111111000111');

INSERT INTO public.editora(
	cnpj, endereco, telefone, nome_gerente)
	VALUES ('11111111000101', 'Rua Teste, 323 - Comerciário, Criciúma - SC, Brasil', '5548922222222', 'Carlos Eduardo');

INSERT INTO public.livro(
	id_livro, autor, assunto, isbn, qtd_estoque, cnpj_editora, cnpj_livraria)
	VALUES (1, 'JK Rowling', 'Harry Potter e a Pedra Filosofal', '1111111111111', 1, '11111111000101', '11111111000111');

INSERT INTO public.compra(
	id_compra, data, id_livro, cpf_cnpj_cliente)
	VALUES (1, '2024-03-11', 1, '11111111111');