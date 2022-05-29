create database HoldingEmpresarial
use HoldingEmpresarial

Create table Vendedor(
id_vendedor int not null identity(1,1) primary key,
Nombre_Vendedor varchar(20) not null,
fecha date not null
);

Create table Empresa(
id_Empresa int not null identity(1,1),
Nombre_Empresa varchar(30) not null,
fecha date not null, 
id_vendedor int not null,
id_Asesor int not null,
id_Ciudad int not null
);

Create table Pais(
id_Pais int not null primary key identity(1,1),
Nombre_Pais varchar(30) not null,
Capital_Pais varchar(30) not null,
Habitantes_Pais varchar(30) not null
);

Create table Asesor(
id_Asesor int not null primary key identity(1,1),
Nombre_Asesor varchar(20) not null,
Titulo_Asesor varchar(25) not null,
id_empresa int not null
);

create table Ciudad(
id_Ciudad int not null primary key identity(1,1),
Nombre_Ciudad varchar(30) not null,
Habitantes_Ciudad varchar(30) not null,
id_Empresa int not null,
id_Pais int not null
);


alter table Empresa
add constraint fk_Vendedor foreign key (id_vendedor) 
references Vendedor(id_vendedor)
go
alter table Vendedor
add constraint uk_Empresa unique (id_vendedor)


alter table Empresa
add constraint fk_Asesor foreign key (id_Asesor) 
references Asesor(id_Asesor),
constraint fk_Ciudad foreign key (id_Ciudad)
references Ciudad(id_Ciudad)
go
alter table Empresa
add constraint pk_resarva primary key(id_Asesor,id_Ciudad)

Alter table Ciudad
add constraint fk_Ciudad_pais foreign key (id_Pais)
references Pais(id_Pais)

drop table Vendedor
drop table Empresa
drop table Pais
drop table Ciudad
drop table Asesor

select * from Vendedor  
select * from Empresa
select * from Pais  
select * from Ciudad
select * from Asesor  


Insert into Vendedor values ('Jorje', '09-02-12')
insert into Pais values ('Israel', 'Jerusalen', '900000')
insert into Ciudad values ('Galilea', '5000', 1,1)
insert into Asesor values ('Nathan','Administrador',1)
insert into Empresa values ('Similares', '08-05-67', 1,1,1)