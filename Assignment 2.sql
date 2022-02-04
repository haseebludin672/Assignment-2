                           --Assignment 2---

--answer question 1--

Select count(*) as countednumber
from Production.Product pp


--answer question 2--

Select count(pp.ID) as counted
from Production.Product pp
where pp.productsubcategoryid is not null


--answer question 3--

Select  pp.ProductSubcategoryID , count(pp.ProductID) as countedproducts
from Production.Product pp
group by pp.ProductSubcategoryID 
order by pp.ProductSubcategoryID


--answer question 4--

select count(Distinct pp.ProductID)
from production.Product  pp


--answer question 5--
select sum(ab.Quantity) as TOTAL
from production.productinventory ab


--answer question 6--

select ab.ProductID, sum(ab.ProductID) as theSum
from production.productinventory ab
where ab.LocationID =40
group by ab.ProductID
having sum(ab.quantity)<100
order by ab.ProductID
--answer question 7--

select ab.ProductID,ab.Shelf, sum(ab.ProductID) as theSum
from production.productinventory ab
where ab.LocationID =40
group by ab.ProductID, ab.Shelf
having sum(ab.quantity)<100
order by ab.ProductID desc

--answer question 8 --

select avg(ab.Quantity) as avarageQuantity
from production.productinventory ab
where ab.LocationID = 10


--answer question 9 --

select ab.ProductID,ab.Shelf, avg(ab.Quantity) as TheAvg
from production.productinventory ab
group by ab.ProductID, ab.Shelf

--answer question 10--

select ab.ProductID,ab.Shelf, avg(ab.Quantity) as TheAvg
from production.productinventory ab
where ab.Shelf NOt in('N/A')
group by ab.ProductID, ab.Shelf


-- answer quesiton 11--


select  pp.Color ,pp.Class, 
		count(pp.listprice) as TheCount,
		avg(pp.ListPrice) as AvgPrice
 from production.Product pp
 group by pp.Color, pp.Class


 --answer question 12--

 select CR.Name as Country, sp.Name as province
 from person.CountryRegion CR INner join person.StateProvince SP
ON CR.CountryRegionCode= SP.CountryRegionCode

--answer question 13--

select CR.Name as Country, sp.Name as province
 from person.CountryRegion CR INner join person.StateProvince SP
 ON CR.CountryRegionCode= SP.CountryRegionCode
where CR.Name In('Germany', 'canada')


                 -- northwnd Database --

 -- answer question 14
Select distinct p.ProductID, p.ProductName
from Orders O inner join [Order Details] od on O.OrderID= Od.OrderID
			  inner join Products p on p.ProductID= od.ProductID

	where DATEDIFF(year, o.OrderDate, GETDATE())< 25;

--assignment qustion 15--

select top 5 o.ShipPostalCode , sum(od.Quantity) as maxQunatity
from Orders o inner join [Order Details] od on O.OrderID= od.OrderID
where O.ShipPostalCode != 'null' 
group by o.ShipPostalCode

--assignment question 16--

select top 5 o.ShipPostalCode, sum(od.Quantity) as maxQunatity
from Orders o inner join [Order Details] od on O.OrderID= od.OrderID
 where   O.ShipPostalCode != 'null' 
		and year(o.OrderDate)= year(getdate())-25
 group by o.ShipPostalCode,
 

 --assignment qestion 17--

select  c.City, count(c.CustomerID) as Customernumber
from Customers c
group by c.City

--answer question 18-- 

select  c.City, count(c.CustomerID) as Customernumber
from Customers c
group by c.City
having count(c.CustomerID)>2

-- answer question 19--
select c.CustomerID, c.CompanyName, c.ContactName
from Customers c join  Orders o on o.CustomerID= c.CustomerID
where o.OrderDate > '1/1/1998'

-- answer question 20--

select c.ContactName , max(o.OrderDate) as RecentOrder
from Customers c left join  Orders o on o.CustomerID= c.CustomerID
group by c.ContactName

-- answer question 21--

select c.CustomerID, c.CompanyName, c.ContactName
		, sum(od.Quantity) as numberOfPorducts
from Customers c left join  Orders o on o.CustomerID= c.CustomerID
				 left join [Order Details]od on o.OrderID=od.OrderID
group by c.CustomerID,C.CompanyName, c.ContactName

--answer question 22--

select c.CustomerID,c.ContactName,
		sum(od.Quantity) as countsOfPorducts
from Customers c left join  Orders o on o.CustomerID= c.CustomerID
				 left join [Order Details] od on o.OrderID=od.OrderID
group by c.CustomerID, c.ContactName
having sum(Quantity)>100

--answer question 23--


