--Constraint o restricciones
--Constraint o Restricciones



Create Table Nombre de la tabla--Cración de la tabla



Alter table Nombre de la tabla --Alterar o modificar la tabla



Not null
Unique
Check
Primary key
Foreign Key -- LLave foranea o externa



--Not Null



Create table Clientes
(ID_Cliente Int Not null,
Apellidos varchar(30) Not null,
Nombre varchar (30))



--Unique **Asegura que todos los valores en una columna sean distintos
Create table Clientes
(ID_Cliente Int unique,
Apellidos varchar(30),
Nombre varchar (30))



--Check **Asegura que todos los valores en una columna cumplan ciertas condiciones
Create table Clientes
(ID_Cliente Int check (ID_Cliente>0), --Solo incluye valores enteros y mayores a 0
Apellidos varchar(30) ,
Nombre varchar (30))



--Clave primaria o primary key (PK)



Create table Clientes
(ID_Cliente Int primary key ,
Apellidos varchar(30) ,
Nombre varchar (30))



--Clave externa o foranea (FK)
Create table Ordenes
(ID_Orden int primary key,
Fecha_Orden datetime)



--ID_Cliente int foreign key references Clientes (ID_Cliente))



Alter table Ordenes
add foreign key (ID_Cliente) references Clientes (ID_Clientes)



--Default



Create table libros
(ID_Libro int primary key,
Autor Varchar(30) default 'DESCONOCIDO',
Fecha_publicacion datetime)



--Alterar tabla o modificar tabla



alter table Nombre de la tabla
add constraint Nombre_Del_constraint default valor_por_defecto for nombre del campo



Alter table libros
add constraint DF_Autor default 'PENDIENTE' for Autor