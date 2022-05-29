Create database Escuela
on
	(name = Escuela_Dat,
	filename = 'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Escuela_Dat.mdf',
	SIZE = 10,
	MAXSIZE = 30,
	FILEGROWTH = 5)
LOG ON
	(NAME = Escuela_log,
	filename = 'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Escuela_log.ldf',
	SIZE = 10MB,
	MAXSIZE = 30MB,
	FILEGROWTH = 5MB);

use Escuela

create table Alumnos(
id_Alumno int not null primary key identity(1,1),
Nombre_Alumno char(60) not null,
Apellido_Alumno char(80) not null,
N_Control char(10) not null,
);

create table Profesor(
id_Profesor int not null primary key identity(1,1),
Nombre_Profesor char(40) not null,
Apellido_profesor char (40) not null

);

Create table Materias(
id_Materia int not null primary key identity(1,1),
Nombre_Materia char(80) not null,
id_Alumno int not null,
id_profesor int not null,
foreign key (id_Alumno) references Alumnos(id_Alumno),
foreign key (id_profesor) references Profesor(id_Profesor)
);

create table Grupos(
id_Grupo int not null primary key identity(1,1),
Nombre_Grupo char(5) not null,
Grado_Grupo char(8) not null,
id_Materia int not null,
foreign key (id_Materia) references Materias(id_Materia)
);


Create table Calificacion(
id_Calificación int not null primary key identity(1,1),
Calificacion int not null,
id_Alumno int not null,
id_grupo int not null,
foreign key (id_Alumno) references Alumnos(id_Alumno)

);

--Alumnos
insert into Alumnos values ('Max','Manjarrez','IS18110321');
insert into Alumnos values ('Marion','Barron','IS18110231');
insert into Alumnos values ('Mariana','Garcia','IS18110763');
--Profesores
insert into Profesor values ('Mtro Fulano','Garcia');
insert into Profesor values ('Mtro Sutano','Robledo');
insert into Profesor values ('Mtro Jaimito','Tangamandapio');
--Materias
insert into Materias values ('Base de datos', 1,1);
insert into Materias values ('Software', 1,1);
insert into Materias values ('Redes', 1,1);
--Grupos
insert into Grupos values ('A','6',1);
insert into Grupos values ('B','4',1);
insert into Grupos values ('C','2',1);
--Calificaciones
insert into Calificacion values (10,1,1);
insert into Calificacion values (10,2,2);
insert into Calificacion values (10,3,3);


--Creación de usuarios y password
Create login USUARIO_01
with password = '12345'

--Creación de usuarios
Create user USUARIO_01 for login USUARIO_01


--Permisos GRANT, REVOKE, DENY

--GRANT El permiso para insertar datos del USUARIO1
Grant insert on Profesor to USUARIO_01
grant insert on Grupos to USUARIO_01
grant insert on Materias to USUARIO_01

-- DENY Denegacion para eliminr, y actualizar
deny delete, update on Profesor to USUARIO_01
deny delete, update on Grupos to USUARIO_01
deny delete, update on Materias to USUARIO_01

--Solo podran hacer consultas de las tablas profesor, grupo y materia
deny select on Alumnos to USUARIO_01
deny select on Calificacion to USUARIO_01




--Creacion de usuario 2
create login USUARIO_02
with password = '1234'

--creacion de usuario
create user USUARIO_02
for login USUARIO_02;

grant select on Alumnos(Nombre_Alumno,Apellido_Alumno,N_Control) to USUARIO_02
grant select on Materias(Nombre_Materia) to USUARIO_02
grant select on Calificacion(Calificacion) to USUARIO_02

deny insert, update, delete on Materias to USUARIO_02
deny insert, update, delete on Alumnos to USUARIO_02
deny insert, update, delete on Calificacion to USUARIO_02
deny insert, update, delete on Profesor to USUARIO_02
deny insert, update, delete on Grupos to USUARIO_02
