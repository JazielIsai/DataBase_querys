

-- Selecionar tabla profesores 
select * from Profesores;

-- selecionar el nombre y la edad de la tabla alumnos
select Nombre_Alumno, Edad 
from Alumnos;

--selecionar el nombre de profesor y el sueldo de a tabla profesores
select Nombre_Profesor, Sueldo 
from Profesores;

--Selecinar los nombres de los profesores que gane más de 15 mil pesos
select Nombre_Profesor
from Profesores where Sueldo > 15000;

select Nombre_Profesor
from Profesores where Sueldo = MAX;

--Selecionar la tabla de asignatrura
Select * From Asignatura;

--Selecionar el nombre y la proofesion del profesor 
select Nombre_Profesor, Profesion from Profesores;

--Selecionar el nombre del alumno el semestr y su direccion
select Nombre_Alumno, Semestre, Direccion 
from Alumnos;