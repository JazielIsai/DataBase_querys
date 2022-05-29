Create database Libreria
use Libreria

Create table Libros(
Id_Libro int not null primary key identity(1,1),
Titulo char(150) not null,
Descripcion char(20) not null,
Autor char(40) not null,
Precio_vta money not null,
Precio_Compra money not null,
Editorial char(20) not null
);

drop table Libros;
insert into Libros values ('El principito', 'Cuento', 'Antoine de Saint-Exupéry', 205,105,'EDITORIAL DANTE');
insert into Libros values ('El principito', 'Cuento', 'Antoine de Saint-Exupéry', 205,105,'EDITORIAL DANTE');
insert into Libros values ('Don Quijote de la mancha', 'Clasico - ', 'Miguel de Cervantes' , 249,458,'Francisco de Robles');
insert into Libros values ('JavaScript, ¡Inspírate!', 'Programación', 'Ulises Gascón González', 0,0,'Leanpub');
insert into Libros values ('Python 3 al descubierto', 'Programación', 'Arturo Fernández Montoro', 182.40,228,'Alfaomega');
insert into Libros values ('PYTHON A FONDO', 'Programación', 'RAMÍREZ JÍMENEZ, Oscar', 660.00,1000.00,'Alfaomega');
insert into Libros values ('PYTHON CON APLICACIONES A LAS MATEMÁTICAS, INGENIERÍA Y FINANZAS', 'Programación', 'BÁEZ LÓPEZ, David', 398.00,398.00,'Alfaomega');
insert into Libros values ('Metodología de la programación orientada a objetos - 2ª Edición', 'Programación', 'LÓPEZ, Leobardo', 358.40, 448.00,'Alfaomega');
insert into Libros values ('Bases de datos', 'Programación', 'ABRUTSKY, Maximiliano Adrián;', 378.00,378.00,'Alfaomega');
insert into Libros values ('Programación de bases de datos con c#', 'Programación', 'GONZALEZ, Alfons', 428.00,428.00,'Alfaomega');
insert into Libros values ('BIG DATA CON PYTHON - Recolección, almacenamiento y proceso', 'Programación', 'CABALLERO ROLDÁN, Rafael', 278.00,278.00,'Alfaomega');

Select * from Libros

-- Obtener el numero total de filas
Select count(*) from Libros

-- Contar el numero de libros registrados
select COUNT(DISTINCT Titulo) from Libros

-- obtener el de menor precio de venta 
select MIN(Precio_vta) from Libros

--obtener el de mayor precio de compra
select MAX(Precio_Compra) from Libros

--Sumar el total de las vetas y el promedio en ventas
select SUM(Precio_vta) from Libros

-- promedio = AVG

-- 1. Obtener el numero total de filas, contar el numero de libros registrados, 
--obtener el de menor precio de venta y el de mayor precio de compra, sumar el total de las ventas y el promedio en venta.

select COUNT(DISTINCT Titulo), MIN(Precio_vta), MAX(Precio_Compra),SUM(Precio_vta), AVG(Precio_vta) from Libros

--2. Obtener el titulo y la editorial , la suma de las ventas, 
--agrupar por titulos de libro donde la suma sea mayor a $150 en precio de venta.

Select Titulo, Editorial, SUM(Precio_vta) 
from Libros
where Precio_vta > 150 
Group by Titulo,Editorial;


-- 3. Obtener el promedio del precio de venta de acuerdo a que este sea menor de $400 y agruparlos por editorial.

Select Editorial, AVG(Precio_vta) from Libros
Where Precio_vta < 400
group by Editorial;

--4. Obtener el precio maximo pero que se encuentre entre 400 y 100, ademas de agruparlos y ordenar los libros por editorial.

Select Editorial, MAX(Precio_Compra) from Libros
where Precio_Compra > 100 and Precio_Compra < 400
group by Editorial 
order by Editorial;

--5. Obtener los titulos y contarlos donde el precio de venta sea mayor a 100 que no sea nulo, 
--agrupar por titulo siempre y cuando el titulo sea diferente a "_______  "

Select Titulo, COUNT(Titulo) from Libros
Where Precio_vta > 100 and Titulo is not null
Group by Titulo

-- 6. Promedio de los precios de venta agrupados por titulos, pero solamente de aquellos grupos cuyo promedio supere los $200

select Titulo, AVG(Precio_vta) from Libros
where Precio_vta > 200
group by Titulo