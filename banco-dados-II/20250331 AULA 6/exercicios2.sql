/*
create group chefes;
create group atendentes;
create group estagiarios;
create group gerentes;

create user chefe_joao;
create user atendente_jose;
create user estagiario_pedro;

grant pg_read_all_data to gerentes;
grant pg_write_all_data to gerentes;

grant insert, select, update, delete on alas, enfermeiros, atendimentos to chefes with grant option;
grant insert, select, update, delete on medicos, especialidades, pacientes, atendimentos to atendentes with grant option;

create unique index idx_cre on enfermeiros (cre);
create unique index idx_crm on medicos (crm);
create unique index idx_nome on planosaude (nome);

create index idx_nome_pacientes on pacientes (nome);
create index idx_data_hora_atendimento on atendimentos (data, hora);

INSERT INTO public.hospitais (idhospital, nome, cnpj)
VALUES 
    (1, 'Hospital Santa Luzia', '12345678901234'),
    (2, 'Hospital São José', '98765432109876'),
    (3, 'Hospital Vida Nova', '56789012345678');

INSERT INTO public.planosaude (idplano, nome, telefone, idhospital)
VALUES 
    (1, 'Unimed', '48991234567', 1),
    (2, 'Amil', '48987654321', 1),
    (3, 'Bradesco', '48999887766', 1),
    (4, 'SulAmérica', '48991112233', 1),
    (5, 'Porto', '48994445566', 1),
    (6, 'Hapvida', '48993334455', 1),
    (7, 'NotreDame', '48990001122', 1),
    (8, 'Intermédica', '48992223344', 1),
    (9, 'BioVida', '48995556677', 1),
    (10, 'MedSul', '48997778899', 1);


INSERT INTO public.especialidades (idespecialidade, nome)
VALUES 
    (1, 'Cardiologia'),
    (2, 'Ortopedia'),
    (3, 'Pediatria'),
    (4, 'Ginecologia'),
    (5, 'Dermatologia'),
    (6, 'Neurologia'),
    (7, 'Oftalmologia'),
    (8, 'Psiquiatria'),
    (9, 'Gastroenterologia'),
    (10, 'Endocrinologia');


INSERT INTO public.alas (idala, idhospital, nome)
VALUES 
    (1, 1, 'Ala de Cardiologia'),
    (2, 1, 'Ala de Ortopedia'),
    (3, 1, 'Ala de Pediatria'),
    (4, 1, 'Ala de Ginecologia'),
    (5, 1, 'Ala de Neurologia');



INSERT INTO public.enfermeiros (idenfermeiro, nome, chefe, cre, idala)
VALUES 
    (1, 'Ana Souza', 'Sim', 'CRE001', 1),    -- Chefe
    (2, 'Bruna Lima', 'Não', 'CRE002', 1),       -- Não chefe
    (3, 'Carla Ribeiro', 'Não', 'CRE003', 1);    -- Não chefe

-- Ala 2
INSERT INTO public.enfermeiros (idenfermeiro, nome, chefe, cre, idala)
VALUES 
    (4, 'Daniela Mendes', 'Sim', 'CRE004', 2),  -- Chefe
    (5, 'Elen Santos', 'Não', 'CRE005', 2),        -- Não chefe
    (6, 'Fernanda Costa', 'Não', 'CRE006', 2);     -- Não chefe

-- Ala 3
INSERT INTO public.enfermeiros (idenfermeiro, nome, chefe, cre, idala)
VALUES 
    (7, 'Gabriela Pinto', 'Sim', 'CRE007', 3),  -- Chefe
    (8, 'Helena Silva', 'Não', 'CRE008', 3),       -- Não chefe
    (9, 'Isabela Castro', 'Não', 'CRE009', 3);     -- Não chefe

-- Ala 5
INSERT INTO public.enfermeiros (idenfermeiro, nome, chefe, cre, idala)
VALUES 
    (10, 'Juliana Lopes', 'Sim', 'CRE010', 5),  -- Chefe
    (11, 'Karen Nunes', 'Não', 'CRE011', 5),      -- Não chefe
    (12, 'Luana Almeida', 'Não', 'CRE012', 5);    -- Não chefe

-- Ala 4
INSERT INTO public.enfermeiros (idenfermeiro, nome, chefe, cre, idala)
VALUES 
    (13, 'Juliana Moraes', 'Sim', 'CRE013', 4),  -- Chefe
    (14, 'Carlos Alberto', 'Não', 'CRE014', 4),       -- Não chefe
    (15, 'José Castro', 'Não', 'CRE015', 4);     -- Não chefe


INSERT INTO public.medicos (idmedico, nome, crm, idespecialidade)
VALUES 
    (1, 'Dr. Carlos Cardoso', 'CRM001', 1),  -- Cardiologia
    (2, 'Dr. Paulo Oliveira', 'CRM002', 2),  -- Ortopedia
    (3, 'Dra. Mariana Costa', 'CRM003', 3),  -- Pediatria
    (4, 'Dra. Fernanda Silva', 'CRM004', 4), -- Ginecologia
    (5, 'Dr. Bruno Almeida', 'CRM005', 5),   -- Dermatologia
    (6, 'Dra. Camila Rocha', 'CRM006', 6),   -- Neurologia
    (7, 'Dr. Rafael Mendes', 'CRM007', 7),   -- Oftalmologia
    (8, 'Dra. Julia Lima', 'CRM008', 8),     -- Psiquiatria
    (9, 'Dr. Henrique Vasconcelos', 'CRM009', 9), -- Gastroenterologia
    (10, 'Dra. Patrícia Souza', 'CRM010', 10); -- Endocrinologia


-- Associando todos os médicos ao Plano 1 (Unimed)
INSERT INTO public.planosmedicos (idplano, idmedico)
VALUES 
    (1, 1),  -- Dr. Carlos Cardoso (Cardiologia)
    (1, 2),  -- Dr. Paulo Oliveira (Ortopedia)
    (1, 3),  -- Dra. Mariana Costa (Pediatria)
    (1, 4),  -- Dra. Fernanda Silva (Ginecologia)
    (1, 5),  -- Dr. Bruno Almeida (Dermatologia)
    (1, 6),  -- Dra. Camila Rocha (Neurologia)
    (1, 7),  -- Dr. Rafael Mendes (Oftalmologia)
    (1, 8),  -- Dra. Julia Lima (Psiquiatria)
    (1, 9),  -- Dr. Henrique Vasconcelos (Gastroenterologia)
    (1, 10); -- Dra. Patrícia Souza (Endocrinologia)

INSERT INTO public.pacientes (idpaciente, nome, datanascimento, telefone)
VALUES 
    (1, 'João Silva', '1985-04-12', '48991122334'),
    (2, 'Maria Oliveira', '1990-07-22', '48992233445'),
    (3, 'Carlos Pereira', '1978-11-30', '48993344556'),
    (4, 'Ana Souza', '1995-01-18', '48994455667'),
    (5, 'Bruna Costa', '2000-03-25', '48995566778'),
    (6, 'Pedro Almeida', '1983-08-05', '48996677889'),
    (7, 'Luciana Martins', '1992-09-14', '48997788990'),
    (8, 'Ricardo Santos', '1988-12-03', '48998899001'),
    (9, 'Juliana Lima', '1997-06-19', '48999900112'),
    (10, 'Felipe Rocha', '1994-10-29', '48991122345');


INSERT INTO public.atendimentos (idatendimento, data, hora, valor, idplano, status, idmedico, idpaciente)
VALUES 
    (1, '2025-03-15', '09:00:00', 250.000, 1, 'Aberto', 1, 1),   -- Plano 1, Médico 1, Paciente 1
    (2, '2025-03-15', '09:30:00', 150.000, 2, 'Aberto', 2, 2),   -- Plano 2, Médico 2, Paciente 2
    (3, '2025-03-15', '10:00:00', 200.000, 1, 'Aberto', 3, 3),   -- Plano 1, Médico 3, Paciente 3
    (4, '2025-03-15', '10:30:00', 180.000, 1, 'Aberto', 4, 4),   -- Plano 1, Médico 4, Paciente 4
    (5, '2025-03-15', '11:00:00', 220.000, 2, 'Aberto', 5, 5),   -- Plano 2, Médico 5, Paciente 5
    (6, '2025-03-15', '11:30:00', 210.000, 1, 'Aberto', 6, 6),   -- Plano 1, Médico 6, Paciente 6
    (7, '2025-03-15', '12:00:00', 240.000, 2, 'Aberto', 7, 7),   -- Plano 2, Médico 7, Paciente 7
    (8, '2025-03-15', '12:30:00', 230.000, 1, 'Aberto', 8, 8),   -- Plano 1, Médico 8, Paciente 8
    (9, '2025-03-15', '13:00:00', 210.000, 2, 'Aberto', 9, 9),   -- Plano 2, Médico 9, Paciente 9
    (10, '2025-03-15', '13:30:00', 180.000, 1, 'Aberto', 10, 10), -- Plano 1, Médico 10, Paciente 10
    (11, '2025-03-16', '09:00:00', 250.000, 1, 'Aberto', 1, 2),   -- Plano 1, Médico 1, Paciente 2
    (12, '2025-03-16', '09:30:00', 150.000, 2, 'Aberto', 2, 3),   -- Plano 2, Médico 2, Paciente 3
    (13, '2025-03-16', '10:00:00', 200.000, 1, 'Aberto', 3, 4),   -- Plano 1, Médico 3, Paciente 4
    (14, '2025-03-16', '10:30:00', 180.000, 1, 'Aberto', 4, 5),   -- Plano 1, Médico 4, Paciente 5
    (15, '2025-03-16', '11:00:00', 220.000, 2, 'Aberto', 5, 6);   -- Plano 2, Médico 5, Paciente 6
*/
-- 5

-- a
select a.*, e.nome 
from alas a 
inner join enfermeiros e on e.idala = a.idala
where e.chefe = 'Sim';

-- b
select m.*, e.nome 
from medicos m 
inner join especialidades e on e.idespecialidade = m.idespecialidade;

--c
select p.*, h.nome from planosaude p 
inner join hospitais h on h.idhospital = p.idhospital
where h.idhospital = 1;

--d
select m.*, ps.nome as nomeplano, e.nome as nomeespecialidade
from planosmedicos pm
inner join planosaude ps on ps.idplano = pm.idplano
inner join medicos m on m.idmedico = pm.idmedico
inner join especialidades e on e.idespecialidade = m.idespecialidade
order by ps.nome, e.nome, m.nome;

--e
select count(*) as qtdmedicos, e.nome 
from medicos m
inner join especialidades e on e.idespecialidade = m.idespecialidade
group by e.nome
order by e.nome, count(*) desc;

--f
select e.* from especialidades e
where not exists(
	select idmedico from medicos m 
	where m.idespecialidade = e.idespecialidade
)

--g
-- Terminar


















