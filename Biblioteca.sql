create database Biblioteca;
use  Biblioteca;

Create table Libros(
id_Libro int not null primary key,
Nombre_Libro text not null,
)

Create table Autores(
id_Autor int not null primary key,
Nombre_Autor text not null,
)

create table Relacion_Autores_Libros(
id_Libro int not null,
id_Autor int not null,
constraint fk_Libros foreign key (id_Libro) references Libros(id_Libro),
constraint fk_Autores foreign key (id_Autor) references Autores(id_Autor)
);

select * from Relacion_Autores_Libros