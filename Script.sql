----------------------BANCO DE DADOS--------------------------

create database sistema_odontologico;

--------------------------TABELAS-----------------------------


create table paciente(
    id_paciente serial primary key,
    nome_completo varchar(100) not null,
    cpf varchar(11) UNIQUE not null,
    data_nascimento date not null,
    telefone varchar(11) not null,
    email varchar(100) not null,
    endereco varchar(200) not null,
    historico_consulta int default 0
);

create table dentista(
    id_dentista serial primary key,
    nome_completo varchar(100) not null,
    cpf varchar(11) unique not null,
    cro varchar(20) unique not null,
    especialidade varchar(50) not null
);

create table consulta(
    id_consulta serial primary key,
    id_paciente int not null,
    id_dentista int not null,
    data_consulta date not null,
    hora_consulta time not null,
    descricao varchar(100),
    status varchar(20) default 'agendada',
    prescricao text,
    foreign key (id_paciente) references paciente(id_paciente),
    foreign key (id_dentista) references dentista(id_dentista)
);

create table procedimento(
	id_procedimento serial primary key,
	nome_procedimento varchar(100),
	descricao varchar(200),
	duracao_media varchar(20)
);


-----------------------------INSERTS--------------------------------


insert into paciente(nome_completo, cpf, data_nascimento, telefone, email, endereco)
values
('Pâmela de Freitas', '11111111111', '1989-04-25', '24988882019', 'pam@gmail.com', 'Rua Thouzet, 600 - Petrópolis'),
('João Pedro Dias', '22222252222', '2007-06-30', '24977778937', 'joao@gmail.com', 'Rua Correas, 500 - Petrópolis'),
('Matheus Vasconcelos', '3323433333', '1999-06-29', '24966667913', 'matheus@gmail.com', 'Rua Cel Veiga, 888 - Petrópolis'),
('Fernanda Alves', '44444444444', '2008-01-30', '24955551364', 'fernanda@gmail.com', 'Rua Quitandinha, 777 - Petrópolis'),
('Daniele Souza', '55555555555', '1982-09-14', '24944442703', 'dani@gmail.com', 'Rua Bingen, 650 - Petrópolis'),
('Roberto Silva', '4452444444', '1988-05-03', '24933333879', 'roberto@gmail.com', 'Rua Siméria, 49 - Petrópolis'),
('Juliana Lima', '33333333333', '1992-12-18', '24922229713', 'juliana@gmail.com', 'Rua São Sebastião, 500 - Petrópolis'),
('Fernando Costa', '22222334222', '1975-04-27', '24911110390', 'fernando@gmail.com', 'Av Barão do Rio Branco, 19 - Petrópolis'),
('Lucia Santos', '10010010010', '1987-08-11', '24900002404', 'lucia@gmail.com', 'Rua Nova, 369 - Petrópolis'),
('Mario Oliveira', '20020020020', '1993-06-25', '24898765432', 'mario@gmail.com', 'Rua Mosela, 479 - Petrópolis');

select * from paciente


insert into dentista(nome_completo, cpf, cro, especialidade)
values
('Dr. Carlos Alberto Ferreira', '11122233344', 'RJ-12345', 'Ortodontia'),
('Dra. Mariana Santos Silva', '22233344455', 'RJ-23456', 'Endodontia'),
('Dr. Rafael Costa Lima', '33344455566', 'RN-34567', 'Implantodontia'),
('Dra. Patricia Oliveira Santos', '44455566677', 'AM-45678', 'Periodontia'),
('Dr. Leonardo Alves Costa', '55566677788', 'PR-56789', 'Ortodontia'),
('Dra. Fernanda Lima Souza', '66677788899', 'MT-67890', 'Odontopediatria'),
('Dr. Eduardo Santos Oliveira', '77788899900', 'RJ-78901', 'Cirurgia Oral'),
('Dra. Gabriela Costa Silva', '88899900011', 'SP-89012', 'Estética'),
('Dr. Marcelo Ferreira Lima', '99900011122', 'SP-90123', 'Prótese'),
('Dra. Amanda Silva Santos', '00011122233', 'SP-01234', 'Clínica Geral');

select * from dentista


insert into consulta(id_paciente, id_dentista, data_consulta, hora_consulta, descricao , prescricao)
values
(1, 1, '2025-08-26', '09:00', 'Consulta de rotina', 'Escovação 3x ao dia'),
(2, 2, '2025-08-26', '10:30', 'Dor de dente', 'Paracetamol e retorno em 7 dias'),
(3, 1, '2025-08-26', '14:00', 'Avaliação inicial', 'Solicitar radiografia'),
(4, 3, '2025-08-27', '11:15', 'Restauração de cárie', 'Evitar alimentos doces'),
(5, 2, '2025-08-27', '15:30', 'Consulta preventiva', 'Uso de fio dental diariamente'),
(1, 3, '2025-08-27', '16:00', 'Extração de siso', 'Antibiótico por 7 dias'),
(2, 1, '2025-08-28', '08:45', 'Limpeza dental', 'Enxaguante bucal'),
(3, 2, '2025-08-29', '13:30', 'Tratamento de canal', 'Analgésicos conforme necessidade'),
(4, 1, '2025-08-29', '09:45', 'Manutenção de aparelho', 'Troca de elástico'),
(5, 3, '2025-08-30', '17:00', 'Clareamento dental', 'Evitar café por 48h'),
(7, 9, '2025-08-30', '17:00', 'Avaliação Inicial', 'Continue com a boa saude bucal');

select * from consulta


insert into procedimento(nome_procedimento, descricao, duracao_media)
values
('Limpeza', 'Limpeza e Remoção de tártaro', 60),
('Restauração', 'Restauração de dente com resina', 45),
('Extração Simples', 'Remoção de dente', 30),
('Canal', 'Tratamento de canal', 90),
('Implante Dentário', 'Colocação de implante', 120),
('Ortodontia', 'Ajuste de aparelho ortodôntico', 30),
('Clareamento', 'Procedimento de clareamento dos dentes', 75),
('Prótese', 'Instalação de prótese', 60),
('Odontopediatria', 'Dedicado ao atendimento infantil', 45),
('Consulta de Rotina', 'Exame clínico geral e orientações', 30);

select * from procedimento


------------------------INDICES----------------------------

create index idx_data_consulta on consulta(data_consulta);
create index idx_especialidade on dentista(especialidade);

-------------------------VIEW------------------------------


create view nossa_agenda as 
select 
    c.data_consulta as "Data",
    c.horario_consulta as "Horario",
    p.nome_completo as "Paciente",
    p.telefone as "Telefone",
    d.nome_completo as "Dentista",
    c.prescricao as "Procedimento",
    c.status as "Status da Consulta"
from consulta c
join paciente p on c.id_paciente = p.id_paciente  
join dentista d on c.id_dentista = d.id_dentista
order by c.data_consulta, c.horario_consulta;



----------Os comandos para verificação/validação-----------


------------------------AGENDAMENTO------------------------

-- Agendar uma nova consulta:
INSERT INTO consulta (id_paciente, id_dentista, data_consulta, hora_consulta, descricao, status)
SELECT 1, 2, '2024-02-15', '14:00', 'Consulta de rotina', 'agendada'
WHERE NOT EXISTS (
    SELECT 1 FROM consulta 
    WHERE id_dentista = 2 
    AND data_consulta = '2024-02-15' 
    AND hora_consulta = '14:00'
    AND status = 'agendada'
);

-- Verificar se conseguiu agendar:
SELECT 
    CASE 
        WHEN COUNT(*) > 0 THEN 'Consulta marcada com sucesso'
        ELSE 'Horário já ocupado'
    END as resultado
FROM consulta 
WHERE id_paciente = 1 
AND id_dentista = 2 
AND data_consulta = '2024-02-15' 
AND hora_consulta = '14:00';

-- Condição para cancelar consulta (24h):
UPDATE consulta 
SET status = 'cancelada'
WHERE id_consulta = 1 
AND data_consulta > (NOW() + INTERVAL '24 hours')
AND status = 'agendada';

SELECT 
    CASE 
        WHEN status = 'cancelada' THEN 'Consulta cancelada com sucesso'
        ELSE 'Não foi possível cancelar'
    END as resultado
FROM consulta 
WHERE id_consulta = 1;


-- Para remarcar uma consulta:
 update consulta set data_consulta = '2025-09-03', hora_consulta = '15:00'  where id_consulta = 1;

-- Pra cancelar uma consulta:
update consulta set status = 'cancelada'  where id_consulta = 1;

-- Pra marcar uma consulta como realizada:
update consulta set status = 'realizada', descricao = 'Consulta transcorreu bem' where id_consulta = 1;


--------------------------OPERAÇÕES-----------------------------

-- Media consulta por dentista:
select 
    round(avg(total_consultas), 2) as "Consulta media por dentista"
from (
    select
        d.id_dentista,
        count(c.id_consulta) as total_consultas
    from dentista d
    left join consulta c on d.id_dentista = c.id_dentista
    where c.status != 'cancelada' or c.status is null
    group by d.id_dentista
) as consultas_por_dentista;

-- Consultas em ordem decrescente:
create or replace view lista_consultas_ordenadas as
select
    c.id_consulta,
    p.nome_completo as nome_paciente,
    d.nomeCompleto as nome_dentista,
    c.data_consulta,
    c.procedimento as procedimentos_realizados,
    c.status,
    c.hora_consulta
from consulta c
join paciente on c.id_paciente = p.id_paciente
join dentista on c.id_dentista = d.id_dentista
order c.data_consulta desc, c.hora_consulta desc;

-- Paciente com mais consultas:
select
    p.nome_completo as "Nome Paciente",
    p.telefone as "Telefone",
    count(c.id_consulta) as "Total Consultas"
from paciente p
left join consulta c on p.id_paciente = c.id_paciente
where  c.status != 'cancelada'
group by p.id_paciente, p.nome_completo, p.telefone
order by "Total Consultas" desc;

-- Total consultas por dentista:
select
    d.nome_completo as "Nome Dentista",
    d.especialidade as "Especialidade",
    count(c.id_consulta) as "Total Consultas"
from dentista d 
left join consulta c on d.id_dentista = c.id_dentista
where c.status != 'cancelada'
group by d.id_dentista, d.nome_completo, d.especialidade
order by "Total Consultas";

-- Para ver se um horário esta disponível:
select * from consulta

-- Criei isso aqui so pra ir verificando visualmente se ta tudo certinho:
select * from consulta where data_consulta = '2025-09-02' 

-- Ver a agenda completa:
select * from nossa_agenda;

-- Ver a agenda de consultas de um dia especifico:
select * from nossa_agenda where "Data" = CURRENT_DATE;

-- Ver agenda de um unico dentista:
select * from nossa_agenda where "Dentista" = 'Dr. Rafael Costa Lima';

-- Ver todas as consultas de um unico paciente:
 select * from nossa_agenda where "Paciente" = 'Pâmela de Freitas';
