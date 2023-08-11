create database escola;

use escola;

create table cursos
(

id integer primary key not null auto_increment,
nome varchar(50) not null,
matricula int not null,
descricao varchar(200) not null,
data_inicio varchar(10) not null

);

insert into cursos( nome, matricula, descricao, data_inicio) values
('Desenvolvimento de sistemas', 12345, 'É um ótimo curso!', '20/10/2023'),
('Logistica', 12245, 'É um péssimo curso!', '18/10/2023'),
('Banco de Dados', 12222, 'É um ótimo curso! Com SESI', '05/10/2023'),
('Power BI', 13333, 'É um  curso', '10/10/2023'),
('Excel', 14444, 'É um curso de Excel!', '09/12/2023');

select * from cursos;

select nome, matricula from cursos where id= 4;

update cursos set nome = "Informática basica" where id = 3;

update cursos set matricula = "33333" where id = 4;
update cursos set matricula = "12121" where id = 5;

alter table cursos drop column data_inicio
