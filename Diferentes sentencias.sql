--selecionar toda la tabla
Select * from Alumnos;

--Selecionar las calificaciones más bajas
select min (id_Alumno) 
from Calificaciones;

select max (Nombre_Alumno) 
from Calificaciones;

--Mostrar el nombre del alumno que empiece con la letra m
select * from Alumnos 
where Apellido_Paterno like 'A%';

select * from Asignatura 
where Nombre_Asignatura like 'f%'

--Selecion de las asignaturas donde los creditos sean de 4 y 5
select Nombre_Asignatura from Asignatura  
where Creditos between 4 and 5;   --between significa "entre" 


--Modificar el nombre de Luis Angel y agregar solo Angel
update Alumnos set Nombre_Alumno = 'Angel' 
where Nombre_Alumno = 'Luis Angel';


update Alumnos set Nombre_Alumno = 'ELIZABETH'
where Nombre_Alumno = 'Dulce Elizabeth';

--insertar alumnos 
insert Alumnos (Nombre_Alumno,Apellido_Paterno,Apellido_Materno,Edad,Semestre,Direccion,Telefono) 
values ('Ana Mariel','López','Garcia', 15,2,'ITESI',462);

insert Alumnos (Nombre_Alumno,Apellido_Paterno,Apellido_Materno,Edad,Semestre,Direccion,Telefono) 
values ('Ana','Garcia','Garcia', 19,4,'ITESI',462131504);

insert Alumnos (Nombre_Alumno,Apellido_Paterno,Apellido_Materno,Edad,Semestre,Direccion,Telefono) 
values ('Laey','Diaz','Garcia', 29,9,'ITESI',462143123);

--insertar profesores	
insert into Profesores  Values ('Cesar','Manriquez','Manriquez','ITESI',12000.00,43,'FEWF23332F',33311232,'INGLES');
insert into Profesores  Values ('Otro','Otro','Otro','ITESI',12320.00,32,'CSDEDE32332F',323132,'OTRO');
