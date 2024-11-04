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

insert into Autores (id, nome, nacionalidade) values (1, 'Clarice Lispector', 'Brasileira');
insert into Autores (id, nome, nacionalidade) values (2, 'José de Alencar', 'Brasileiro');
insert into Autores (id, nome, nacionalidade) values (3, 'Cecília Meireles ', 'Brasileira');

insert into Categorias (id, descricao) values (1, 'Literatura Instimista');
insert into Categorias (id, descricao) values (2, 'Romantismo');
insert into Categorias (id, descricao) values (3, 'Modernismo');

insert into Livros (id, titulo, ano_publicacao, id_autor, id_categoria, preco) values (1, 'Laços de Família', 1960, 1, 1, 30.09);
insert into Livros (id, titulo, ano_publicacao, id_autor, id_categoria, preco) values (2, 'Iracema', 1865, 2, 2, 33.90);
insert into Livros (id, titulo, ano_publicacao, id_autor, id_categoria, preco) values (3, 'Romanceiro da Inconfidência, 1953, 3, 3, 54.90);

insert into Autores (id, nome, nacionalidade) values (4, 'Lygia Fagundes Telles', 'Brasileira');
insert into Livros (id, titulo, ano_publicacao, id_autor, id_categoria, preco) values (4, 'Ciranda de Pedra', 2008, 4, 1, 47.20);

update Categorias set descricao = 'Romance' where id = 1;
update Livros set preco = preco * 1.10 where ano_publicacao < 2000;
update Autores set nome = 'Gabriel García Márquez' where nome = 'Gabriel Garcia Marquez';

delete from Livros where ano_publicacao < 1950;
delete from Categorias where quantidade < 5;

alter table Categorias drop column quantidade;
