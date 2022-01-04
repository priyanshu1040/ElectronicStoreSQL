use new_db ; 

create table Customer (
    cust_id integer UNIQUE,
    cust_name VARCHAR(20) ,
    cust_phone INTEGER, 
    cust_address VARCHAR(20), 
    cust_zipcode integer, 
    CONSTRAINT cust_pk primary key(cust_id)
);


create table Store (
    store_location_id integer Unique, 
    store_address varchar(40), 
    store_state varchar(10), 
    CONSTRAINT str_pk primary key(store_location_id)

);

create table Purchase_Order (
    order_id integer UNIQUE,
    order_date DATE, 
    quantity_ordered INTEGER, 
    CONSTRAINT puo_pk PRIMARY KEY(order_id)
);

create table Lease_Agreement (
    agreement_id integer UNIQUE,
    lease_description varchar(10),
    CONSTRAINT lea_pk PRIMARY KEY (agreement_id)
);

create table Warehouse ( 
    warehouse_id integer UNIQUE, 
    whs_name varchar(30), 
    whs_address varchar(20), 
    CONSTRAINT whs_pk PRIMARY KEY (warehouse_id)

);

create table Employee (
    employee_id integer UNIQUE, 
    emp_name varchar(20) , 
    emp_address varchar(20),
    emp_state varchar(20) ,
    emp_type varchar(20) , 
    CONSTRAINT emp_pk PRIMARY KEY (employee_id)
);

create table Inventory (
    inventory_id integer UNIQUE, 
    inventory_desc varchar(20),
    inventory_cost integer,
    CONSTRAINT inv_pk PRIMARY KEY (inventory_id)
);

create table Maintenance_plans (
    maintenance_planID integer UNIQUE, 
    plan_details varchar(40),
    plan_cost integer,
    CONSTRAINT mai_pk PRIMARY KEY(maintenance_planID)

);

create table Packages (
    package_id integer UNIQUE, 
    pkg_description varchar(40), 
    CONSTRAINT pkg_pk PRIMARY KEY (package_id)
);

create table Part (
    part_id integer UNIQUE,
    part_description varchar(20),
    part_price integer, 
    CONSTRAINT part_pk PRIMARY KEY(part_id, part_description, part_price)

);

create table Manufacturer (
    manufacturer_id integer UNIQUE, 
    mnf_name varchar(20),
    mnf_location varchar(20), 
    CONSTRAINT mnf_pk PRIMARY KEY (manufacturer_id)
);

create table Contract (
    contract_id integer UNIQUE,
    contract_description varchar(30), 
    CONSTRAINT con_pk PRIMARY KEY (contract_id)
);

create table Inventory_ContractDate (
    inventory_count integer, 
    contract_id integer, 
    manufacturer_id integer , 
    part_id integer,
    contract_start_date date,
    contract_end_date date,
    package_id integer,
    inventory_id INTEGER,
    warehouse_id integer , 
    maintenance_planID integer,
    order_id integer , 
    cust_id integer , 
    store_location_id INTEGER, 
    agreement_id INTEGER, 
    employee_id integer,
    constraint incd_pk PRIMARY KEY(order_id,cust_id),
    constraint con_fk FOREIGN KEY (contract_id) REFERENCES Contract(contract_id),
    constraint mnf_fk FOREIGN KEY(manufacturer_id) REFERENCES Manufacturer(manufacturer_id),
    constraint part_fk FOREIGN KEY(part_id) REFERENCES Part(part_id),
    constraint pkg_fk FOREIGN KEY(package_id) REFERENCES Packages(package_id),
    constraint inv_fk FOREIGN KEY(inventory_id) REFERENCES Inventory(inventory_id),
    constraint whs_fk FOREIGN KEY(warehouse_id) REFERENCES Warehouse(warehouse_id),
    constraint mnp_fk FOREIGN KEY(maintenance_planID) REFERENCES Maintenance_plans(maintenance_planID),
    constraint odr_fk FOREIGN KEY(order_id) REFERENCES Purchase_Order(order_id),
    constraint cus_fk FOREIGN KEY(cust_id) REFERENCES Customer(cust_id),
    constraint stl_fk FOREIGN KEY(store_location_id) REFERENCES Store(store_location_id),
    constraint agr_fk FOREIGN KEY(agreement_id) REFERENCES Lease_Agreement(agreement_id),
    constraint emp_fk FOREIGN KEY(employee_id) REFERENCES Employee(employee_id),

);

-- inserting values in Customer table

insert into Customer values(11,'Kante',1234,'Houston',75001)
insert into Customer values(12,'Messi',2345,'San Antonio',75002)
insert into Customer values(13,'Aswin',3456,'Dallas',75003)
insert into Customer values(14,'Priyanshu',4567,'Austin',75004)
insert into Customer values(15,'Krishna',5678,'Fort Worth',75005)
insert into Customer values(16,'Vivek',6789,'El Paso',75006)

--inserting values in Store table

insert into Store values(4001,'Austin','TX')
insert into Store values(4002,'Dallas','TX')
insert into Store values(4003,'Irving','TX')
insert into Store values(4004,'Houston','TX')
insert into Store values(4005,'San Antonio','TX')
insert into Store values(4011,'EL Paso','TX')
insert into Store values(4012,'Phoenix','AZ')
insert into Store values(4013,'Oklahoma City','OK')
insert into Store values(4014,'New Orleans','LA')
insert into Store values(4015,'Memphis','TN')

--inserting values in Purchase_Order

insert into Purchase_Order values (101,'10/10/19',5)
insert into Purchase_Order values (102,'12/8/19',8)
insert into Purchase_Order values (103,'2/28/19',12)
insert into Purchase_Order values (104,'1/1/19',1)
insert into Purchase_Order values (105,'10/10/19',6)
insert into Purchase_Order values (106,'12/8/19',3)
insert into Purchase_Order values (107,'2/28/19',4)
insert into Purchase_Order values (108,'1/1/19',8)
insert into Purchase_Order values (109,'10/10/19',9)
insert into Purchase_Order values (110,'12/8/19',7)
insert into Purchase_Order values (111,'2/28/19', 11)
insert into Purchase_Order values (112,'1/1/19',10)
insert into Purchase_Order values (113,'10/10/19',5)
insert into Purchase_Order values (114,'11/11/19',8)
insert into Purchase_Order values (115,'12/12/19',7)

--inserting values in Lease_Agreement

insert into Lease_Agreement values(201,'1 year')
insert into Lease_Agreement values(202,'2 years')
insert into Lease_Agreement values(203,'3 years')

--inserting values in Warehouse 

insert into Warehouse values(911, 'Rana Holdings', 'Dallas TX')
insert into Warehouse values(912, 'Holiday Warehouse', 'Houston TX')
insert into Warehouse values(913, 'Warehouse Plus', 'Memphis TN')
insert into Warehouse values(914, 'PC Warehouse', 'Seattle WA')
insert into Warehouse values(915, 'Edward Logistics', 'Miami FL')
insert into Warehouse values(916, 'A and A Logistics', 'New Orleans LA')
insert into Warehouse values(917, 'Running Warehouse', 'Atlanta GA')
insert into Warehouse values(910, 'Freeport Logistics', 'Milwaukee WI')

--inserting values in Employee 

insert into Employee values(5001,'Micheal','Scranton','PA','Temporary')
insert into Employee values(5002,'Scott','Philadelphia','PA','Permanent')
insert into Employee values(5003,'Jim','New York','NY','Temporary')
insert into Employee values(5004,'Pam','Boston','MA','Temporary')
insert into Employee values(5005,'Kevin','Milwaukee','WI','Permanent')
insert into Employee values(5006,'Andy','Charlotte','NC','Permanent')
insert into Employee values(5007,'Dwight','Denver','CO','Permanent')
insert into Employee values(5008,'Phyllis','Houston','TX','Permanent')
insert into Employee values(5009,'Stanley','Los Angeles','CA','Temporary')
insert into Employee values(5010,'Kelly','Dallas','TX','Temporary')



--inserting values in Inventory table

insert into Inventory values(1,'Desktop Computer',700)
insert into Inventory values(2,'Laptop',600)
insert into Inventory values(3,'Printer',300)
insert into Inventory values(4,'Phone',500)
insert into Inventory values(5,'Monitor',200)
insert into Inventory values(6,'Tablet',400)

--inserting values in Maintenance plans

insert into Maintenance_plans values(1001,'90 day moneyback guarantee',40)
insert into Maintenance_plans values(1002,'12 month cost free repairs',100)
insert into Maintenance_plans values(1003,'Annual subscription for repairs',60)

--inserting values in Packages

insert into Packages values(7011,'Desktop computer, Monitor and Printer' )
insert into Packages values(7012,'Laptop and Printer' )
insert into Packages values(7013,'Laptop and Phone' )
insert into Packages values(7014,'Desktop computer, Monitor and Tablet' )
insert into Packages values(7015,'Desktop computer, Monitor and Phone' )
insert into Packages values(7016,'Tablet and Phone' )


--inserting values in Part

insert into Part values (420,'Hard drive', 40)
insert into Part values (421,'GPU', 70)
insert into Part values (422,'CPU', 90)
insert into Part values (423,'Sensors', 50)
insert into Part values (424,'Speakers', 30)
insert into Part values (425,'Display', 80)
insert into Part values (428,'OS', 75)

-- inserting values in Manufacturer

insert into Manufacturer values(9111,'Sony','Tokyo')
insert into Manufacturer values(9112,'Apple','Cupertino')
insert into Manufacturer values(9113,'Nokia','Finland')
insert into Manufacturer values(9114,'Motorola','Chicago')
insert into Manufacturer values(9115,'Samsung','Seoul')
insert into Manufacturer values(9116,'Huawei','Shenzen')
insert into Manufacturer values(9117,'One Plus','Beijing')
insert into Manufacturer values(9118,'Intel','Santa Clara')
insert into Manufacturer values(9119,'AMD','Sunnyvale')

--inserting values in Contract

insert into Contract values (511,'3 year contract')
insert into Contract values (512,'5 year contract')
insert into Contract values (513,'10 year contract')
insert into Contract values (514,'20 year contract')
insert into Contract values (515,'Temporary contract')

