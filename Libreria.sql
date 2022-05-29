Create database libreria;
Use libreria;
create table Libros(
id_libro int not null primary key identity (1,1),
titulo char(80) not null,
descripción char(80) not null,
Autor char(80) not null,
precio_vta money ,
precio_compra money,
editorial char(80)
);
insert into Libros values ('Avenida del parque 79','Harols Robbins','Novela romantica','500','400','Las rosas')
insert into Libros values ('El corazón de la piedra',' José María García López','Novela europea','600','500','Nocturna')
insert into Libros values ('Salmos de vísperas','Harols Robbins','Novela romantica','350','200','Obra social de Caja de Avila')
insert into Libros values ('Officium Hebdomadae Sanctae de Tomás Luis de Victoria','Samuel Rubio','edición crítica y un estudio del Oficio de Semana Santa.','400','250','Instituo de música religiosa de Cuenca')
insert into Libros values ('Historia de la música española 2. ','Harols Robbins','una sección muy extensa sobre Tomás Luis de Victoria y un catálogo de sus obras.','500','350','Alianza Música')
insert into Libros values ('Transcripción e interpretación de la Polifonía ','Miguel Querol Gavaldá','pequeño manual para introducirse en la transcripción de la notación blanca.','700','550','Servicio de publicaciones del Ministerio de Educación y Ciencia')
insert into Libros values ('La polifonía clásica','Samuel Rubio','trata sobre paleografía musical','750','600',' Biblioteca "la ciudad de Dios", Real Monasterio de El Escorial')
insert into Libros values ('Studies in the Music of Tomás Luis de Victoria',' Eugene Casjen Cramer','Trata diversos aspectos puntuales de la música de Victoria.','600','450','Ashgate')
insert into Libros values ('La música en las catedrales españolas del Siglo de Oro','Robert Stevenson',' Incluye un análisis somero de algunas obras','650','500','Alianza Música')
insert into Libros values ('Tomás Luis de Victoria: A guide to research','Eugene Casjen Cramer','Se trata de un completísimo catálogo de todas las ediciones de Victoria.','500','350','Garland Publishing Inc.')

select * from Libros where precio_vta > 200

--1:Obtener el numero total de filas, contar el numero total de libros registrados, obtener el menor 
--precio de venta y el de mayor precio de venta y el de mayor precio de compra, sumar el total de 
--las venta y el promedio en venta
select count(*) as [Total filas],count(titulo) as [Total libros],
min (precio_vta) as [Precio minimo],  max(precio_vta) as [Precio maximo],
max (precio_compra) as [Precio maximo comp], sum (precio_vta) as [Total venta],
avg (precio_vta) as [Promedio Venta] from Libros go

--2 Obtener el titulo y la editorial, la suma de las ventas, agrupar por titulos de libro donde la 
--suma sea mayor a $150
Select distinct titulo, editorial, sum (precio_vta) as [Total ventas] from Libros
group by titulo, editorial having sum (precio_vta) > 150; 

--3 Obtener el promedio del precio de venta de acuerdo a que este sea menor de 400 y agruparlos 
--por editorial
Select editorial, AVG (precio_vta) as [Total venta] from Libros group by editorial
having AVG (precio_vta) < 400 ;

--4 Obtener el precio maximo pero que se encuentre entre $400 y $100, ademas de ageuparlos y ordenar 
--los libros por editorial
Select MAX (precio_vta) as [Precio maximo], editorial from Libros where (precio_vta) <400 and 
(precio_vta) > 100 group by editorial order by editorial ; 
--5 Obtner los titulos y contarlos donde el precio de venta sea mayor a $100 que no sea nulo,
--agrupar por titulo siempre y cuando el titulo sea diferente a *------*
Select COUNT (titulo) as [Titulos] , titulo from Libros 
where titulo not like ('Avenida del parque 79') and precio_vta > 100 group by titulo;
 
--6 Promedio de precios de venta agrupados por titulos, pero solamente de aquellos grupos
-- cuyo promedio supere los $200
 select AVG(precio_vta) as [Promedio]  from Libros where precio_vta > 200 Group by titulo ; 