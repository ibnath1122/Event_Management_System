--Create database Event_Management

use event_management;

Create table Users
(
	user_id int IDENTITY(1,1) PRIMARY KEY,
	name varchar(50) not null,
	email varchar(50) not null unique,
	username varchar(50) not null unique,
	password varchar(50) not null,
	securityques varchar(50) not null,
	answer varchar(50) not null

);

select * from users;

drop table users;

Create table staff_details
(
	staff_id int Identity(101,1) PRIMARY KEY,
	name varchar(50) not null,
	email varchar(50) not null unique,
	phone_num varchar(11) not null, 
	address varchar(50) not null, 
	dob date not null, 
	gender varchar(10) not null,
	salary int not null,
	joining_date date not null,
	position varchar(20) not null,
);

drop table staff_details;


select * from staff_details;

--
insert into staff_details values('ibnath1', 'ibnath20@gmail.com', 01320681548, 'dhaka', '1999-02-02', 'female', 20 , '2000-02-02', 'manager', null);
insert into staff_details values('ibnath2', 'ibnath21@gmail.com', 01320681542, 'dhaka', '1999-02-02', 'female', 20 , '2000-02-02', 'manager','2000-02-02' );
insert into staff_details values('ibnath3', 'ibnath22@gmail.com', 01320681541, 'dhaka', '1999-02-02', 'female', 20 , '2000-02-02', 'manager', '2001-02-02');


Truncate table staff_details;

CREATE TABLE CATERING
(
catering_id int IDENTITY(801,1) PRIMARY KEY,
Categories varchar(50) NOT NULL,
Item  varchar(100) NOT NULL,
Quantity int  NOT NULL,
Price Decimal(8,2) NOT NULL
);

drop table catering;

select * from catering;


Create table Client_details
(
	client_id int IDENTITY (301,1) PRIMARY KEY,
	name varchar(50) not null,
	email varchar(50) unique not null,
	address varchar(50) not null,
	phone int not null
);

drop table client_details;

select * from client_details;

create table transport(
	transport_id int identity(701,1) primary key,
	categories varchar(50) not null,
	details varchar(200) not null,
	capacity int not null,
	price int not null
);

select * from transport;
drop table transport;

CREATE TABLE PHOTOGRAPHY
(
PhotographyId int IDENTITY(601,1) PRIMARY KEY,
Categories varchar(50) NOT NULL,
Details varchar(200) NOT NULL,
PhotographyDuration varchar(50) NOT NULL,
Price int NOT NULL
)

select * from photography;

insert into photography values ('senior', 'video, photo', '50 mins', 2000);

drop table photography;

CREATE TABLE EventPackage
(
PackageId int IDENTITY(401,1) PRIMARY KEY,
PackageType varchar(50) NOT NULL,
PackageDetails varchar(200) NOT NULL,
EventDuration varchar(50) NOT NULL,
Capacity int NOT NULL,
Price int NOT NULL
)

drop table eventpackage;

insert into eventpackage values ('wedding', 'all in one', '12 hours' , 500, 20000);


CREATE TABLE Venue
(
VenueId int IDENTITY(501,1) PRIMARY KEY,
VenueName varchar(50) NOT NULL,
VenueType varchar(50) NOT NULL,
Facilities varchar(50) NOT NULL,
Capacity int NOT NULL,
Decoration varchar(100) NOT NULL,
Price int NOT NULL
)

drop table venue;
insert into venue values ('RCR', 'outdoor', 'AC', 500, 'Flowers', 1000);

select * from venue;

Create table event
(
	EventId int IDENTITY(201,1) PRIMARY KEY,
	staff_id int NOT NULL FOREIGN KEY REFERENCES staff_details (staff_id),
	client_id int NOT NULL FOREIGN KEY REFERENCES client_details (client_id),
	catering_id int NOT NULL FOREIGN KEY REFERENCES catering (catering_id),
	VenueId int NOT NULL FOREIGN KEY REFERENCES venue (VenueId),
	PackageId int NOT NULL FOREIGN KEY REFERENCES eventpackage (PackageId),
	transport_id  int NOT NULL FOREIGN KEY REFERENCES transport (transport_id ),
	PhotographyId int NOT NULL FOREIGN KEY REFERENCES photography (PhotographyId),
	Event_date date not null,
	people int not null
)

select * from event;

drop table event; 

insert into event values (101, 301, 801, 501, 401, 701, 601, '2023-02-11', 20, 1000);

/*select event.eventid as 'event no', staff_details.name as 'staff_name', client_details.name as 'client_name', 
((catering.price)*(event.people)) as 'catering_price', EventPackage.price as 'Package_price', 
photography.price as 'Photography_price', transport.price as 'Transport_price', 
venue.price as 'venue_price', event.event_date as 'date', event.people as 'people',
(catering.price + venue.price + EventPackage.price+ photography.price+ transport.price+ venue.price) as 'total'
from event inner join staff_details 
on event.staff_id= staff_details.staff_id 
inner join client_details on event.client_id= client_details.client_id 
inner join catering on event.catering_id=catering.catering_id 
inner join EventPackage on event.PackageId=Eventpackage.PackageId 
inner join photography on event.PhotographyId=photography.PhotographyId 
inner join transport on event.transport_id=transport.transport_id 
inner join venue on event.VenueID = venue.VenueId;*/


select * from staff_details;


SELECT
    CONVERT(NVARCHAR, year) + '-' + RIGHT('0' + CONVERT(NVARCHAR, month), 2) AS [month YYYY-MM],
    total_income AS [total income],
    (
        SELECT SUM(salary) FROM staff_details
    ) AS [total salary],
    (total_income - (SELECT SUM(salary) FROM staff_details)) AS [profit]
FROM (
    SELECT
        DATEPART(YEAR, event_date) AS year,
        DATEPART(MONTH, event_date) AS month,
        SUM(((catering.price)*(event.people)) + venue.price + EventPackage.price + photography.price + transport.price + venue.price) AS total_income
    FROM
        event
    INNER JOIN catering ON event.catering_id = catering.catering_id
    INNER JOIN EventPackage ON event.PackageId = EventPackage.PackageId
    INNER JOIN photography ON event.PhotographyId = photography.PhotographyId
    INNER JOIN transport ON event.transport_id = transport.transport_id
    INNER JOIN venue ON event.VenueID = venue.VenueId
    -- Add any necessary WHERE conditions to filter events for a specific month or year if needed
    GROUP BY DATEPART(YEAR, event_date), DATEPART(MONTH, event_date)
) AS MonthlyFinancials;




