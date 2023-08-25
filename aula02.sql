create database senai_03;

use senai_03;

create table produtos
(
	id_produto integer primary key,
	nome varchar(100),
	preco numeric
    
);

insert into produtos (id_produto, nome, preco) values 

(1, "Iphone 14", 5000),
(2, "Iphone 13", 4500),
(3, "Iphone 12", 3000),
(4, "Iphone 11", 2500),
(5, "Galaxy S20", 2000),
(6, "Galaxy S23", 4200),
(7, "LG K10", 800),
(8, "Xiaomi Redmi Note10", 5000),
(9, "Xiaomi poco", 2300),
(10, "Nokia tijolão", 30);

create table pedidos
(
	id_pedido integer primary key,
	id_produto integer,
	quantidade integer,
    
    foreign key (id_produto) references produtos(id_produto)
);

insert into pedidos (id_pedido, id_produto, quantidade) values 

(1, 1, 300),
(2, 2, 70),
(3, 3, 150),
(4, 4, 30),
(5, 5, 15),
(6, 6, 48),
(7, 7, 208),
(8, 8, 38),
(9, 9, 62),
(10, 10, 75);

select * from pedidos;

select * from produtos;

select p.nome, d.quantidade, p.preco, p.id_produto from produtos as p inner join pedidos as d on
d.id_produto=p.id_produto where nome="Iphone 11"



