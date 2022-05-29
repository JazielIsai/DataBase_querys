create database Ejercicio6
ON
PRIMARY (NAME  = Ejercicio6_dat,
				FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Ejercicio6.mdf',
				SIZE = 15,
				MAXSIZE = 30,
				FILEGROWTH = 5) -- VA A AUMENTAR DE 5 EN 5 REGISTROS ANTERIORMENTE SE COLOCA %
		LOG ON
				(NAME = Ejercicio6_log,
				FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Ejercicio6_log.ldf', --.ldf --Buscar el Path (donde se guardan las bd. En SQL Server)
				SIZE=15MB,
				MAXSIZE = 30MB,
				FILEGROWTH = 5MB)

				exec sp_helpdb Prueba1 

