Create database Registro;
use Registro; 

Create Table Persona(
id int not null identity (10,100) primary key,
Nombre char (30) not null,
Apellido char (30) not null,
N_Control varchar (10) not null, 
);

Create Table Materias (
id int not null identity (10,100) primary key,
Profesor char(20) not null,
Materia char (20) not null,
Calificacion float not null
);

--DELETE FROM table nombre -- Elimina todo el contenido de la tabla seleccionada
Delete From Persona; -- Elimina todos los datos de la(s) tabla(s) seleccionadas   

DELETE FROM Persona 
    WHERE id = 3 -- Elimina la cantiad de registros que ordena

	UPDATE Persona    
    SET Nombre  = Null  -- Se utiliza para eliminar campos determinados de una tabla (El null solo es si no admite valores nulos)

	Select * From Persona;
	Select * From Materias; 