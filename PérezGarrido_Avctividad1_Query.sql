Create database MiniTienda
use MiniTienda

Create table Proveedor(
id_Proveedor int not null primary key identity (1,1),
Nombre varchar(20) not null,
Apellido varchar(20) not null,
Empresa varchar(20) not null
)

Create table Productos(
id_Producto int not null primary key identity(1,1),
Nombre_Producto varchar(20) not null,
Descripcion varchar(20) not null,
id_Proveedor int foreign key (id_Proveedor) references Proveedor
)

create table Clientes(
id_Cliente int not null primary key identity(1,1),
Nombre_Cliente varchar(20),
)

Create table Ventas(
id_venta int not null primary key identity(1,1),
Venta_Producto varchar(30) not null,
id_Producto INT foreign key (id_Producto) references Productos,
id_Cliente int foreign key (id_Cliente) references Clientes
)

select * from Proveedor
select * from Productos
select * from Clientes
select * from Ventas

insert Proveedor values ('Maximiliano', 'Manjarrez', 'frutiprogramadores')
insert Proveedor values ('Carlos', 'Sanchez', 'Mochila-LED')
insert Proveedor values ('Fransisco', 'López', 'Led-Play')

insert Productos values ('Sabritas', 'Papas', 1)
insert Productos values ('Cocacola', 'Refresco negro', 2)
insert Productos values ('Galletas', 'Paquete de 10', 3)

insert Clientes values ('Mariana')
insert Clientes values ('Marion')
insert Clientes values ('Kevin')

insert Ventas values ('Cocacola', 2,1)
insert Ventas values ('Sabritas', 1,2)
insert Ventas values ('Galletas', 3,3)