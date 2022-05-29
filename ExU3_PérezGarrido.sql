--crear la Base de Datos INVENTARIOS_VENTAS
--1.	Requisitos para la base de datos. VALOR 5 PUNTOS
--Primary = 5Mb, 8MB, 2%
--Log= 6MB, 8MB, 2%

Create database INVENTARIOS_VENTAS
ON
PRIMARY (NAME  = INVENTARIOS_VENTAS_dat,
				FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\INVENTARIOS_VENTAS_dat.mdf',
				SIZE = 5MB,
				MAXSIZE = 8MB,
				FILEGROWTH = 2%) -- VA A AUMENTAR DE 5 EN 5 REGISTROS ANTERIORMENTE SE COLOCA %
		LOG ON
				(NAME = INVENTARIOS_VENTAS_log,
				FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\INVENTARIOS_VENTAS_log.ldf', --.ldf --Buscar el Path (donde se guardan las bd. En SQL Server)
				SIZE=6MB,
				MAXSIZE = 8MB,
				FILEGROWTH = 2%)


				exec sp_helpdb INVENTARIOS_VENTAS 

use INVENTARIOS_VENTAS;

-- 2.	Realice la creación de las tablas. VALOR 5 PUNTOS

Create table RESPONSABLE(
CLAVE CHAR(3) not null primary key,
NOMBRE VARCHAR (30) NOT NULL
);

Create table ACTIVOS(
ID_ACTIVO INT not null primary key identity(1,1),
DESCRIPCION VARCHAR(30) not null,
COSTO MONEY not null,
VENDIDO CHAR(1) not null, 
CLAVE CHAR(3) not null,
Constraint FK_CLAVE Foreign Key (CLAVE) references RESPONSABLE(CLAVE)
);

Create table VENTAS(
NO_VTA INT not null primary key identity(1,1),
FECHA SMALLDATETIME not null, 
IMPORTE MONEY not null,
ID_ACTIVO INT not null
Constraint FK_ACTIVOS Foreign Key (ID_ACTIVO) references ACTIVOS(ID_ACTIVO)
);


-- 3.	Modifique la Tabla Responsable y agregue el campo PUESTO de 50 caracteres. VALOR 5 PUNTOS
alter table RESPONSABLE
add Puesto char(50) not null
go

insert into RESPONSABLE VALUES ('AAA','MARIEL','DIR. SOFTWARE')
SELECT * FROM RESPONSABLE

--4.Genere una restricción sobre el campo COSTO que solo permita valores entre 800 y 80000. VALOR 5 PUNTOS
alter table ACTIVOS 
add constraint COSTO check (COSTO >= 800 and COSTO <= 80000)
GO

insert into ACTIVOS values('COMPUTADORA',12000,'V','AAA')
SELECT * FROM ACTIVOS

--5. Crear un default que coloque el valor de IMPORTE de las ventas en 200 cuando el usuario no ingrese nada. VALOR 10 PUNTOS
Alter table VENTAS
add constraint IMPORTE DEFAULT 200 for IMPORTE
GO

insert into VENTAS values('2010-10-20 12:30:00',DEFAULT,1)
SELECT * FROM VENTAS


--6. Crear una regla que valide que la DESCRIPCION de los ACTIVOS inicien con A y un guion bajo “A_”. VALOR 10 PUNTOS
create rule DESCRIPCION_RULE
as
@DESCRIPCION like ('%A_(a-zA-Z0-9)*') --'A_%'
GO

exec sp_bindrule 
'DESCRIPCION_RULE', 
'ACTIVOS.DESCRIPCION'

EXEC sp_unbindrule 'ACTIVOS.DESCRIPCION'
DROP RULE DESCRIPCION_RULE

insert into ACTIVOS values('A_PANTALLA',12000,'V','AAA')

--7. Quita la liga del default del ejercicio 5. VALOR 10 PUNTOS

alter table VENTAS
drop constraint IMPORTE
go

-- 8. Crear un default que coloque en el nombre del responsable ‘PENDIENTE’, si no se conoce el nombre.VALOR 10 PUNTOS
alter table RESPONSABLE
add constraint DF_NOMBRE DEFAULT 'PENDIENTE' for NOMBRE
go

insert into RESPONSABLE VALUES ('BBB',DEFAULT,'DIR. SOFTWARE')

SELECT * FROM RESPONSABLE
--9. Crear una regla para que solo pueda colocarse un E de existente o una V de vendido en la tabla activos. VALOR 10 PUNTOS
Create rule VENDIDO_RULE
as
@VENDIDO in ('E','V')
go

exec sp_bindrule 
'VENDIDO_RULE', 
'ACTIVOS.VENDIDO'

insert into ACTIVOS values('A_PANTALLA',12000,'D','BBB')


--10.	Crear una restricción o default que en fecha te coloque la fecha del sistema de la tabla ventas.VALOR 10 PUNTOS

alter table VENTAS
add constraint FECHA default getdate() for FECHA
GO

insert into VENTAS values(DEFAULT,800,1)

SELECT * FROM VENTAS	

--11.	Crear  una restriccion para que no se repitan las descripciones de los activos. VALOR 10 PUNTOS

alter table ACTIVOS
add constraint DESCRIPCION unique (DESCRIPCION)
go

--12.	Crear dos usuarios, los cuales puedan realizar lo siguiente: VALOR 10 PUNTOS
--a.	Usuario 1
create login USUARIO_E1
with password = '123';

create user USUARIO_E1 for LOGIN USUARIO_E1;

--i.	Puede ver todas las tablas.

grant SELECT ON ACTIVOS TO USUARIO_E1
grant select on VENTAS TO USUARIO_E1
grant select on RESPONSABLE to USUARIO_E1


--ii.	Puede solo insertar en la tabla ventas,y eliminar

grant insert, delete on VENTAS TO USUARIO_E1

--iii.	No puede insertar, eliminar o actualizar la tabla activos.

deny insert, delete, update on ACTIVOS to USUARIO_E1

--b.	Usuario 2
create login USUARIO_E2
with password = '321'

create user USUARIO_E2 for login USUARIO_E2

--i.	Puede insertar, eliminar y actualizar en la tabla Activos.

grant insert, delete, update  on ACTIVOS TO USUARIO_E2

--ii.	No pede insertar, actualizar o eliminar en la tabla ventas.

deny insert, delete, update on VENTAS TO USUARIO_E2


--iii.	Puede ingresar eliminar y actualizar en la tabla responsable.

grant insert, delete, update, select  on RESPONSABLE TO USUARIO_E2



