--Usuario A

insert into Tarjeta_Circulaci�n values (1,5,'Mriel','Alonso','43-32-A','2011', 'Spark','2016-11-23')

select * from Vehiculo;
select * from Licencia;
select * from Tarjeta_Circulaci�n;

delete from Tarjeta_Circulaci�n where ID_Licencia = 1 and ID_Vehiculo= 5
delete from Vehiculo where ID_Vehiculo = 5
delete from Licencia where ID_Licencia = 3

update Licencia set Apellidos ='Diaz' where ID_Licencia = 1
update Vehiculo set Marca ='Camaro' where ID_Vehiculo = 1





--UsuarioB

delete from Tarjeta_Circulaci�n where ID_Licencia = 1 and ID_Vehiculo= 5

update Tarjeta_Circulaci�n set Apellidos ='Diaz' where ID_Licencia = 1

insert into Tarjeta_Circulaci�n values (1,5,'Mriel','Alonso','43-32-A','2011', 'Spark','2016-11-23')


select * from Vehiculo;
select * from Licencia;







