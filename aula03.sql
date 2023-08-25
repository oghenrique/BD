create database lojas;

use lojas;

create table carros
(
id_carros integer primary key,
nome varchar(100),
descricao varchar (200),
preco numeric,
categoria varchar (50),
quantidade_estoque int

);

create table clientes
(
id_clientes integer primary key,
nome varchar(100),
cpf varchar (30),
endereco varchar (200),
telefone numeric,
email varchar (200)

);

create table compras
(
id_compras integer primary key,
id_clientes integer,
data_compra varchar (20),
total_compra varchar (100),

foreign key (id_clientes) references clientes (id_clientes)

);

create table carros_Compra
(
id_carrosCompra integer primary key,
id_compras integer,
id_carros integer,
quantidade int,
subtotal numeric,

foreign key (id_compras) references compras (id_compras),
foreign key (id_carros) references carros (id_carros)

);

create table estoque
(
id_estoque integer primary key,
id_carros integer,
quantidade_estoque int,

foreign key (id_carros) references carros (id_carros)

);

insert into carros (id_carros, nome, descricao, preco, categoria, quantidade_estoque) values 

(12345, "Prisma", "É um carro bom para viagem", 60000, "Sedan", 900),
(22345, "Montana", "É um carro bom para carregar carga", 100000, "Picape", 448),
(33345, "Duster", "É um carro bom para gastar dinheiro na gasolina", 80000, "SUV Compacto", 756);

insert into clientes (id_clientes, nome, cpf, endereco, telefone, email) values 

(54321, "Jorge", "234.678.432.10", "Osasco", 12345678, "jorge@martinez.com"),
(55321, "Lucas", "555.444.888.80", "Jandira", 87654321, "lucas@lima.com"),
(55543, "Maria Caroline", "300.000.800.600.98", "Madri", 56784312, "maria@petri.com");

insert into compras (id_compras, id_clientes, data_compra, total_compra) values 

(111111, 54321, "02/09/2022", "R$80,000"),
(222222, 55321, "12/09/2023", "R$60,000" ),
(333333, 55543, "07/02/2022", "R$100,000");

insert into carros_Compra (id_carrosCompra, id_compras, id_carros, quantidade, subtotal) values 

(010101, 111111, 12345, 1, 80000),
(020202, 222222, 22345, 1, 60000),
(030303, 333333, 33345, 1, 100000);

insert into estoque (id_estoque, id_carros, quantidade_estoque) values 

(777, 12345, 900),
(888, 22345, 448),
(999, 33345, 756);

select * from clientes