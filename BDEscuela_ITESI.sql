create database BDEscuela_ITESI
use BDEscuela_ITESI

create table Materia(
Clave_Mat int primary key,
Nombre nvarchar(20),
Horario nvarchar(10)
);

create table Alumno(
No_Ctrl int primary key,
Nombre nvarchar(20),
Apellido nvarchar (20),
Carrera nvarchar (10),
Telefono nvarchar (20)
);

create table Profesor(
No_Docente int primary key,
Nombre nvarchar(20),
Apellido nvarchar(20),
Carrera nvarchar(10)
);

create table Grupos(
Clave_Mat int foreign key references Materia (Clave_Mat),
No_Docente int foreign key references Profesor (No_Docente),
Nombre_Doc nvarchar(40),
Nombre_Mat nvarchar (10),
Horario nvarchar (10)
);

create table Calificacion(
Clave_Mat int foreign key references Materia (Clave_Mat),
No_Ctrl int foreign key references Alumno (No_Ctrl),
Nombre_Alu nvarchar (40),
Nombre_Mat nvarchar (20),
calificacion int
);

-- Con esto deberás realizar la creación del historial para cada tabla, 
-- tanto para su inserción, eliminación y actualización.

-- Para comprobarlo deberás realizar por lo menos dos inserciones, 
-- dos eliminaciones y dos actualizaciones en cada tabla.
CREATE TRIGGER TR_InsertMateria
ON Materia
FOR INSERT
AS
PRINT 'REGISTO AGREGADO'

INSERT INTO Materia values (2020,'Software','VESPERTINO')
INSERT INTO Materia values (2021,'Base de datos','MATUTINO')
select * from Materia

CREATE TRIGGER TR_ActualizarMateria
ON Materia
FOR UPDATE
AS
PRINT 'ACTUALIZADO EL REGISTRO CORRECTAMENTE'

update Materia set Clave_Mat='2022'
where Clave_Mat='2020'

update Materia set Nombre='Redes'
where Clave_Mat='2021'
SELECT * FROM Materia


CREATE TRIGGER TR_eliminarMateria
ON Materia
FOR DELETE
AS
PRINT 'ELIMINADO UN REGISTRO CORRECTAMENTE'

DELETE Materia where Clave_Mat='2021'

DELETE Materia where Clave_Mat='2022'

SELECT * FROM Materia


-----------------------


CREATE TRIGGER TR_InsertAlumno
ON Alumno
FOR INSERT
AS
PRINT 'REGISTO EXITOSO'

INSERT INTO Alumno VALUES(11,'JAZIEL','PEREZ','SISTEMAS','462212121')
INSERT INTO Alumno VALUES(12,'ZABDIEL','VERA','NEUROLOGO','46221213221')
select * from Alumno

CREATE TRIGGER TR_AtualizarAlumno
ON Alumno
FOR UPDATE
AS
PRINT 'ACTUALIZADO CORRECTAMENTE'

select * from Alumno
update Alumno
set No_Ctrl='12'
where No_Ctrl='10'

update Alumno
set Nombre='ISAI'
where Nombre='JAZIEL'


CREATE TRIGGER TR_EliminarAlumno
ON Alumno
FOR DELETE
AS
PRINT 'ELIMINADO CORRECTO'

DELETE Alumno where No_Ctrl='11'
DELETE Alumno where No_Ctrl='12'

------------------

CREATE TRIGGER TR_InsertProfesor
ON Profesor
FOR INSERT
AS
PRINT 'SE HA HECHO UN REGISTO'

INSERT INTO Profesor VALUES(23,'Aarón','Reyes','Sistemas')
INSERT INTO Profesor VALUES(21,'Cecilia','Moreles','Sistemas')
select * from Profesor

CREATE TRIGGER TR_UpdateProfesor
ON Profesor
FOR UPDATE
AS
PRINT 'SE HA ACTUALIZADO EN REGISTRO'


update Profesor set No_Docente='44' where No_Docente='23'
update Profesor set Nombre='Estafano' where Nombre='Aarón'
select * from Profesor


CREATE TRIGGER TR_DeleteProfesor
ON Profesor
FOR DELETE
AS
PRINT 'SE HA  ELIMINADO UN REGISTRO'

delete Profesor where No_Docente='44'
delete Profesor where No_Docente='21'
select * from Profesor



-------------------

CREATE TRIGGER TR_InsertGrupos
ON Grupos
FOR INSERT
AS
PRINT 'REGISTO CORRECTO'

INSERT INTO Grupos VALUES(44,15,'Hiram','MECATRONICA','MATUTINO')
INSERT INTO Grupos VALUES(23,43,'DAN','ARQUITECTO','MATUTINO')

select * from Grupos


CREATE TRIGGER TR_ActualizarGrupos
ON Grupos
FOR UPDATE
AS
PRINT 'SE HA ACTUALIZADO'

select * from Grupos
update Grupos set Horario='VESPERTINO' where Nombre_Mat='BIOLOGIA'
update Grupos set Horario='MATUTINO' where Horario='VESPERTINO'
select * from Grupos



--Ejercicio 01: Insertar un registro en la tabla Materia usando transacción. (Ver Insertar registros)
Begin transaction trans_materia
insert into Materia values (152, 'Redes 1', '12--2')
Commit Transaction trans_materia
Print 'Se inserto un nuevo registro'




Select*from Materia;
Select*from Alumno;
Select*from Profesor;
select*from Grupos;
select * from Calificacion;
-- Ejercicio 01: Insertar un registro en la tabla Materia usando transacción. (Ver Insertar registros)
Begin transaction transicion_Materia
insert into Materia values (13, 'Software', 'Matutino')
Commit Transaction transicion_Materia
Print 'Isercción correcta'

select * from Materia

--Ejercicio 02: Crear un trigger en la tabla Alumno que no permita insertar un registro con el nombre duplicado.
CREATE TRIGGER TRAlumDup
ON Alumno                          
AFTER INSERT
AS
ALTER TABLE Alumno
ADD CONSTRAINT CT_NOT_REPIT UNIQUE (Nombre)

select * from Alumno

insert into Alumno values (463,'Zabdiel', 'Vera','Sistemas',4623733)
insert into Alumno values (321,'Hiram', 'Vera','Sistemas',46429731)

--Ejercicio 03: Crear una vista que se llame Kardex, que muestre los datos de nombre del alumno, materias y calificaiomes
--Al tratarse de una vista que involucra más de una tabla, necesitas crear un trigger,
-- Crea el trigger necesario para realizar inserciones, eliminaciones y modificaciones en la vista.

CREATE VIEW Kardex AS
SELECT Alumno.Nombre, Materia.Nombre, Calificacion.calificacion
FROM Alumno, Materia,Calificacion
WHERE Calificacion.No_Ctrl = Alumno.No_Ctrl and Calificacion.Clave_Mat = Materia.Clave_Mat;

create table Kardex
(
Nombre_alum varchar(50),
Materia varchar(50),
Calificacion int
)

CREATE TRIGGER TG_InsertKardex
ON Kardex 
after insert 
as 
declare @alumn varchar(50)
declare @mate varchar(50)
declare @calif int
select @alumn = Nombre_Alu from Calificacion
select @mate = Nombre_Mat from Calificacion
select @calif = calificacion from Calificacion
insert into Kardex values (@alumn , @mate, @calif)
go

CREATE TRIGGER TG_UpdateKardex
ON Kardex 
after update
as 
declare @alumn varchar(50)
declare @mate varchar(50)
declare @calif int
select @alumn = Nombre_Alu from Calificacion
select @mate = Nombre_Mat from Calificacion
select @calif = calificacion from Calificacion
update Kardex set Calificacion=@calif where Nombre_alum =@alumn and Materia=@mate
go

CREATE TRIGGER TG_DeleteKardex
ON Kardex 
instead of delete
as
declare @alumn varchar(50)
declare @mate varchar(50)
declare @calif int
select @alumn = Nombre_Alu from Calificacion
select @mate = Nombre_Mat from Calificacion
select @calif = calificacion from Calificacion
delete Kardex where Nombre_alum =@alumn and Materia=@mate 
delete Calificacion where Nombre_Mat=@mate and Nombre_Alu =@alumn

insert into Calificacion values (21,463,'Zabdiel','Software',35)
update Calificacion set calificacion=100 where Nombre_Alu = 'Zabdiel' and Nombre_Mat='Software'
delete Calificacion where Nombre_Mat='Software' and Nombre_Alu = 'Zabdiel'

select * from Kardex
select * from Calificacion

---Ejercicio 04: crear un trigger para que no permita una calificación mayor a 100



--Ejercicio 05: Crear un trigger con la función que desees.
CREATE TRIGGER TG_Materia
ON Materia                   
AFTER update
AS
print 'Datos Actualizados'