create database inventory
use inventory
create table Category(
Categoryid int primary key,
categoriesname varchar(20),
Cdescription varchar(30),
Createdddate date)
ALTER TABLE Category MODIFY Cdescription VARCHAR(255);
INSERT INTO Category (CategoryID, categoriesname, Cdescription, Createdddate) VALUES
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

--------------
create table Supplier(
supplierid int,
suppliername varchar(20) not null,
contactname varchar(20)unique,
phone varchar(15))
alter table supplier add CONSTRAINT fkname primary key(supplierid)
alter table Supplier add column email varchar(30)
drop table Supplier
--------------

create table product(
productid int primary key,
productname varchar(20),
CategoryID int ,FOREIGN key(CategoryID) references Category(Categoryid),
supplierid int,FOREIGN key(supplierid) references supplier(supplierid),
price decimal(10,2) check (price>0),
Quantityinstock varchar(30));

create table customer(customerid int primary key,customername varchar(20) unique,
email varchar(30),phone varchar(15),address varchar(20))

CREATE TABLE Orders(OrderID INT PRIMARY KEY,CustomerID INT,
OrderDate DATE,TotalAmount DECIMAL(10,2),Status ENUM('Pending','Delivered','Cancelled'),
FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID))

CREATE TABLE OrderDetails (OrderDetailID INT PRIMARY KEY AUTO_INCREMENT,OrderID INT NOT NULL,productid INT NOT NULL,Quantity INT ,
SubTotal DECIMAL(10,2) ,FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
FOREIGN KEY (productid) REFERENCES product(productid))

