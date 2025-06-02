CREATE TABLE bancos (
    idbanco SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL
);


CREATE TABLE fornecedores (
    idfornecedor SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    telefone VARCHAR(20),
    email VARCHAR(100)
);


CREATE TABLE contacorrente (
    idconta SERIAL PRIMARY KEY,
    idbanco INTEGER NOT NULL,
    numeroconta VARCHAR(20) NOT NULL,
    digitoconta VARCHAR(5),
    saldoinicial NUMERIC(15, 2) NOT NULL,
    saldoatual NUMERIC(15, 2) NOT NULL,
    
    CONSTRAINT fk_banco
        FOREIGN KEY (idbanco)
        REFERENCES bancos(idbanco)
        ON DELETE RESTRICT
        ON UPDATE CASCADE
);


CREATE TABLE contaspagar (
    idcontapagar INTEGER NOT NULL,
    parcela INTEGER NOT NULL,
    idfornecedor INTEGER NOT NULL,
    datadigitacao DATE NOT NULL,
    datavencimento DATE NOT NULL,
    valorconta NUMERIC(15, 2) NOT NULL,
    status VARCHAR(10) NOT NULL CHECK (status IN ('Aberto', 'Pago')),
    observacao TEXT,

    CONSTRAINT pk_contaspagar PRIMARY KEY (idcontapagar, parcela),

    CONSTRAINT fk_fornecedor
        FOREIGN KEY (idfornecedor)
        REFERENCES fornecedores(idfornecedor)
        ON DELETE RESTRICT
        ON UPDATE CASCADE
);

CREATE TABLE pagamentos (
    idpagamento SERIAL PRIMARY KEY,
    idcontapagar INTEGER NOT NULL,
    parcela INTEGER NOT NULL,
    datapagamento DATE NOT NULL,
    valorpago NUMERIC(15, 2) NOT NULL,
    idcontacorrente INTEGER NOT NULL,

    CONSTRAINT fk_contaspagar
        FOREIGN KEY (idcontapagar, parcela)
        REFERENCES contaspagar(idcontapagar, parcela)
        ON DELETE RESTRICT
        ON UPDATE CASCADE,

    CONSTRAINT fk_contacorrente
        FOREIGN KEY (idcontacorrente)
        REFERENCES contacorrente(idconta)
        ON DELETE RESTRICT
        ON UPDATE CASCADE
);

CREATE TABLE movimentofinanceiro (
    idmovto SERIAL PRIMARY KEY,
    datamovto DATE NOT NULL,
    hora TIME NOT NULL,
    valor NUMERIC(15, 2) NOT NULL,
    idrecebepagtoorigem INTEGER NOT NULL,
    tabelaorigem VARCHAR(50) NOT NULL,
    tipo VARCHAR(10) NOT NULL CHECK (tipo IN ('Entrada', 'SaÃ­da'))
);



INSERT INTO bancos (nome) VALUES
('Banco do Brasil'),
('Caixa EconÃ´mica Federal'),
('Bradesco'),
('ItaÃº Unibanco'),
('Santander');


INSERT INTO contacorrente (idbanco, numeroconta, digitoconta, saldoinicial, saldoatual) VALUES
(1, '123456', '0', 10000.00, 10000.00),
(2, '654321', '1', 5000.00, 4500.50),
(3, '112233', '2', 20000.00, 19800.75),
(4, '998877', '3', 15000.00, 14900.00),
(5, '445566', '4', 7500.00, 7400.00);


INSERT INTO fornecedores (nome, telefone, email) VALUES
('Fornecedor A', '(11) 91234-1111', 'contato@fornecedora.com'),
('Fornecedor B', '(21) 92345-2222', 'contato@fornecedorb.com'),
('Fornecedor C', '(31) 93456-3333', 'contato@fornecedorc.com'),
('Fornecedor D', '(41) 94567-4444', 'contato@fornecedord.com'),
('Fornecedor E', '(51) 95678-5555', 'contato@fornecedore.com'),
('Fornecedor F', '(61) 96789-6666', 'contato@fornecedorf.com'),
('Fornecedor G', '(71) 97890-7777', 'contato@fornecedorg.com'),
('Fornecedor H', '(81) 98901-8888', 'contato@fornecedorh.com'),
('Fornecedor I', '(91) 99012-9999', 'contato@fornecedori.com'),
('Fornecedor J', '(11) 90123-0000', 'contato@fornecedorj.com');

INSERT INTO contaspagar (
    idcontapagar, parcela, idfornecedor, datadigitacao, datavencimento, valorconta, status, observacao
) VALUES
(1, 1, 1, '2025-06-01', '2025-06-10', 1800.00, 'Aberto', 'Parcela Ãºnica fornecedor 1'),
(2, 1, 1, '2025-06-02', '2025-06-15', 2200.00, 'Aberto', 'Parcela Ãºnica fornecedor 1'),
(3, 1, 1, '2025-06-03', '2025-06-20', 2000.00, 'Aberto', 'Parcela Ãºnica fornecedor 1'),
(4, 1, 1, '2025-06-04', '2025-06-25', 2100.00, 'Aberto', 'Parcela Ãºnica fornecedor 1'),
(5, 1, 1, '2025-06-05', '2025-06-30', 1900.00, 'Aberto', 'Parcela Ãºnica fornecedor 1'),

(6, 1, 2, '2025-06-01', '2025-06-10', 2500.00, 'Aberto', 'Parcela Ãºnica fornecedor 2'),
(7, 1, 2, '2025-06-02', '2025-06-15', 2700.00, 'Aberto', 'Parcela Ãºnica fornecedor 2'),
(8, 1, 2, '2025-06-03', '2025-06-20', 2600.00, 'Aberto', 'Parcela Ãºnica fornecedor 2'),
(9, 1, 2, '2025-06-04', '2025-06-25', 2800.00, 'Aberto', 'Parcela Ãºnica fornecedor 2'),
(10, 1, 2, '2025-06-05', '2025-06-30', 2400.00, 'Aberto', 'Parcela Ãºnica fornecedor 2');


INSERT INTO contaspagar (
    idcontapagar, parcela, idfornecedor, datadigitacao, datavencimento, valorconta, status, observacao
) VALUES
(11, 1, 3, '2025-06-06', '2025-07-05', 2300.00, 'Aberto', 'Conta Ãºnica fornecedor 3'),
(12, 1, 4, '2025-06-07', '2025-07-10', 2100.00, 'Aberto', 'Conta Ãºnica fornecedor 4'),
(13, 1, 5, '2025-06-08', '2025-07-15', 2200.00, 'Aberto', 'Conta Ãºnica fornecedor 5'),
(14, 1, 6, '2025-06-09', '2025-07-20', 2500.00, 'Aberto', 'Conta Ãºnica fornecedor 6'),
(15, 1, 7, '2025-06-10', '2025-07-25', 2400.00, 'Aberto', 'Conta Ãºnica fornecedor 7'),
(16, 1, 8, '2025-06-11', '2025-07-30', 2600.00, 'Aberto', 'Conta Ãºnica fornecedor 8'),
(17, 1, 9, '2025-06-12', '2025-08-05', 2700.00, 'Aberto', 'Conta Ãºnica fornecedor 9'),
(18, 1, 10, '2025-06-13', '2025-08-10', 2800.00, 'Aberto', 'Conta Ãºnica fornecedor 10');