Create database	PIZZERIA
use PIZZERIA

create table VENDEDOR(
CVENDEDOR CHAR(3),
NOMBRE VARCHAR (30)
);

create table PIZZA(
ID_PIZZA INT,
DESCRIPCION VARCHAR(30),
COSTO MONEY,
VENDIDO CHAR(1),
CVENDEDOR CHAR(3) 
);

create table VENTAS(
NO_VTA INT,
FECHA SMALLDATETIME,
IMPORTE MONEY,
ID_PIZZA INT
);

-- 2.	Realizar la creación de la tabla historial con la fecha del sistema, 
-- descripción de lo que se hizo y el nombre del usuario y generar triggers 
-- en los que se guarde las acciones que se realicen en la tabla Ventas. VALOR 10 PUNTOS


create table Historial(
FECHA SMALLDATETIME,
DESCRIPCION VARCHAR(30),
NOMBRE VARCHAR (30)
);
Select * from Historial;

create TRIGGER Insert_HistorialVentas
on VENTAS
for insert 
as
set nocount on
insert into Historial values(GETDATE(), 'Pizza de peperoni', 'Hiram');

CREATE TRIGGER TG_InsertHistorial
ON Historial 
after insert 
as 
declare @FECHA SMALLDATETIME
declare @DESCRIPCION varchar(30)
declare @NOMBRE VARCHAR (30)
select @FECHA = @FECHA from VENTAS
select @DESCRIPCION = DESCRIPCION from PIZZA
select @NOMBRE = NOMBRE from VENDEDOR
insert into Historial values (@FECHA , @DESCRIPCION, @NOMBRE)
go




--3.	Realizar la inserción con código de 5 registros para cada tabla. VALOR 05 PUNTOS.

insert into VENDEDOR values ('12A','Zabdiel Vera');
insert into VENDEDOR values ('12B','Dan Vera');
insert into VENDEDOR values ('12C','Neftaly Vera');
insert into VENDEDOR values ('12D','Zaret Vera');
insert into VENDEDOR values ('12E','Isaí Vera');


insert into PIZZA values (1,'Pizza Hawaiana', 200, 'V','12A');
insert into PIZZA values (2,'Pizza de Choriso', 230, 'V','12B');
insert into PIZZA values (3,'Pizza de Salami', 210, 'V','12C');
insert into PIZZA values (4,'Pizza de Pollo', 220, 'V','12D');
insert into PIZZA values (5,'Pizza de Queso', 240, 'V','12E');

insert into VENTAS values (1, GETDATE(), 200, 1);
insert into VENTAS values (2,GETDATE(), 230, 2);
insert into VENTAS values (3,GETDATE(), 210, 3);
insert into VENTAS values (4,GETDATE(), 220, 4);
insert into VENTAS values (5,GETDATE(), 240, 5);

Select * from VENDEDOR
Select * from PIZZA
Select * from VENTAS

-- 4.	Crear un trigger que realice lo siguiente: 
-- La clave del vendedor solo aceptara valores que inicien con dos dígitos, 
-- seguidos de una letra. VALOR 10 PUNTOS.

CREATE TRIGGER TR_ClaveVendedor
ON VENDEDOR                          
AFTER INSERT
AS
ALTER TABLE VENDEDOR
ADD CONSTRAINT Cons_ClaveVendedor Check (CVENDEDOR like '[0-9][0-9][A-Z]')


insert into VENDEDOR values ('12F','Jaziel Pérez');
Select * from VENDEDOR
--5.	Crear un trigger que muestre el mensaje "EL IMPORTE DE VENTA ES MENOR AL COSTO DE LA PIZZA", 
-- cuando al vender una pizza su precio de importe sea menor al costo de la pizza. VALOR 15 PUNTOS.

CREATE TRIGGER IMPORTE_MENOR 
ON VENTAS
FOR INSERT
AS DECLARE @Comprobar INT 
SET @Comprobar = (SELECT IMPORTE FROM VENTAS JOIN INSERTED ON INSERTED.ID_PIZZA = VENTAS.ID_PIZZA)
INSERT INTO VENTAS VALUES (6,GETDATE(),230,4)
IF (@Comprobar <(SELECT IMPORTE FROM VENTAS))
BEGIN
PRINT 'EL IMPORTE DE VENTA ES MENOR AL COSTO DE LA PIZZA'
ROLLBACK TRAN
END;


--6.	Crear una transacción, para obtener el importe acumulado de Ventas de acuerdo 
-- a la descripción de cada PIZZA, mandar un mensaje de error si se coloca una descripción distinta. 
BEGIN BEGIN TRANSACTION;
 Declare @id_PIZZA int
    Set @id_PIZZA = 1
    If(
	 (select count(*) from VENTAS 
	 where ID_PIZZA = @id_PIZZA) >= 1
	)
    BEGIN
    
	SELECT SUM(IMPORTE) FROM VENTAS 
	GROUP BY ID_PIZZA 
	HAVING ID_PIZZA = @id_PIZZA;
    
	rollback
    end
END


-- 7.	Crear una transacción que al insertar en la tabla pizza, 
-- considerando que si ya esta registrado un id o una descripción 
--repetida mande un error y deshaga la transacción. VALOR 10 PUNTOS
BEGIN 
 BEGIN TRANSACTION;
 declare @id_Pizza int
    set @id_Pizza = 1
    IF((select ID_PIZZA from PIZZA) = @id_Pizza)
   
   begin
    
	GROUP BY ID_PIZZA 
	HAVING ID_PIZZA = @id_PIZZA;
    
	rollback
    end
END

-- 8.	Crear una transacción para que pueda borrar algún registro de la tabla venta, 
-- pero este debe desaparecer de las tablas restantes. VALOR 15 PUNTOS


BEGIN BEGIN TRANSACTION;
 DELETE FROM VENTAS WHERE ID_PIZZA =2;
 COMMIT TRANSACTION;
END



--9.	Crear una transacción para la actualización del nombre de una pizza, 
--siempre y cuando esta no se haya vendido durante el día actual. VALOR 15 PUNTOS

BEGIN BEGIN TRANSACTION;
 UPDATE PIZZA SET DESCRIPCION = 'NO VENDIDO' WHERE VENDIDO = 'V';
 COMMIT TRANSACTION;
END