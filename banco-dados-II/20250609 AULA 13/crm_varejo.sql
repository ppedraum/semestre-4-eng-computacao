CREATE TABLE "clientes" (
  "cliente_id" serial PRIMARY KEY,
  "nome" varchar(100) NOT NULL,
  "cpf" char(11) NOT NULL,
  "data_nascimento" date NOT NULL,
  "endereco" varchar(100) NOT NULL
);

CREATE TABLE "contatos" (
  "contato_id" serial PRIMARY KEY,
  "email" varchar(100) NOT NULL,
  "telefone" varchar(15) NOT NULL,
  "linkedin" varchar(100),
  "instagram" varchar(100),
  "cliente_id" integer NOT NULL
);

CREATE TABLE "emails" (
  "email_id" serial PRIMARY KEY,
  "assunto" varchar(100) NOT NULL,
  "mensagem" text NOT NULL
);

CREATE TABLE "destinatarios" (
  "email_id" integer,
  "contato_id" integer,
  PRIMARY KEY ("email_id", "contato_id")
);

CREATE TABLE "reunioes" (
  "reuniao_id" serial PRIMARY KEY,
  "data_reuniao" date NOT NULL,
  "hora_reuniao" time NOT NULL,
  "assunto" varchar(100) NOT NULL
);

CREATE TABLE "funcionario_reuniao" (
  "reuniao_id" integer,
  "funcionario_id" integer,
  PRIMARY KEY ("reuniao_id", "funcionario_id")
);

CREATE TABLE "cliente_reuniao" (
  "reuniao_id" integer,
  "cliente_id" integer,
  PRIMARY KEY ("reuniao_id", "cliente_id")
);

CREATE TABLE "funcionarios" (
  "funcionario_id" serial PRIMARY KEY,
  "nome" varchar NOT NULL,
  "cpf" char(11) NOT NULL,
  "data_nascimento" date NOT NULL,
  "endereco" varchar(100) NOT NULL,
  "email" varchar(100) NOT NULL,
  "telefone" varchar(15) NOT NULL
);

CREATE TABLE "produtos" (
  "produto_id" serial PRIMARY KEY,
  "nome" varchar(100) NOT NULL,
  "descricao" text NOT NULL,
  "valor_unitario" numeric NOT NULL,
  "data_fabricacao" date NOT NULL,
  "data_validade" date
);

CREATE TABLE "historico_compras" (
  "historico_compras_id" serial PRIMARY KEY,
  "cliente_id" integer,
  "produto_id" integer,
  "data_compra" date NOT NULL,
  "quantidade" integer NOT NULL,
  "valor_total" numeric NOT NULL
);

ALTER TABLE "contatos" ADD FOREIGN KEY ("cliente_id") REFERENCES "clientes" ("cliente_id");

ALTER TABLE "destinatarios" ADD FOREIGN KEY ("email_id") REFERENCES "emails" ("email_id");

ALTER TABLE "destinatarios" ADD FOREIGN KEY ("contato_id") REFERENCES "contatos" ("contato_id");

ALTER TABLE "funcionario_reuniao" ADD FOREIGN KEY ("reuniao_id") REFERENCES "reunioes" ("reuniao_id");

ALTER TABLE "funcionario_reuniao" ADD FOREIGN KEY ("funcionario_id") REFERENCES "funcionarios" ("funcionario_id");

ALTER TABLE "cliente_reuniao" ADD FOREIGN KEY ("reuniao_id") REFERENCES "reunioes" ("reuniao_id");

ALTER TABLE "cliente_reuniao" ADD FOREIGN KEY ("cliente_id") REFERENCES "clientes" ("cliente_id");

ALTER TABLE "historico_compras" ADD FOREIGN KEY ("cliente_id") REFERENCES "clientes" ("cliente_id");

ALTER TABLE "historico_compras" ADD FOREIGN KEY ("produto_id") REFERENCES "produtos" ("produto_id");

INSERT INTO clientes (nome, cpf, data_nascimento, endereco) VALUES
('João Silva', '12345678901', '1985-03-15', 'Rua das Flores, 123'),
('Maria Oliveira', '23456789012', '1990-07-22', 'Av. Paulista, 1500'),
('Carlos Pereira', '34567890123', '1978-09-10', 'Rua das Laranjeiras, 200'),
('Ana Souza', '45678901234', '1982-01-05', 'Av. Brasil, 500'),
('Fernanda Lima', '56789012345', '1995-06-17', 'Rua do Sol, 45'),
('Ricardo Gomes', '67890123456', '1989-11-23', 'Alameda Santos, 100'),
('Patricia Martins', '78901234567', '1992-02-28', 'Rua das Acácias, 77'),
('Bruno Fernandes', '89012345678', '1984-08-14', 'Av. Ipiranga, 300'),
('Luciana Alves', '90123456789', '1977-12-30', 'Rua das Palmeiras, 150'),
('Marcos Costa', '01234567890', '1980-04-02', 'Av. dos Bandeirantes, 400');

INSERT INTO contatos (email, telefone, linkedin, instagram, cliente_id) VALUES
('joao.silva@email.com', '11999998888', 'linkedin.com/in/joaosilva', '@joaosilva', 1),
('maria.oliveira@email.com', '11988887777', NULL, '@mariaoliveira', 2),
('carlos.pereira@email.com', '11977776666', 'linkedin.com/in/carlospereira', NULL, 3),
('ana.souza@email.com', '11966665555', NULL, '@anasouza', 4),
('fernanda.lima@email.com', '11955554444', 'linkedin.com/in/fernandalima', '@fernandalima', 5),
('ricardo.gomes@email.com', '11944443333', NULL, NULL, 6),
('patricia.martins@email.com', '11933332222', 'linkedin.com/in/patriciamartins', '@patriciam', 7),
('bruno.fernandes@email.com', '11922221111', NULL, '@brunofernandes', 8),
('luciana.alves@email.com', '11911110000', 'linkedin.com/in/lucianaalves', NULL, 9),
('marcos.costa@email.com', '11900009999', NULL, '@marcoscosta', 10);

INSERT INTO emails (assunto, mensagem) VALUES
('Promoção de Verão', 'Confira nossas promoções exclusivas para o verão!'),
('Novo Produto', 'Apresentamos o lançamento do nosso novo produto.'),
('Pesquisa de Satisfação', 'Queremos ouvir sua opinião para melhorar nossos serviços.'),
('Convite para Evento', 'Você está convidado para nosso evento anual.'),
('Oferta Relâmpago', 'Aproveite descontos especiais por tempo limitado.'),
('Atualização de Política', 'Atualizamos nossa política de privacidade.'),
('Boas Festas', 'Desejamos um feliz fim de ano para você e sua família!'),
('Lançamento de Aplicativo', 'Conheça nosso novo aplicativo móvel.'),
('Novidades da Empresa', 'Confira as últimas notícias da nossa empresa.'),
('Obrigado pela Preferência', 'Agradecemos sua confiança e parceria.');

INSERT INTO destinatarios (email_id, contato_id) VALUES
(1, 1), (1, 2), (2, 3), (2, 4), (3, 5),
(3, 6), (4, 7), (5, 8), (6, 9), (7, 10);

INSERT INTO reunioes (data_reuniao, hora_reuniao, assunto) VALUES
('2025-06-10', '14:00:00', 'Reunião com cliente João Silva'),
('2025-06-11', '10:00:00', 'Reunião sobre novo produto'),
('2025-06-12', '09:00:00', 'Planejamento de marketing'),
('2025-06-13', '15:30:00', 'Avaliação de desempenho'),
('2025-06-14', '11:00:00', 'Reunião estratégica'),
('2025-06-15', '13:00:00', 'Treinamento equipe vendas'),
('2025-06-16', '16:00:00', 'Feedback clientes'),
('2025-06-17', '10:30:00', 'Apresentação de resultados'),
('2025-06-18', '09:30:00', 'Definição de metas'),
('2025-06-19', '14:30:00', 'Reunião de parceiros');

INSERT INTO funcionarios (nome, cpf, data_nascimento, endereco, email, telefone) VALUES
('Ana Pereira', '34567890123', '1980-12-05', 'Rua das Laranjeiras, 200', 'ana.pereira@empresa.com', '11977776666'),
('Carlos Souza', '45678901234', '1975-08-18', 'Av. Brasil, 500', 'carlos.souza@empresa.com', '11966665555'),
('Mariana Silva', '56789012345', '1990-03-22', 'Rua do Sol, 120', 'mariana.silva@empresa.com', '11955554444'),
('Felipe Costa', '67890123456', '1987-11-10', 'Alameda Santos, 250', 'felipe.costa@empresa.com', '11944443333'),
('Renata Lima', '78901234567', '1985-09-05', 'Rua das Acácias, 78', 'renata.lima@empresa.com', '11933332222'),
('João Pedro', '89012345678', '1992-02-18', 'Av. Ipiranga, 305', 'joao.pedro@empresa.com', '11922221111'),
('Patrícia Alves', '90123456789', '1983-07-27', 'Rua das Palmeiras, 155', 'patricia.alves@empresa.com', '11911110000'),
('Lucas Fernandes', '01234567890', '1979-06-14', 'Av. dos Bandeirantes, 405', 'lucas.fernandes@empresa.com', '11900009999'),
('Sofia Rocha', '11223344556', '1991-12-30', 'Rua Nova, 99', 'sofia.rocha@empresa.com', '11988887777'),
('Gustavo Moreira', '22334455667', '1986-08-08', 'Av. Central, 210', 'gustavo.moreira@empresa.com', '11977776666');

INSERT INTO funcionario_reuniao (reuniao_id, funcionario_id) VALUES
(1, 1), (1, 2), (2, 3), (2, 4), (3, 5),
(4, 6), (5, 7), (6, 8), (7, 9), (8, 10);

INSERT INTO cliente_reuniao (reuniao_id, cliente_id) VALUES
(1, 1), (2, 2), (3, 3), (4, 4), (5, 5),
(6, 6), (7, 7), (8, 8), (9, 9), (10, 10);

INSERT INTO produtos (nome, descricao, valor_unitario, data_fabricacao, data_validade) VALUES
('Smartphone', 'Smartphone com tela de 6.5 polegadas, 128GB', 2500.00, '2025-01-15', '2027-01-15'),
('Notebook', 'Notebook com processador i7, 16GB RAM', 4500.00, '2024-11-20', NULL),
('Fone de Ouvido', 'Fone bluetooth com cancelamento de ruído', 350.00, '2025-02-10', NULL),
('Smartwatch', 'Relógio inteligente com monitor cardíaco', 1200.00, '2025-03-05', NULL),
('Tablet', 'Tablet com 10 polegadas e 64GB', 1800.00, '2024-12-01', NULL),
('Câmera Digital', 'Câmera com 20MP e gravação 4K', 2700.00, '2025-04-10', NULL),
('Teclado Gamer', 'Teclado mecânico RGB', 450.00, '2025-01-20', NULL),
('Mouse Gamer', 'Mouse ergonômico com DPI ajustável', 300.00, '2025-05-15', NULL),
('Monitor FHD', 'Monitor 24 polegadas Full HD', 900.00, '2024-10-10', NULL),
('Impressora', 'Impressora multifuncional a laser', 1500.00, '2025-03-25', NULL);

INSERT INTO historico_compras (cliente_id, produto_id, data_compra, quantidade, valor_total) VALUES
(1, 1, '2025-05-30', 1, 2500.00),
(2, 2, '2025-05-25', 1, 4500.00),
(3, 3, '2025-06-01', 2, 700.00),
(4, 4, '2025-06-02', 1, 1200.00),
(5, 5, '2025-06-03', 1, 1800.00),
(6, 6, '2025-06-04', 1, 2700.00),
(7, 7, '2025-06-05', 1, 450.00),
(8, 8, '2025-06-06', 3, 900.00),
(9, 9, '2025-06-07', 1, 900.00),
(10, 10, '2025-06-08', 1, 1500.00);
