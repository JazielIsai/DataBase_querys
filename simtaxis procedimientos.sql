select * from cliente

select * from cliente where direccion='centro'


-- crear el procedimiento almacenado 
create procedure uno 
as
	select * from cliente where direccion='centro'
go

exec uno

create proc Altas_clientes
@id_cliente varchar(50),
@nombre varchar(50),
@direccion varchar(50)
as begin
   	if(exists (select*from cliente where id_cliente=@id_cliente))
         	print 'Usuario ya existente'
   	else
         	begin
         	insert into cliente values(@id_cliente, @nombre, @direccion)
         	print 'guardado'
         	end
   	end
go








