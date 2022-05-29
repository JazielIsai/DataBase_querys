--Crear una nueva base de datos llamada Empresa y las tablas Empleados y Departamentos, 
--crear la integridad de los datos utilizando reglas, valores por defecto entre otros.
--1.	Requisitos para la base de datos
--	a.	Primary = 5Mb, 8MB, 2%
--	b.	Log= 6MB, 8MB, 2%
Create DataBase EmpresaOtro --PracticaReglasRestriccionesDefaults
ON
PRIMARY (NAME  = EmpresaOtro_dat,
				FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\EmpresaOtro_dat.mdf',
				SIZE = 5,
				MAXSIZE = 8,
				FILEGROWTH = 2) -- VA A AUMENTAR DE 5 EN 5 REGISTROS ANTERIORMENTE SE COLOCA %
		LOG ON
				(NAME = EmpresaOtro_log,
				FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\EmpresaOtro_log.ldf', --.ldf --Buscar el Path (donde se guardan las bd. En SQL Server)
				SIZE=6MB,
				MAXSIZE = 8MB,
				FILEGROWTH = 2MB)

				exec sp_helpdb Prueba1 

use EmpresaOtro 


--2.	Crear las tablas y utilizar los valores Null y Not Null 

--3.	Poner Restricción Primary Key en Departamentos 
Create Table Departamentos(
Id_Depto int not null primary key identity(1,1),
Nombre_Depto nvarchar(19) not null, 
Localidad nvarchar(20) null
);

--4.	Poner Primary Key en Empleados 
--5.	Poner la Foreign Key en Empleados 
Create table Empleados(
Id_Emp int not null primary key identity(1,1),
Apellido varchar (20),
Nombre nvarchar(20) not null, 
Oficio nvarchar(20) not null,
Director int null,  
Fecha_alt smalldatetime null, 
Salario int null, 
Comision int null, 
Id_Depto int null,
foreign key (Id_Depto) references Departamentos(Id_Depto)
);


--6.	Creo una restricción Check para el Salario mayor a $80
alter table Empleados
add constraint Salario CHECK (Salario > 80)
go

--7.	Creo una restricción Check para la Comisión mayor o igual a 0
alter table Empleados
add constraint Comision check (Comision >= 0)
go

--8.	Creo una restricción Check para la Fecha mayor del año 1973 y menor o igual a la fecha actual
alter table Empleados 
add constraint Fecha_alt check (Fecha_alt > '1973-12-31 00:00:00' and Fecha_alt <= getdate())
go

--9.	Creo un Valor Predeterminado para Fecha (default)
alter table Empleados
add constraint DF_Fecha default getdate() for Fecha_alt
go

--10.	Creo un Valor Predeterminado Comisión 
alter table Empleados
add constraint DF_Comision default 0 for Comision
go

--11.	Creo una restricción Default para la localidad en Departamento  como “DESCONOCIDA”
alter table Departamentos 
add constraint DF_Localidad default 'Desconocida' for Localidad
go

--12.	Creo una regla para que todos los empleados tengan asociado director 7231, 7698, 7783, 7200

create rule Director_Rule
as 
@Director in (7231,7698,7783,7200)
go

--Para vincular regla a la columna
exec sp_bindrule 
'Director_Rule', 
'Empleados.Director'

--13.	Insertar los datos para verificar la integridad de la base de datos de la tabla Empleados que no cumpla la regla
 
 insert into Empleados values('Perez Garrido', 'Jaziel Isaí','Sistemas', 3243,'1974-12-31 00:00:00',200,0,null);
 select * from Empleados

--14.	Insertar en la tabla empleados con datos que no cumplan la estricción en la fecha

 insert into Empleados values('Perez Garrido', 'Jaziel Isaí','Sistemas', 3243,'1972-12-31 00:00:00',200,0,1);

--15.	Cambio el código para la tabla departamentos con la inserción correcta.

 insert into Empleados values('Perez Garrido', 'Jaziel Isaí','Sistemas', 7231,'2000-12-31 00:00:00',200,0,null);

  select * from Empleados


--Para desvincular regla a la columna
exec sp_unbindrule 'Empleados.Director'
--Elimiar la regla
DROP RULE Director_Rule












