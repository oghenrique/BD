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

(111111, 54321, "02/09/2022", "R$80000"),
(222222, 55321, "12/09/2023", "R$60000" ),
(333333, 55543, "07/02/2022", "R$100000");

insert into carros_Compra (id_carrosCompra, id_compras, id_carros, quantidade, subtotal) values 

(010101, 111111, 12345, 1, 80000),
(020202, 222222, 22345, 1, 60000),
(030303, 333333, 33345, 1, 100000);

insert into estoque (id_estoque, id_carros, quantidade_estoque) values 

(777, 12345, 900),
(888, 22345, 448),
(999, 33345, 756);


/**Escreva uma consulta para listar todos os carros disponíveis na loja.
*/

select * from carros where quantidade_estoque >0;

/**Recupere os detalhes de um carro específico usando seu ID. 
*/

select * from carros where id_carros = 1;

/**Mostre o nome, o CPF e o e-mail de todos os clientes cadastrados 
*/

select nome, cpf, email from clientes;

/**Recupere os detalhes de uma compra específica, incluindo o nome do cliente, a data da compra e o total.
*/

select clientes.nome, compras.data_compra, compras.total_compra from clientes inner join compras on 
clientes.id_clientes=compras.id_clientes where compras.id_clientes=54321;

/**Liste os carros que estão em estoque, juntamente com a quantidade disponível.
*/

select nome, quantidade_estoque from carros where quantidade_estoque > 0;

/**Crie uma consulta para mostrar os clientes que compraram um determinado carro (usando o ID do carro).
*/

select clientes.nome from clientes inner join compras on clientes.id_clientes=compras.id_clientes inner join carros_compra on
compras.id_compras=carros_compra.id_compras where carros_compra.id_carros =22345;

/**Exiba o total de cada compra, juntamente com os nomes dos carros comprados, para um cliente específico. 
*/

select compras.total_compra, carros.nome, clientes.nome from clientes inner join compras on clientes.id_clientes=compras.id_clientes inner join carros_compra on compras.id_compras=carros_compra.id_compras
inner join carros on carros.id_carros=carros_compra.id_carros where compras.id_clientes = 54321;

/** Desafio: Exibir o nome do cliente que fez a compra mais cara até o momento
*/

SELECT * FROM carros WHERE categoria = 'Sedan' AND preco < 80000;

SELECT * FROM carros WHERE categoria = 'Picape' OR preco > 60000;

SELECT * FROM Carros WHERE NOT Categoria = 'Sedan';

SELECT * FROM Carros WHERE descricao IS NULL;

SELECT * FROM Carros WHERE descricao IS NOT NULL;

SELECT * FROM Carros WHERE preco BETWEEN 20000 AND 40000;

SELECT * FROM Carros WHERE Categoria IN ('Sedan', 'Picape');

SELECT * FROM Carros WHERE Nome LIKE 'Duster%'







