Create database libreria;
Use libreria;
create table Libros(
id_libro int not null primary key identity (1,1),
titulo char(80) not null,
descripci�n char(80) not null,
Autor char(80) not null,
precio_vta money ,
precio_compra money,
editorial char(80)
);
insert into Libros values ('Avenida del parque 79','Harols Robbins','Novela romantica','500','400','Las rosas')
insert into Libros values ('El coraz�n de la piedra',' Jos� Mar�a Garc�a L�pez','Novela europea','600','500','Nocturna')
insert into Libros values ('Salmos de v�speras','Harols Robbins','Novela romantica','350','200','Obra social de Caja de Avila')
insert into Libros values ('Officium Hebdomadae Sanctae de Tom�s Luis de Victoria','Samuel Rubio','edici�n cr�tica y un estudio del Oficio de Semana Santa.','400','250','Instituo de m�sica religiosa de Cuenca')
insert into Libros values ('Historia de la m�sica espa�ola 2. ','Harols Robbins','una secci�n muy extensa sobre Tom�s Luis de Victoria y un cat�logo de sus obras.','500','350','Alianza M�sica')
insert into Libros values ('Transcripci�n e interpretaci�n de la Polifon�a ','Miguel Querol Gavald�','peque�o manual para introducirse en la transcripci�n de la notaci�n blanca.','700','550','Servicio de publicaciones del Ministerio de Educaci�n y Ciencia')
insert into Libros values ('La polifon�a cl�sica','Samuel Rubio','trata sobre paleograf�a musical','750','600',' Biblioteca "la ciudad de Dios", Real Monasterio de El Escorial')
insert into Libros values ('Studies in the Music of Tom�s Luis de Victoria',' Eugene Casjen Cramer','Trata diversos aspectos puntuales de la m�sica de Victoria.','600','450','Ashgate')
insert into Libros values ('La m�sica en las catedrales espa�olas del Siglo de Oro','Robert Stevenson',' Incluye un an�lisis somero de algunas obras','650','500','Alianza M�sica')
insert into Libros values ('Tom�s Luis de Victoria: A guide to research','Eugene Casjen Cramer','Se trata de un complet�simo cat�logo de todas las ediciones de Victoria.','500','350','Garland Publishing Inc.')

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