-- Comprobación del USUARIO A
insert into Clientes values('Neftaly','3414565435')
insert into Productos values('Mause',8,150)

update Clientes set Nombre_Cli = 'Adareli' where ID_Cliente=1 

delete from Clientes where ID_Cliente = 1;
delete from Productos where ID_Producto = 1;

select * from Clientes;
select * from Productos;
select * from Ventas;

delete from Ventas where ID_Vta = 3;

--Comprobación del USUARIO B

insert into Ventas values (1,1,'Norma','Ram',2,1000,'20100210 12:30:00')

update Ventas set Nombre_Cli = 'Josue' where ID_Cliente=2 

select * from Clientes;
select * from Productos;