Create database Estacionamiento --Ejercicio 2 Reglas, Constraint y Default
use Estacionamiento

-- 1.	 Cree la tabla:

 create table Vehiculos(
	Patente char(6) not null,
	Tipo char(1),        --'a'=auto, 'm'=moto
	Horallegada datetime not null,
	Horasalida datetime
 );

 drop table Vehiculos
-- 2.	 Ingrese algunos registros:

insert into Vehiculos values ('AAA111','a','2000-01-21 13:00','')
insert into Vehiculos values ('ABC123','a','2003-02-11 12:00','')
insert into Vehiculos values ('ABC432','a','2006-04-21 14:00',null);
insert into Vehiculos values ('BBB432','a','2003-01-11 15:00',null);
 
 select * from Vehiculos 

--3.	Cree una regla para restringir los valores que se pueden ingresar en un campo "patente" 
--(3 letras seguidas de 3 dígitos) y asóciela al campo patente. 
 
 create rule Patente_Rule
 as
 @Patente like ('[A-Z][A-Z][A-Z][0-9][0-9][0-9]');
 go

 exec sp_bindrule 
 'Patente_Rule',
 'Vehiculos.Patente';
 GO


--4.	Ejecute el procedimiento almacenado del sistema 
--"sp_help" para ver que la regla creada anteriormente existe.
exec sp_help;

--5.	Ejecute el procedimiento almacenado del sistema "sp_helpconstraint" 
--para ver que la regla creada anteriormente no está asociada aún a ningún campo de la tabla "vehiculos".
exec sp_helpconstraint Vehiculos;


--6.	Intente ingresar un registro con valor para el campo "patente" que no cumpla con la regla. 

 insert into Vehiculos values ('ABCDEF','a','2000-03-01 18:00',null);


--7.	Cree otra regla que controle los valores para el campo "tipo" 
--para que solamente puedan ingresarse los caracteres "a" y "m", y asóciela al campo tipo.

 create rule Tipo_Rule
 as @Tipo in ('a','m');
 go

exec sp_bindrule 
'Tipo_Rule',
'Vehiculos.Tipo'
go

--8.	 Intente actualizar un registro cambiando el valor de "tipo" a un valor que no cumpla con la regla anterior.

 update Vehiculos set tipo='c' where patente='AAA111';


--9.	 Cree otra regla llamada "RG_vehiculos_tipo2" que controle los valores para el campo 
--"tipo" para que solamente puedan ingresarse los caracteres "a", "c" y "m".

CREATE RULE RG_vehiculos_tipo2
as @Tipo in ('a','c','m')
go

--10.	 Si la asociamos a un campo que ya tiene asociada otra regla, la nueva regla reeemplaza la 
--asociación anterior. Asocie la regla creada en el punto anterior al campo "tipo".

exec sp_bindrule 
'RG_vehiculos_tipo2',
'Vehiculos.Tipo'
go


--11.	Actualice el registro que no pudo actualizar en el punto 8.
 
  update Vehiculos set tipo='c' where patente='AAA111';


--12.	Cree una regla que permita fechas menores o iguales a la actual.

create Rule Fechas_Rule
as
@FechaHora <= getdate()
go

--13.	Asocie la regla anterior a los campos "horallegada" y "horasalida":

exec sp_bindrule
'Fechas_Rule',
'Vehiculos.Horallegada'
go

exec sp_bindrule
'Fechas_Rule',
'Vehiculos.Horasalida'
go

--14.	Ingrese un registro en el cual la hora de entrada sea posterior a la hora de salida:
 
 insert into Vehiculos values ('BBB432','a','2003-01-11 16:00','2003-01-11 14:00');


--15.	Intente establecer una restricción "check" que asegure que la fecha y hora de llegada a la playa 
--no sea posterior a la fecha y hora de salida.
 
 alter table Vehiculos
 add constraint FechasDiferentes check (Horallegada <=  Horasalida)
 go


alter table Vehiculos
drop constraint FechasDiferentes
go
--16.	 Elimine dicho registro si no le permitió insertar el punto anterior y Establezca la restricción "check" que no pudo establecer en el punto anterior.

delete from Vehiculos where Patente = 'BBB432'

 alter table Vehiculos
 add constraint FechasDiferentes check (Horallegada <=  Horasalida or Horasalida = null)
 go

--17.	Cree una restricción "default" que almacene el valor "b" en el campo "tipo:
 
 alter table Vehiculos
 add constraint Tipo Default 'b' for Tipo
 go
 

--18.	Intente ingresar un registro con el valor por defecto para el campo "tipo":

 insert into Vehiculos values ('CCC421',default,'2003-01-11 11:00','2003-01-11 14:00');


--19.	Vea las reglas asociadas a "empleados" y las restricciones aplicadas a la misma tabla ejecutando "sp_helpconstraint".
exec sp_helpconstraint Vehiculos;


