CREATE DATABASE RESTRICCIONES
USE RESTRICCIONES

Create Table Empleados(
Documento varchar(8),
Nombre varchar(30), 
Fecha_Nacimiento datetime, 
Cantidad_Hijos tinyint,
Seccion varchar(20), 
Sueldo decimal(6,2)
);


--Restricción sueldo numeros positivos

ALTER TABLE Empleados
ADD CONSTRAINT sueldo CHECK ( sueldo > 0);  
GO 


--Ingresar registro validos
insert into Empleados values ('Cedula', 'Mariana García', '1997-07-23',1, 'Sistemas', 7000)
insert into Empleados values ('INE', 'Mariel Alonso', '2004-08-28',2, 'Finanzas', 5000)
insert into Empleados values ('INE', 'David Osorio', '2001-06-15',1, 'Sistemas', 5000)
insert into Empleados values ('Acta', 'Alejandra Ballon', '1996-06-12',3, 'Administracion',5500)
insert into Empleados values ('Acta', 'Karen Ballon', '1994-07-12',2, 'Administracion', 6000)

select * from Empleados;

--Restricción sueldo limite
ALTER TABLE Empleados
ADD CONSTRAINT sueldos CHECK ( sueldo <= 8000);  
GO

--Eliminación de registro infractor
delete Empleados where  nombre='Alejandra Ballon'
select * from Empleados


--Restricción limite fecha de nacimiento actual
	alter table Empleados
	   add constraint fechanacimiento
	   check (fecha_nacimiento<getdate());

insert into Empleados values ('Acta', 'Irina Medina', '2021-10-14',3, 'Cajas',6000)


--Restricción para secciones
ALTER TABLE EMPLEADOS ADD CHECK(seccion = 'Sistemas' OR seccion = 'Administracion' OR seccion = 'Finanzas')


--Restricción numero de hijos
ALTER TABLE Empleados
ADD CONSTRAINT numhijos_total CHECK (cantidad_hijos >= 0 and cantidad_hijos <= 6);
GO


--Restrricciones totales
SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_NAME = 'Empleados'

insert into Empleados values ('Acta', 'Karen Ballon', '1994-07-12',2, 'Administracion', 9000)

insert into Empleados values ('Acta', 'Karen Ballon', '2021-10-14',2, 'Administracion', 6000)


update Empleados set Cantidad_Hijos = 10 where nombre= 'Mariana García'



update Empleados set Seccion='Software' where nombre= 'Mariana García'


alter table empleados
   add constraint letrainicial
   check (seccion like '%B');