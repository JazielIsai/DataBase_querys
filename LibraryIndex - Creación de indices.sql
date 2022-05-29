Create database LibraryIndex;
Use LibraryIndex;

create table Books(
id_libro int not null identity (1,1),
titulo char(80) not null,
descripción char(80) not null,
Autor char(80) not null,
precio_vta money ,
precio_compra money,
editorial char(80)
);

insert into Books values ('Avenida del parque 79','Harols Robbins','Novela romantica','500','400','Las rosas')
insert into Books values ('El corazón de la piedra',' José María García López','Novela europea','600','500','Nocturna')
insert into Books values ('Salmos de vísperas','Harols Robbins','Novela romantica','350','200','Obra social de Caja de Avila')
insert into Books values ('Officium Hebdomadae Sanctae de Tomás Luis de Victoria','Samuel Rubio','edición crítica y un estudio del Oficio de Semana Santa.','400','250','Instituo de música religiosa de Cuenca')
insert into Books values ('Historia de la música española 2. ','Harols Robbins','una sección muy extensa sobre Tomás Luis de Victoria y un catálogo de sus obras.','500','350','Alianza Música')
insert into Books values ('Transcripción e interpretación de la Polifonía ','Miguel Querol Gavaldá','pequeño manual para introducirse en la transcripción de la notación blanca.','700','550','Servicio de publicaciones del Ministerio de Educación y Ciencia')
insert into Books values ('La polifonía clásica','Samuel Rubio','trata sobre paleografía musical','750','600',' Biblioteca "la ciudad de Dios", Real Monasterio de El Escorial')
insert into Books values ('Studies in the Music of Tomás Luis de Victoria',' Eugene Casjen Cramer','Trata diversos aspectos puntuales de la música de Victoria.','600','450','Ashgate')
insert into Books values ('La música en las catedrales españolas del Siglo de Oro','Robert Stevenson',' Incluye un análisis somero de algunas obras','650','500','Alianza Música')
insert into Books values ('Tomás Luis de Victoria: A guide to research','Eugene Casjen Cramer','Se trata de un completísimo catálogo de todas las ediciones de Victoria.','500','350','Garland Publishing Inc.')



--INDICES AGRUPADOS
select * from Books

execute sp_helpindex 'Books' --Muestra los indices creados para la tabla listado y en que campo se asigno

--Creación de un indice agrupado para el campo titulo
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