create database PuntoVenta;
use PuntoVenta;

create table Proveedores(
id_Proveedor int not null primary key identity(1,1),
Nombre_Proveedor varchar(50) not null,
Telefono varchar(12) not null,
Fecha date not null
);

Create table Clientes(
id_Cliente int not null primary key identity(1,1),
Nombre_Cliente varchar(50) not null,
Telefono varchar(12) not null,
Fecha date not null,
Domicilio varchar(50) not null,
RFC varchar(12) not null
);

create table Empleados(
id_Empleado int not null primary key identity(1,1),
Nombre_Empleado varchar(50) not null,
FechaNacimiento date not null,
RFC varchar(50) not null,
SueldoBase money not null,
);

create Table RegistroVentas(
id_Venta int not null primary key identity(1,1),
id_Cliente int not null,
id_Empleado int not null,
Fecha date not null,
DescripcionComida text not null,
TotalCobrar money not null,
Pago money not null,
Cambio money not null,
constraint fk_Clientes foreign key (id_Cliente) references Clientes(id_Cliente),
constraint fk_Empleados foreign key (id_Empleado) references Empleados(id_Empleado)
);

Create table Factura(
id_Proveedor int,
id_Cliente int,
id_Venta int,
Lugar varchar(50) not null,
Fecha date not null,
PrecioTotal money not null,
constraint fk_Proveedores foreign key (id_Proveedor) references Proveedores(id_Proveedor),
constraint fk_Cliente foreign Key (id_Cliente) references Clientes(id_Cliente),
constraint fk_Ventas foreign key (id_Venta) references RegistroVentas(id_Venta)
);

drop table Factura;
drop table RegistroVentas;

--selecionar toda la tabla
Select * from Proveedores;
Select * from Clientes;
Select * from Empleados;
Select * from RegistroVentas;
Select * from Factura;


-- selecionar el nombre y el telefono de la tabla Proveedores
select Nombre_Proveedor, Telefono 
from Proveedores;

--selecionar el nombre del empleado y el sueldo de a tabla Empleados
select Nombre_Empleado, SueldoBase 
from Empleados;

--Selecinar los nombres de los empleados que gane más de 15 mil pesos
select Nombre_Empleado
from Empleados where SueldoBase > 3500;


--Selecionar las calificaciones más bajas
select min (TotalCobrar) 
from RegistroVentas;

select max (TotalCobrar) 
from RegistroVentas;

--Mostrar el nombre del alumno que empiece con la letra a
select * from Clientes 
where Nombre_Cliente like 'j%';

select * from Proveedores 
where Nombre_Proveedor like 'D%'




--Modificar el nombre de Luis Angel y agregar solo Angel
update Clientes set Nombre_Cliente = 'Carlos' 
where Nombre_Cliente = 'Roman';


update Clientes set Nombre_Cliente = 'Jaziel Isaí'
where Nombre_Cliente = 'Jaziel';

select * From Clientes;


--insertar 	
insert into Clientes  Values ('Jaziel', 4621314420, ('2020-05-16'), 'Arandas','PGJI323SKFJ3');
insert into Clientes  Values ('Roman',4356234322,('2020-06-13'), 'Malvas', 'df344332f23');
insert into Clientes 
values ('Norma',334324323423,('2020-05-12'), 
'Catarina 21', 'lmd32d32d32')

insert into Empleados  Values ('Zaret',('2000-07-5'), 'ZZVG43FRCGZG', 4000.00);
insert into Empleados  Values ('Hiram',('2005-01-9'), 'HIVGD3FRCGZG', 3000.00);

insert into Proveedores  Values ('Dan',3421234354,('2002-01-2'));
insert into Proveedores  Values ('Neftaly',3456789876, ('2003-01-3'));
insert into Proveedores 
values ('Norma',323334234143,('2020-02-12'))

insert into RegistroVentas  Values (3,1,('2020-05-16'),'Hamburusa y hot-dog' ,100.00,100.00,0.00);
insert into RegistroVentas  Values (4,1,('2020-05-16'),'Hamburusa, orden de tacos y hot-dog' ,150.00,200.00,50.00);
insert into RegistroVentas 
values (5,6, 
('2020-05-16'), 'Orden de Burros Hot-Dog Orden de Burros Hot-Dog ', 0, 
300, 300)

insert Factura (id_Cliente,id_Venta,Lugar,Fecha,PrecioTotal)  Values (3,1,'Patronas',('2020-05-16'),100.00);
insert into Factura (id_Proveedor,Lugar,Fecha,PrecioTotal) Values (1,'Patronas',('2020-05-16'),150.00);


--Eliminar los datos de la tabla Clientes
delete from Factura;
select * from Factura
--Eliminar los datos de la tabla empleados donde el id sea 1
delete From RegistroVentas where id_Venta=7;
select * from RegistroVentas; 