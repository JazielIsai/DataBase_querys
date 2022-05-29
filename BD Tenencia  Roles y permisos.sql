Create database TENENCIA  
use TENDENCIA

Create table Vehiculo(
ID_Vehiculo int not null primary key identity(1,1),
Placa char(7) not null,
Modelo varchar(20) not null,
Color varchar(10) not null,
Marca varchar(10) not null
);

Create table Licencia (
ID_Licencia int not null primary key identity(1,1),
Nombre_propietario  varchar(20) not null,
Apellidos varchar(20) not null,
Fecha_Nacimiento date not null,
Fecha_Expedicion date not null,
Fecha_Vigencia date not null
);

Create Table Tarjeta_Circulación(
ID_Licencia int not null,
ID_Vehiculo int not null,
Nombre_Propietario varchar(20) not null,
Apellidos varchar(20) not null,
Placa char(7) not null,
Modelo varchar(20) not null,
Marca varchar(20) not null,
Fecha_Expedicion date not null,
foreign key (ID_Licencia) references Licencia(ID_Licencia),
foreign key (ID_Vehiculo) references Vehiculo(ID_Vehiculo)
);
--Vehiculo
insert into Vehiculo values('43-32-A','2011','Negro', 'Spark')
insert into Vehiculo values('76-22-B','2009','Blanco', 'Audi')
insert into Vehiculo values('94-42-C','2019','Rojo', 'Versa')
insert into Vehiculo values('89-47-D','2008','Verde', 'Corsa')
insert into Vehiculo values('32-98-E','2029','Azul', 'Yaris')

--Licencia
insert into Licencia values('Norma','Garrido', '1969-04-14', '2011-05-30','2021-04-20')
insert into Licencia values('David','Garrido', '1979-07-05', '2011-05-23','2021-06-28')
insert into Licencia values('Leticia','Garrido', '1983-01-09', '2011-05-25','2021-05-30')
insert into Licencia values('Mariel','Alonso', '2004-05-08', '2015-08-20','2026-06-29')
insert into Licencia values('Diana','López', '1996-06-14', '2016-11-23','2023-03-20')

--Tarjeta_Circulación
insert into Tarjeta_Circulación values (1,1,'Norma','Garrido','43-32-A','2011', 'Spark','2011-05-30')
insert into Tarjeta_Circulación values (2,2,'David','Garrido','76-22-B','2009', 'Audi','2011-05-23')
insert into Tarjeta_Circulación values (3,3,'Leticia','Garrido','94-42-C','2019', 'Versa','2011-05-25')
insert into Tarjeta_Circulación values (4,4,'Mariel','Alonso','89-47-D','2008', 'Corsa','2015-08-20')
insert into Tarjeta_Circulación values (5,5,'Diana','López','32-98-E','2029', 'Yaris','2016-11-23')

select * from Vehiculo;
select * from Licencia;
select * from Tarjeta_Circulación;

drop table Licencia;
drop table Tarjeta_Circulación


create login USUARIO_A
with password = '321';

create user USUARIO_A for login USUARIO_A;

grant insert on Tarjeta_Circulación to USUARIO_A;

deny update, delete on Licencia to USUARIO_A;
deny update, delete on Vehiculo to USUARIO_A;

grant select on Licencia to USUARIO_A;
grant select on Vehiculo to USUARIO_A;
grant select on Tarjeta_Circulación to USUARIO_A;


create login USUARIO_B 
with password = '123'

create user USUARIO_B for login USUARIO_B;

grant delete, select on Tarjeta_Circulación to USUARIO_B;

deny update on Tarjeta_Circulación to USUARIO_B

grant insert on Tarjeta_Circulación to USUARIO_B;

deny select on Vehiculo to USUARIO_B;
deny select on Licencia to USUARIO_B;
