
-- Cria o index (pesquisas com o campo nome vão ser muito mais rapidas)
-- O indice padrão é b-tree, que serve para todos os tipos 

-- Chaves primárias e estrangeiras são índices, portanto, tem todas as qualidades do índice normal

-- create index idx_nome on clientes (nome);


-- Índice GIN
-- Mais otimizados para varchar, porém consome mais espaço de armazenamento e não podem ser utilizados em outros tipos

-- create extension pg_trgm;
-- create index idx_descricao on contas_a_receber using gin (descricao gin_trgm_ops);


-- Índices múltiplos
-- Utiliza vários campos para criar o índice (só adianta se utilizar os dois campos na pesquisa)
-- Nesse exemplo o primeiro campo a aparecer no select entre os dois do index deve ser o valor e data_vencimento
-- deve estar logo depois
-- Também é bom colocar sempre os campos indice primeiro no select antes dos campos sem indices

-- create index idx_valor_vencimento on contas_a_receber (valor, data_vencimento);


-- Índex único
-- Serve para reforçar a exclusividade da coluna, não podendo ter mais de uma linha com o mesmo valor de campo
-- Além disso também funciona como um indice normal, sendo mais rapido de pesquisar

-- create unique index idx_cnpj on clientes (cnpj);


-- Com um banco de dados cada vez maior, pode ocorrer um index bloat, um excesso de valores de índices que atrasa 
-- ou compromete o banco, deixando-o muito pesado.
-- Fazendo backup do banco de dados e restaurando, os valores de índices são apagados, arrumando o index bloat.


/*
Tipos de Dados

Inteiros:
smallint (2B)
integer  (4B)
bigin    (8B)

fracionais:
decimal
numeric
real   (4B com 6 casas decimais)
double (8B com 15 casas decimais)

caracter:
varchar ou character varying (dinâmico)
character ou char(fixo)
text (limitado não variável)

Data e hora
date
time (with / without time zone)
timestamp (with / without time zone)

Bytea - Array de bytes (armazenar imagens, textos, documentos, etc.)


*/



