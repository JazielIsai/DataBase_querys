Create database Clientes_indice
go
use Clientes_indice

create table listado
(
Nombre varchar(50) null,
Apellido varchar(50) null,
Direccion varchar(50),
Tel int,
Cel int,
email varchar(50)
)


insert into listado values ('Luis', 'Hernandez', 'Dirección1', 1423569874, 1259874521,'luis@gmail.com')
insert into listado values ('Carmen', 'Hernán', 'Dirección2', 1423560984, 1586554452,'Carmen@gmail.com')
insert into listado values ('Helena', 'López', 'Dirección3', 1423569254, 1259877854,'helena@gmail.com')
insert into listado values ('José', 'Rodríguez', 'Dirección4', 1258632589, 1258974125,'jose@gmail.com')
insert into listado values ('Diana', 'Campor', 'Dirección5', 1258452589, 1258978954,'diana@gmail.com')
insert into listado values ('Luisa', 'Villafaña', 'Dirección6', 1627485962, 00000000,'luisa@gmail.com')
insert into listado values ('Miguel', 'Laguna', 'Dirección7', 1226034699, 1121714958,'miguel@gmail.com')
insert into listado values ('Hugo', 'Valencia', 'Dirección8', 1587463285, 178521035,'hugo@gmail.com')
insert into listado values ('David', 'Fuentes', 'Dirección9', 162111289, 1625871122,'david@gmail.com')
insert into listado values ('Santiago', 'Delgado', 'Dirección10',1587421309, 1859632145,'angel@gmail.com')

--INDICES AGRUPADOS
select * from listado

execute sp_helpindex 'listado' --Muestra los indices creados para la tabla listado y en que campo se asigno

--Creación de un indice agrupado para el campo nombre
create clustered index IDX_Nombre
on listado (nombre)

--Se comprueba el ordenamiento de la columna nombre
select * from listado

--INDICES NO AGRUPADOS
/*Sus datos no pueden ser agrupados pero se crea un indice no agrupado para mejorar el rendimiento de las consultas usadas con frecuencia*/

create nonclustered index IDX_Apellido
on listado (apellido)

--NOTA: una tabla solo puede tener un indice agrupado.

--Se comprueba el ordenamiento de la columna apellido

select nombre,apellido from listado

select apellido from listado