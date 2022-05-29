Create database ITESI
use ITESI


create table Carrera(
IdC varchar(12) not null primary key,-- LLAVE PRIMARIA
Carrera varchar(50) not null,
Coordinador Varchar(50) not null
)

Create table Alumn(
Nctrl_Alumn varchar(12) not null primary key, -- LLAVE PRIMARIA
Nombre_Alumn varchar(50) not null,
Direccion varchar(50) not null,
Edad tinyint not null,
IdC varchar(12) not null
)


alter table Alumn
add constraint fk_Carrera foreign key (IdC) 
references Carrera(IdC)
go


insert into Carrera Values ('00000001', 'Ing. Sistemas Computacionales','Ing. Mares')
insert into Carrera Values ('00000002', 'Ing. Industrial','Ing. Farfan')
insert into Carrera Values ('00000003', 'Ing. Gestion Empresarial','Ing. Cesar')

insert into Alumn Values ('LIS18110001', 'Hadid','Arandas',21,'00000001')
insert into Alumn Values ('LIS18110002', 'Laura','Ignacio',20,'00000001')
insert into Alumn Values ('LIS18110003', 'Miguel','Garcia',19,'00000001')
insert into Alumn Values ('LIS18110004', 'Josue','Villas',20,'00000002')
insert into Alumn Values ('LIS18110005', 'Jose','Benito Juarez',18,'00000002')
insert into Alumn Values ('LIS18110006', 'Alonso','Narangal',19,'00000002')
insert into Alumn Values ('LIS18110007', 'Emmanuel','Mariano Zapata',20,'00000003')
insert into Alumn Values ('LIS18110008', 'Mariel','Tamarindo',21,'00000003')
insert into Alumn Values ('LIS18110009', 'Fidel','Estrella',22,'00000003')


alter table Alumn
alter Column Edad smallint
go

update Carrera set Carrera = 'Ing. Ambiental' where IdC = '00000001'


delete from Carrera where IdC in (
select IdC from Alumn where IdC = '00000001')


select * from Carrera;
select * from Alumn;
drop table Carrera
drop table Alumn





