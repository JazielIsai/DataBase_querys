create database Empresa1
use Empresa1

--Se necesita conocer los datos personales de los clientes (nombre, apellidos, NSS, dirección y fecha de nacimiento)
create table Clientes(
id_Cliente int not null primary key identity(1,1),
Nombre char(30),		--Aplicar el alter tabla para tabla Clientes en la columna Nombre en not null
Apellidos char(30) not null, 
NSS varchar(12) not null, 
Dirección varchar(30) not null,
FechaNacimiento date not null 
); 

--Cada producto tiene un nombre y un código, así como un precio unitario. 
create table Productos(
id_Producto int not null identity(1,1), --Aplicar alter table para llave primaria
Nombre_Producto varchar(30) not null,
Codigo_Producto int not null,
Precio_Unit money not null
);

--Un cliente puede comprar varios productos a la empresa, y un mismo producto puede ser comprado por varios clientes.
Create table Ventas(
id_Venta int not null,
id_Cliente int not null,
id_Producto int not null,
Cobro_Total money not null, 
Constraint FK_id_Cliente Foreign key (id_Cliente) references Clientes(id_Cliente)
--Constraint FK_id_Producto foreign key (id_Producto) references Productos(id_Producto) --Alterar
);

--Los productos son suministrados por diferentes proveedores. 
--Se debe tener en cuenta que un producto sólo puede ser suministrado por un proveedor, 
--y que un proveedor puede suministrar diferentes productos. De cada proveedor se desea conocer el NSS, nombre y dirección”.
Create table Proveedor(
id_Proveedor int not null primary key identity(1,1),
NSS varchar(12) not null,
Nombre varchar(30) not null,
Dirección varchar(20) not null,
id_Producto int not null,
--Constraint FK_id_Producto foreign key (id_Producto) references Productos(id_Producto) --ALTERAR
);

--Alter table Nombre de la tabla --Alterar o modificar la tabla
--Not null
--Unique
--Check
--Primary key
--Foreign Key -- LLave foranea o externa
--default

--Alteramos en la tabla clientes en la columna Nombre que este no reciba valores nulos
alter table Clientes
alter column Nombre varchar(30) not null
go

insert into Clientes values (Null, 'Duarte', '12E21D213D','Irapuato Apaseo','1997-09-21');

-- Alteramos en la tabla Productos, agregando una restricción(constraint) que se llama PK_id_Producto la restricción es primary key a la columna id_Producto
alter table Productos
add constraint PK_id_Producto 
primary key (id_Producto) 
go

--Alteramos en la tabla ventas, una llave foranea 
alter table Ventas
add Constraint FK_id_Producto foreign key (id_Producto) references Productos(id_Producto)
go

--Alteramos en la tabla Proveedores, una llame foranea
alter table Proveedor
add Constraint FK_id_Producto1 foreign key (id_Producto) references Productos(id_Producto)
go

alter table Clientes
add constraint FechaNacimiento check (FechaNacimiento >= '1976-12-31' and FechaNacimiento < getdate())
go

alter table Ventas
add constraint Cobro_Total check (Cobro_Total>0)
go

alter table Clientes 
add constraint NSS Default '12ds43tre32w' for NSS
go

insert into Clientes values ('Jesus Angel', 'Duarte', '','Irapuato Apaseo','1997-09-21');
insert into Clientes values (' Angel', 'Ramos', default,'Irapuato Apaseo','1997-09-21');

insert into Productos values ('Sabritas',4,12);

select * from Clientes
select * from Ventas
Select * from Productos
select * from Proveedor