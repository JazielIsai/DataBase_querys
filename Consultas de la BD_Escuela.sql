USE Escuela;
--Usuario_01
insert into Profesor values ('Mtro Carlos','Ramirez');
insert into Materias values ('Estructura', 2,2);
insert into Grupos values ('b','2',1);


delete from Grupos where Grado_Grupo = '2';
delete from Profesor where id_Profesor = 1;
delete from Materias where id_Materia = 1;

update Grupos set Grado_Grupo = 2 WHERE Nombre_Grupo = 'A'; 
update Profesor set Nombre_Profesor = 'Tangamandapio' WHERE id_Profesor = 1; 
update Materias set Nombre_Materia = 'POO' WHERE id_Materia = 1; 

SELECT * FROM Grupos 
SELECT * FROM Profesor
SELECT * FROM Materias
SELECT * FROM Alumnos
SELECT * FROM Calificacion 

--Usuario_02
USE ESCUELA;
SELECT * FROM Alumnos
SELECT * FROM Materias
SELECT * FROM Calificacion 

SELECT N_Control, Nombre_Alumno, Apellido_Alumno FROM Alumnos
SELECT Nombre_Materia FROM Materias
SELECT Calificacion FROM Calificacion


insert into Profesor values ('Mtro Fernando','Acosta');
insert into Materias values ('Programacion', 1,2);
insert into Grupos values ('d','6',2);

delete from Grupos where Grado_Grupo = '2';
delete from Profesor where id_Profesor = 1;
delete from Materias where id_Materia = 1;

update Grupos set Grado_Grupo = 2 WHERE Nombre_Grupo = 'A'; 
update Profesor set Nombre_Profesor = 'Tangamandapio' WHERE id_Profesor = 1; 
update Materias set Nombre_Materia = 'POO' WHERE id_Materia = 1; 

