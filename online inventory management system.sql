create database inventory
 use inventory
create table Category(
Categoryid int primary key,
categoriesname varchar(20),
description varchar(30),
manufactured date)
--------------------------------
#change the category tables column datatype
ALTER TABLE Category MODIFY description VARCHAR(255);
-------------------------------
INSERT INTO Category (CategoryID, categoriesname, description, manufactured) VALUES
(1, 'Electronics', 'Electronic gadgets and devices', '2025-01-01'),
(2, 'Clothing', 'Men and Women clothing', '2025-01-02'),
(3, 'Home Appliances', 'Appliances for home use', '2025-01-03'),
(4, 'Books', 'Educational and entertainment books', '2025-01-04'),
(5, 'Beauty', 'Beauty and personal care products', '2025-01-05'),
(6, 'Sports', 'Sports and fitness equipment', '2025-01-06'),
(7, 'Toys', 'Toys and kids products', '2025-01-07'),
(8, 'Furniture', 'Home and office furniture', '2025-01-08'),
(9, 'Stationery', 'Office and school stationery', '2025-01-09'),
(10, 'Groceries', 'Daily grocery items', '2025-01-10'),
(11, 'Footwear', 'Shoes and sandals', '2025-01-11'),
(12, 'Watches', 'Wrist watches and smartwatches', '2025-01-12'),
(13, 'Jewelry', 'Gold, Silver, Artificial Jewelry', '2025-01-13'),
(14, 'Mobile Accessories', 'Chargers, Cases, Earphones', '2025-01-14'),
(15, 'Kitchenware', 'Cooking and kitchen tools', '2025-01-15'),
(16, 'Health', 'Health care items', '2025-01-16'),
(17, 'Garden', 'Garden tools and plants', '2025-01-17'),
(18, 'Automobile', 'Car and bike accessories', '2025-01-18'),
(19, 'Pet Supplies', 'Products for pets', '2025-01-19'),
(20, 'Music', 'Instruments and accessories', '2025-01-20'); 
------------------------------------


drop table Category
drop table Supplier
drop table product
drop table customer
drop table Orders
drop table OrderDetails
-----------------------------------
create table Supplier(
supplierid int,
suppliername varchar(20) not null,
contactname varchar(20)unique,
phone varchar(15))

------------------------------------
INSERT INTO Supplier (supplierid, suppliername, Contactname, phone, email) VALUES
('SUP001', 'Tech Distributors', 'Karthika', '9876543210', 'karthika@techdist.com'),
('SUP002', 'Global Traders', 'Vicky', '8765432109', 'ajay@globaltraders.com'),
('SUP003', 'Fashion Hub', 'Hari', '7654321098', 'hari@fashionhub.com'),
('SUP004', 'Book World', 'Ruby', '6543210987', 'ruby@bookworld.com'),
('SUP005', 'Grocery Mart', 'Sneha', '5432109876', 'sneha@grocerymart.com'),
('SUP006', 'Home Essentials Co.', 'Sumi', '4321098765', 'sumi@homeessentials.com'),
('SUP007', 'Appliance Depot', 'Priya', '3210987654', 'priya@appliancedepot.com'),
('SUP008', 'Toy Planet', 'Durga', '2109876543', 'durga@toyplanet.com'),
('SUP009', 'Beauty Bliss', 'Ajay', '1098765432', 'vicky@beautybliss.com'),
('SUP010', 'Sports Empire', 'Ragava', '1987654321', 'ragava@sportsempire.com');
select * from supplier
----------------------------------------
CREATE TABLE product(
  productid varchar(10) PRIMARY KEY,
  productname VARCHAR(20),
  CategoryID INT,
  FOREIGN KEY (CategoryID) REFERENCES Category(Categoryid),
  supplierid VARCHAR(10),
  FOREIGN KEY (supplierid) REFERENCES Supplier(supplierid),
  price DECIMAL(10,2) CHECK (price > 0),
  Quantityinstock VARCHAR(30)
);
 ------------------------------------------
INSERT INTO product (productid, productname, CategoryID, supplierid, price, Quantityinstock) VALUES
('P01', 'Smartphone', 1, 'SUP001', 699.99, '150'),
('P02', 'Jeans', 2, 'SUP003', 49.99, '200'),
('P03', 'Microwave Oven', 3, 'SUP007', 120.00, '75'),
('P04', 'Novel Book', 4, 'SUP004', 15.50, '300'),
('P05', 'Face Cream', 5, 'SUP009', 20.00, '180'),
('P06', 'Football', 6, 'SUP010', 25.00, '100'),
('P07', 'Toy Car', 7, 'SUP008', 10.99, '250'),
('P08', 'Office Chair', 8, 'SUP006', 89.99, '50'),
('P09', 'Notebook', 9, 'SUP004', 2.50, '500'),
('P10', 'Organic Rice', 10, 'SUP005', 30.00, '120');
----------------------------------------------

create table customer(
customerid int primary key,
customername varchar(20) unique,
email varchar(30),
phone varchar(15),
address varchar(20),
productid varchar(10), 
foreign key(productid) references product(productid))
-----------------------------------
INSERT INTO customer (customerid, customername, email, phone, address, productid) VALUES
(101, 'Alice', 'alice@example.com', '1234567890', '1 Main St', 'P01'),
(102, 'Bob', 'bob@example.com', '2345678901', '2 Oak St', 'P02'),
(103, 'Charlie', 'charlie@example.com', '3456789012', '3 Pine St', 'P03'),
(104, 'Diana', 'diana@example.com', '4567890123', '4 Maple St', 'P04'),
(105, 'Eve', 'eve@example.com', '5678901234', '5 Birch St', 'P05'),
(106, 'Frank', 'frank@example.com', '6789012345', '6 Cedar St', 'P06'),
(107, 'Grace', 'grace@example.com', '7890123456', '7 Spruce St', 'P07'),
(108, 'Henry', 'henry@example.com', '8901234567', '8 Ash St', 'P08'),
(109, 'Isla', 'isla@example.com', '9012345678', '9 Willow St', 'P09'),
(110, 'Jack', 'jack@example.com', '0123456789', '10 Elm St', 'P10');
------------------------------------

CREATE TABLE Orders(OrderID VARCHAR(10) PRIMARY KEY,CustomerID INT,productid varchar(10),
OrderDate DATE,TotalAmount DECIMAL(10,2),Status ENUM('Pending','Delivered','Cancelled'),
FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID),
foreign key (productid)references product(productid))
--------------------------------------
INSERT INTO Orders (OrderID, CustomerID, productid, OrderDate, TotalAmount, Status) VALUES
('O1', 101, 'P01', '2025-08-01', 699.99, 'Delivered'),
('O2', 102, 'P02', '2025-08-02', 49.99, 'Pending'),
('O3', 103, 'P03', '2025-08-03', 120.00, 'Cancelled'),
('O4', 104, 'P01', '2025-08-04', 699.99, 'Delivered'),
('O5', 105, 'P02', '2025-08-05', 49.99, 'Pending'),
('O6', 106, 'P03', '2025-08-06', 120.00, 'Delivered'),
('O7', 107, 'P01', '2025-08-07', 699.99, 'Pending'),
('O8', 108, 'P02', '2025-08-08', 49.99, 'Cancelled'),
('O9', 109, 'P03', '2025-08-09', 120.00, 'Delivered'),
('O10', 110, 'P01', '2025-08-10', 699.99, 'Delivered');
DROP TABLE Orders


----------------------------------

CREATE TABLE OrderDetails (
  OrderDetailID varchar(10) PRIMARY KEY,
  OrderID VARCHAR(10) NOT NULL,
  productid VARCHAR(10) NOT NULL,
  Quantity INT,
  SubTotal DECIMAL(10,2),
  FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
  FOREIGN KEY (productid) REFERENCES product(productid)
);

-------------------------------
drop table OrderDetails
INSERT INTO OrderDetails (OrderDetailID, OrderID, productid, Quantity, SubTotal) VALUES
('OD001', 'O1', 'P01', 1, 699.99),
('OD002', 'O2', 'P02', 2, 99.98),
('OD003', 'O3', 'P03', 1, 120.00),
('OD004', 'O4', 'P01', 2, 1399.98),
('OD005', 'O5', 'P02', 3, 149.97),
('OD006', 'O6', 'P03', 1, 120.00),
('OD007', 'O7', 'P01', 1, 699.99),
('OD008', 'O8', 'P02', 2, 99.98),
('OD009', 'O9', 'P03', 2, 240.00),
('OD010', 'O10', 'P01', 1, 699.99);


----------------------------------------------------------------------------------------------

#Add constraint
alter table supplier add CONSTRAINT fkname primary key(supplierid)

#Add column
alter table Supplier add column email varchar(30)
alter table Supplier add column supplierid varchar(10)

# drop column
alter table supplier drop column supplierid

#drop database
drop database inventory

#drop table
drop table supplier

select * from Category where  manufactured between '2025-01-03' and '2025-01-25' and CategoryID in(1,2,3,4,5)


#Retrun speciic range of date form category table
select * from Category where manufactured between '2025-01-01' and '2025-01-15'

# filter the contactname start with s
select * from Supplier where contactname like 's%';

#filter the product table by price and quantityinstock
select productid, productname, CategoryID from product where price>600 and Quantityinstock>100

# Most expensive product and its supplier
SELECT MAX(a.price) AS max_price, a.productname,b.supplierid
FROM product AS a
INNER JOIN supplier AS b ON a.supplierid = b.supplierid
group by a.productname,b.supplierid
ORDER BY max_price DESC
limit 1;

#Count products per category
select count(productname),b.categoriesname from product as a
left join category as b on a.categoryid=b.categoryid
group by b.categoriesname
order by categoriesname desc

select count(supplierid),suppliername from Supplier where suppliername like "s%"
group by supplierid

select count(supplierid),suppliername from Supplier where suppliername in('Karthika','Vicky','Ruby','Sneha','Sumi')
group by supplierid

#Products with stock > 200
select productid,productname from product where Quantityinstock > 180

#Average quantity ordered
select avg(Quantity),Orderid from OrderDetails
group by Orderid

# Total sales per order status  
select sum(TotalAmount),productname from Orders as a
inner join product as b 
on b.productid=a.productid
group by productname

# Products with category name and supplier nam
select a.productname,b.categoriesname,c.supplierid from product as a
inner join category as b on a.categoryid=b.categoryid
inner join Supplier as c on a.supplierid=c.supplierid

#Total sales per order status
select customerid,sum(totalamount),status from Orders 
where totalamount>50
group by status,customerid

# Products supplied by ‘Toy Planet’
select productid,productname from product as a
inner join supplier as b on a.supplierid=b.supplierid
where suppliername="Toy Planet"

# Customers who purchased products with price > 500
select a.customername,b.productname,b.price from customer as a
inner join product as b on a.productid=b.productid 
where b.price >  200

# Pending orders with amount > 100
select * from Orders where totalamount>100 and Status="pending"

#Customers who ordered from ‘Electronics’ category
SELECT DISTINCT c.customerid, c.customername,cat.categoryid
FROM customer AS c
JOIN orders AS o ON c.customerid = o.customerid
JOIN orderdetails AS od ON o.orderid = od.orderid
JOIN product AS p ON od.productid = p.productid
JOIN category AS cat ON p.categoryid = cat.categoryid
WHERE cat.categoriesname = 'Electronics'
LIMIT 0, 50000;



