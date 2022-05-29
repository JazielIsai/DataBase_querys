use Northwind

--1. Obtener el nombre, id de categoria y precio de los productos que cuesten entre 50 y 100. 

select CategoryID, ProductName, UnitPrice from Products where UnitPrice >= 50 and UnitPrice <= 100

--2. Obtener el promedio del precio de todos los productos. 
select AVG(UnitPrice) from Products

Select * from Products 

--3. Obtener el nombre y precio del producto más barato. 
Select UnitPrice, ProductName from Products where UnitPrice = (select MIN(UnitPrice) from Products)

--4. Obtener el nombre del producto y nombre de la categoria a la que pertenece el producto llamado ‘Queso Cabrales’. 
Select ProductName, CategoryName from Products join Categories on Categories.CategoryID = Products.CategoryID
where ProductName = 'Queso Cabrales'

--5. Obtener el nombre de todas las categorias de productos y la suma del precio de los productos pertenecientes a cada categoria. 
select CategoryName, ProductName, (Select SUM(UnitPrice) from Products) from Categories 
join 
Products on Categories.CategoryID = Products.CategoryID

--6. De la consulta anterior obtener el nombre de la categoria y
--la suma del precio de sus productos de aquella categoria cuya suma del precio de sus productos sea la mas baja. 
select UnitPrice, CategoryName from Products 
join Categories on Categories.CategoryID = Products.CategoryID  
where UnitPrice = (select MIN(UnitPrice) from Products)
