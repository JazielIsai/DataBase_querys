Create database Farmacia;
Use Farmacia;

create table Cliente(
id_cliente int not null primary key identity (1,1),
nombre char(20) not null,
apellidos char(29) not null,
telefono decimal not null,
correo varchar(50) not null, 
edad decimal not null,
);

create table Producto(
id_producto int not null primary key identity (1,1),
nombre char(40) not null,
descripcion varchar(60) not null,
precio float not null,
cantidad int not null,
);

Create Table Inventario(
id_inv int not null primary key identity (1,1),
id_producto int not null,
cantidad int not null,
constraint fk_Producto foreign key (id_producto) references Producto(id_producto)
); 

create table Empleado(
id_empleado int not null primary key identity (1,1),
nombre char(20) not null,
telefono decimal not null,
domicilio varchar(50) not null
);
 
Create Table Ventas(
id_venta int not null primary key identity (1,1),
id_cliente int not null,
id_producto int not null,
id_empleado int not null,
cantidad int not null,
total float not null,
constraint fk_cliente foreign key (id_cliente) references Cliente (id_cliente),
constraint fk_Productos foreign key (id_producto) references Producto (id_producto),
constraint fk_Empleado foreign key (id_empleado) references Empleado (id_empleado)
 );

 select*from Ventas;
 select * from Producto ;
 select * from Cliente;
  select * from Inventario;
 select * from Empleado;
 insert into Cliente values ('Nombre', 'Apellido',234567,'jdnksjc');
	
 drop table Ventas;
 drop table Inventario;
 drop table Cliente;
 drop table Empleado;
 drop table Producto;
