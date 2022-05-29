use Northwind

Create view Vista_Promociones_Cliente
as
select LastName, FirstName, HomePhone, Extension,Address,City,Country
from Employees
where EmployeeID in(
select EmployeeID  from Orders where (OrderDate BETWEEN '19971201' and '19971231') and (ShipCountry = 'USA'))




select * from Vista_Promociones_Cliente










select * from Orders 

select * from Orders where OrderDate BETWEEN '19971201' and '19971231' and (ShipCountry = 'USA')

drop view Vista_Promociones_Cliente
