create database atividade2;

use atividade2;

create table Autores (
    id int primary key,
    nome varchar(100),
    nacionalidade varchar(50)
);

create table Categorias (
    id int primary key,
    descricao varchar(50)
);

create table Livros (
    id int primary key,
    titulo varchar(100),
    ano_publicacao year,
    id_autor int,
    id_categoria int,
    foreign key (id_autor) references Autores(id),
    foreign key (id_categoria) references Categorias(id)
);

alter table Livros add column preco decimal(5,2);
alter table Categorias add column quantidade int;

insert into Autores (id, nome, nacionalidade) values (1, 'Rick Riordan', 'Americana');
insert into Autores (id, nome, nacionalidade) values (2, 'J.K. Rowling', 'Britânica');
insert into Autores (id, nome, nacionalidade) values (3, 'Lucy Maud Montgomery', 'Canadense');

insert into Categorias (id, descricao) values (1, 'Fantasia');
insert into Categorias (id, descricao) values (2, 'Juvenil');
insert into Categorias (id, descricao) values (3, 'Drama');

insert into Livros (id, titulo, ano_publicacao, id_autor, id_categoria, preco) values (1, 'Percy Jackson e o Ladrão de Raios', 2005, 1, 1, 34.90);
insert into Livros (id, titulo, ano_publicacao, id_autor, id_categoria, preco) values (2, 'Harry Potter e a Pedra Filosofal', 1997, 2, 1, 29.90);
insert into Livros (id, titulo, ano_publicacao, id_autor, id_categoria, preco) values (3, 'Anne of Green Gables', 1908, 3, 3, 25.90);

insert into Autores (id, nome, nacionalidade) values (4, 'C.S. Lewis', 'Britânica');
insert into Livros (id, titulo, ano_publicacao, id_autor, id_categoria, preco) values (4, 'O Leão, a Feiticeira e o Guarda-Roupa', 1950, 4, 1, 39.90);

update Categorias set descricao = 'Romance' where id = 1;
update Livros set preco = preco * 1.10 where ano_publicacao < 2000;
update Autores set nome = 'Gabriel García Márquez' where nome = 'Gabriel Garcia Marquez';

delete from Livros where ano_publicacao < 1950;
delete from Categorias where quantidade < 5;

alter table Categorias drop column quantidade;
