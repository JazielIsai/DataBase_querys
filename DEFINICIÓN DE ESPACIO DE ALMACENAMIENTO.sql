create database Prueba1
ON
PRIMARY (NAME  = Prueba1_dat,
				FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Prueba1.mdf',
				SIZE = 10,
				MAXSIZE = 15,
				FILEGROWTH = 5) -- VA A AUMENTAR DE 5 EN 5 REGISTROS ANTERIORMENTE SE COLOCA %
		LOG ON
				(NAME = Prueba1_log,
				FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Prueba1_log.ldf', --.ldf --Buscar el Path (donde se guardan las bd. En SQL Server)
				SIZE=3MB,
				MAXSIZE = 5MB,
				FILEGROWTH = 1MB)

				exec sp_helpdb Prueba1 



	Create table Persona(
	id_Persona int not null primary key, -- identity(1,1),
	Nombre_Persona char(50) not null,
	Edad_Persona int not null,
	Texto text not null
	)

	drop table Persona

	DECLARE @ID_Persona INT = 1;
	WHILE(@ID_Persona <= 800) BEGIN
    insert into Persona values (@ID_Persona,'Jaziel Isai Pérez Garrido',20,'Estudio la carrera de Ing. Sistemas Computacionales');
    set @ID_Persona += 1;
	END

	Select * from Persona

	Select count(*) From Persona

