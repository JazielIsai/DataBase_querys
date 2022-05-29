Create database EMPRESA  
use EMPRESA

Create table Clientes(
ID_Cliente int not null primary key identity(1,1),
Nombre_Cli char(30) not null,
Telefono varchar(10) not null
);

Create table Productos (
ID_Producto int not null primary key identity(1,1),
Nombre_Prod varchar(30) not null,
Piezas int not null,
Precio money not null
);

Create Table Ventas(
ID_Vta int not null primary key identity(1,1),
ID_Cliente int not null,
ID_Producto int not null,
Nombre_Cli char(30) not null,
Nombre_Prod varchar(30) not null,
Piezas int not null,
Monto money not null,
Fecha smalldatetime not null,
foreign key (ID_Cliente) references Clientes(ID_Cliente),
foreign key (ID_Producto) references Productos(ID_Producto)
);

--Clientes
insert into Clientes values('Norma','3411266136')
insert into Clientes values('David','3313261366')
insert into Clientes values('Leticia','3411253234')
insert into Clientes values('Zaret','3413453212')
insert into Clientes values('Hiram','3415432123')

--Productos
insert into Productos values('Ram',5,500)
insert into Productos values('CPU',4,4500)
insert into Productos values('Disco Duro',9,2500)
insert into Productos values('Laptop',9,15000)
insert into Productos values('Teclados',3,350)

--Ventas
insert into Ventas values (1,1,'Norma','Ram',2,1000,'20100210 12:30:00')
insert into Ventas values (2,4,'David','Laptop',1,15000,'20100211 01:30:00')
insert into Ventas values (2,1,'David','Ram',1,500,'20100212 02:30:00')
insert into Ventas values (3,3,'Leticia','Disco Duro',1,2500,'20100213 03:30:00')
insert into Ventas values (4,2,'Zaret','CPU',1,4500,'20100214 04:30:00')

--USER A_0
Create login USER_0A
with password = '1234'

create user USER_0A for login USER_0A;

grant insert,update on Clientes to USER_0A
grant insert,update on Productos to USER_0A

deny delete on Clientes to USER_0A
deny delete on Productos to USER_0A

grant select on Clientes to USER_0A
grant select on Productos to USER_0A
grant select on Ventas to USER_0A

grant delete on Ventas to USER_0A

--Creación del usuario B
create login USER_0B
with password = '321'

create user USER_0B for Login USER_0B;

grant insert,update,select on Ventas to USER_0B

deny select on Clientes to USER_0B
deny select on Productos to USER_0B


