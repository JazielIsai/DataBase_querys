Create database LibraryIndex;
Use LibraryIndex;

create table Books(
id_libro int not null identity (1,1),
titulo char(80) not null,
descripci�n char(80) not null,
Autor char(80) not null,
precio_vta money ,
precio_compra money,
editorial char(80)
);

insert into Books values ('Avenida del parque 79','Harols Robbins','Novela romantica','500','400','Las rosas')
insert into Books values ('El coraz�n de la piedra',' Jos� Mar�a Garc�a L�pez','Novela europea','600','500','Nocturna')
insert into Books values ('Salmos de v�speras','Harols Robbins','Novela romantica','350','200','Obra social de Caja de Avila')
insert into Books values ('Officium Hebdomadae Sanctae de Tom�s Luis de Victoria','Samuel Rubio','edici�n cr�tica y un estudio del Oficio de Semana Santa.','400','250','Instituo de m�sica religiosa de Cuenca')
insert into Books values ('Historia de la m�sica espa�ola 2. ','Harols Robbins','una secci�n muy extensa sobre Tom�s Luis de Victoria y un cat�logo de sus obras.','500','350','Alianza M�sica')
insert into Books values ('Transcripci�n e interpretaci�n de la Polifon�a ','Miguel Querol Gavald�','peque�o manual para introducirse en la transcripci�n de la notaci�n blanca.','700','550','Servicio de publicaciones del Ministerio de Educaci�n y Ciencia')
insert into Books values ('La polifon�a cl�sica','Samuel Rubio','trata sobre paleograf�a musical','750','600',' Biblioteca "la ciudad de Dios", Real Monasterio de El Escorial')
insert into Books values ('Studies in the Music of Tom�s Luis de Victoria',' Eugene Casjen Cramer','Trata diversos aspectos puntuales de la m�sica de Victoria.','600','450','Ashgate')
insert into Books values ('La m�sica en las catedrales espa�olas del Siglo de Oro','Robert Stevenson',' Incluye un an�lisis somero de algunas obras','650','500','Alianza M�sica')
insert into Books values ('Tom�s Luis de Victoria: A guide to research','Eugene Casjen Cramer','Se trata de un complet�simo cat�logo de todas las ediciones de Victoria.','500','350','Garland Publishing Inc.')



--INDICES AGRUPADOS
select * from Books

execute sp_helpindex 'Books' --Muestra los indices creados para la tabla listado y en que campo se asigno

--Creaci�n de un indice agrupado para el campo titulo
create clustered index IDX_Titulo
on Books (titulo)

--Se comprueba el ordenamiento de la columna titulo
select * from Books

--INDICES NO AGRUPADOS
/*Sus datos no pueden ser agrupados pero se crea un indice no agrupado para mejorar el rendimiento de las consultas usadas con frecuencia*/

create nonclustered index IDX_Autor
on Books (Autor)

--NOTA: una tabla solo puede tener un indice agrupado.

--Se comprueba el ordenamiento de la columna apellido

select * from Books

select titulo,Autor from Books

select Autor from Books