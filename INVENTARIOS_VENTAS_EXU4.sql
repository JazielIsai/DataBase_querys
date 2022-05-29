--1.	Realizar la creación de la base de datos y sus tablas por medio de codigo. VALOR 10 PUNTOS.
create database INVENTARIOS_VENTAS_EXU4
ON
PRIMARY (NAME  = INVENTARIOS_VENTAS_EXU4_dat,
				FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\INVENTARIOS_VENTAS_EXU4.mdf',
				SIZE = 15,
				MAXSIZE = 30,
				FILEGROWTH = 5) -- VA A AUMENTAR DE 5 EN 5 REGISTROS ANTERIORMENTE SE COLOCA %
		LOG ON
				(NAME = INVENTARIOS_VENTAS_EXU4_log,
				FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\INVENTARIOS_VENTAS_EXU4_log.ldf', --.ldf --Buscar el Path (donde se guardan las bd. En SQL Server)
				SIZE=15MB,
				MAXSIZE = 30MB,
				FILEGROWTH = 5MB)

use INVENTARIOS_VENTAS_EXU4


Create table RESPONSABLE(
CLAVE CHAR(3) not null Primary Key,
NOMBRE VARCHAR (30)
);

Create table ACTIVOS(
ID_ACTIVO INT not null Primary Key identity(1,1),
DESCRIPCION VARCHAR(30),
COSTO MONEY,
VENDIDO CHAR(1),
CLAVE CHAR(3), 
constraint FK_CLAVE foreign key (CLAVE) references RESPONSABLE(CLAVE)
);	

Create table VENTAS(	
NO_VTA INT not null Primary Key identity(1,1), 
FECHA SMALLDATETIME,
IMPORTE MONEY,
ID_ACTIVO INT,
constraint FK_ID_ACTIVO foreign key (ID_ACTIVO) references ACTIVOS(ID_ACTIVO)
);


--2.	Realizar la inserción de por lo menos 15 registros, pueden ser por medio de codigo 
--o de manera directa, realizando un select para su comprobación. VALOR 10 PUNTOS.
insert into RESPONSABLE values ('ABC','MARIANA GARCIA');
insert into RESPONSABLE values ('ACB','MARION GARCIA');
insert into RESPONSABLE values ('ACD','MAXIMILIANO RUIZ');
insert into RESPONSABLE values ('ADC','ZARET VERA');
insert into RESPONSABLE values ('ADE','DAN VERA');
insert into RESPONSABLE values ('AED','HIRAM VERA');
insert into RESPONSABLE values ('AEF','YAEL GARRIDO');
insert into RESPONSABLE values ('AFE','YARETZI GARRIDO');
insert into RESPONSABLE values ('AFH','JAZIEL PÉREZ');
insert into RESPONSABLE values ('AHF','JESÚS GARCIA');
insert into RESPONSABLE values ('AHI','IAN MORALES');
insert into RESPONSABLE values ('AIH','NICOLE REYES');
insert into RESPONSABLE values ('AIJ','ESTEBAN MORELES');
insert into RESPONSABLE values ('AJI','JESÚS ALBERTO RAMIREZ');
insert into RESPONSABLE values ('AJK','DAMIAN DOMINGUEZ');

--ACTIVOS
insert into ACTIVOS values ('RAM',1500,'V','ABC');
insert into ACTIVOS values ('Disco Duro',2500,'V','ACB');
insert into ACTIVOS values ('DISPLAY',500,'V','ABC');
insert into ACTIVOS values ('MONITOR',3500,'V','AIH');
insert into ACTIVOS values ('CHASIS',1300,'V','AFE');
insert into ACTIVOS values ('LAPTOP',15000,'V','AFH');
insert into ACTIVOS values ('MAUSE',150,'V','AED');
insert into ACTIVOS values ('TECLADO',250,'V','AJI');
insert into ACTIVOS values ('CARGADOR',750,'V','AJK');
insert into ACTIVOS values ('PROCESADOR',5000,'V','AEF');
insert into ACTIVOS values ('CELULAR',4780,'V','AIJ');
insert into ACTIVOS values ('BOCINA',2300,'V','AFE');
insert into ACTIVOS values ('IMPRESORA',7800,'V','AIH');
insert into ACTIVOS values ('TELEVISION',5600,'V','AHI');
insert into ACTIVOS values ('RELOG INTELIGENTE',3567,'V','ABC');

--VENTAS --FECHA -- IMPORTE --ID_ACTIVO
insert into VENTAS values ('1995-12-11 12:43:10',1500,1);
insert into VENTAS values ('1998-11-13 14:43:10',2500,2);
insert into VENTAS values ('2008-10-09 16:23:10',500,3);
insert into VENTAS values ('2008-09-09 17:22:10',3500,4);
insert into VENTAS values ('2007-11-09 13:23:10',1300,5);
insert into VENTAS values ('2010-03-19 19:23:10',15000,6);
insert into VENTAS values ('2011-10-01 16:23:10',150,7);
insert into VENTAS values ('2019-07-09 16:33:10',250,8);
insert into VENTAS values ('2020-12-12 16:23:10',750,9);
insert into VENTAS values ('2021-01-31 12:23:10',5000,10);
insert into VENTAS values (GETDATE(),4780,11);
insert into VENTAS values (GETDATE(),2300,12);
insert into VENTAS values (GETDATE(),7800,13);
insert into VENTAS values (GETDATE(),5600,14);
insert into VENTAS values (GETDATE(),3567,15);

SELECT * FROM RESPONSABLE;
SELECT * FROM ACTIVOS;
SELECT * FROM VENTAS;

--3.	Realizar un plan de mantenimiento en el cual se realice en backup de la base de datos cada semana, 
--especificamente cada domingo a medio día, durante dos meses. VALOR 40 PUNTOS.

--lISTO
BACKUP DATABASE [INVENTARIOS_VENTAS_EXU4] TO  DISK = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\Backup\INVENTARIOS_VENTAS_EXU4.bak' 
WITH NOFORMAT, INIT,  NAME = N'INVENTARIOS_VENTAS_EXU4-Full Database Backup', SKIP, NOREWIND, NOUNLOAD,  STATS = 10
GO


--4.	Realizar una indexación no agrupada por medio de la fecha de venta. VALOR 40 PUNTOS.

create nonclustered index IDX_FECHA
on VENTAS (FECHA)

SELECT * FROM VENTAS;

SELECT FECHA FROM VENTAS;

SELECT FECHA, IMPORTE FROM VENTAS;
