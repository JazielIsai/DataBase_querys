CREATE DATABASE Prueba;
use Prueba;

Create Table Usuario(
id int not null,
Nombre char(30) not null,
Apellido_Pat char(30) not null,
Apellido_Mat char(30) not null,
Direccion varchar(30) not null,
telefono int not null
);

 Create Table Carrera (
 Id int not null identity (5,2), 
 Nombre_Carrera char(30) not null,
 Jefe_Carrer char(30) not null,
 Numero_Aluumnos int not null 
 );

 Create Table Direccion(
 id int not null identity (100,10) primary key,
 Calle varchar (30) not null,
 Colonia varchar (30) not null 
 );

 INSERT INTO Usuario VALUES (1,'Pedro','Ramirez', 'Rea', 'El copal',8007775390);
 Insert Into Carrera Values ('Mercatronica','Ramon',200);
 Insert Into Direccion Values ('Arquimides','La perdida');




