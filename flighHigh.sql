use FlighHigh;

drop table flight;
drop table one_stop_flight;
drop table trip; 
drop table special_deal;

create table flight(
	journey_id int primary key,
	flight_id varchar(100),
    flight_opereator varchar(100),
    flight_type varchar(100),
    dept_city varchar(100),
    arrv_city varchar(100),
    dept_date date,
	dept_time time,
    arrv_date date,
	arrv_time time,
    
    seat_capacity_count int,
    seat_book_count int default(0),
    current_fare int,
    max_incr_fare int default(0)
);

create table one_stop_flight(
	one_stop_journey_id int primary key,
	journey1id varchar(100),
    journey2id varchar(100),
    dept_city varchar(100),
    arrv_city varchar(100),
    stop_city varchar(100),
    dept_date date,
    arrv_date date
);

create table special_deal(
	deal_id int primary key,
	title varchar(100),
    link varchar(300),
    img_url  varchar(300),
    expires_on date,
    expires_on_time time,
    dest varchar(100)
);

create table trip(
	pnr int primary key,
	journey_id int,
    user_email varchar(100),
    booking_fare int
);

# ------------------------------------------------------------------------------------

insert into flight values(
100,'AI-775','Air India', 'Airbus A320', 
'CCU', 'BOM', 
'2023-11-21', '10:00:00',
'2023-11-11', '13:00:00',
 180,
 0,
 6500,
 5000
 );

insert into flight values(
101,'I5-711','Air Asia', 'Airbus A321', 
'DEL', 'BOM', 
'2023-03-27', '05:35:00',
'2023-03-27', '07:55:00',
 222,
 0,
 3500,
 5000
 );
 
insert into flight values(
102,'UK-100','Vistara', 'Airbus A320', 
'DEL', 'CCU', 
'2023-01-11', '13:00:00',
'2023-01-11', '15:45:00',
 180,
 0,
 6000,
 5000
 );
 
insert into flight values(
103,'6E-733','Indigo', 'Airbus A321', 
'CCU', 'BLR', 
'2023-01-11', '13:00:00',
'2023-01-11', '15:25:00',
 222,
 0,
 5000,
 5000
 );

insert into flight values(
104,'6E-105','Indigo', 'ATR(78Y)', 
'CCU', 'IXB', 
'2023-02-11', '13:00:00',
'2023-02-11', '15:00:00',
 78,
 0,
 3000,
 7000
 );
 
 insert into flight values(
105,'SG-494','SpiceJet', 'Airbus A320', 
'CCU', 'IXB', 
'2023-02-11', '20:00:00',
'2023-02-11', '21:00:00',
 180,
 0,
 3500,
 6000
 );
 
insert into flight values(
 106,'UK-708','Vistara', 'Boeing', 
'CCU', 'DEL', 
'2023-04-27', '20:20:00',
'2023-04-27', '22:45:00',
 130,
 0,
 4000,
 6500
 );
 
 insert into flight values(
 107,'UK-725','Vistara', 'Airbus A320', 
'DEL','IXB', 
'2023-04-28', '08:00:00',
'2023-04-28', '10:30:00',
 180,
 0,
 5000,
 6500
 );
 
insert into flight values(
 108,'I5-011','Air Asia', 'Airbus A320', 
'BOM', 'CCU', 
'2023-03-28', '14:00:00',
'2023-03-28', '17:05:00',
 180,
 0,
 4500,
 5500
 );
 
 insert into flight values(
 109,'G0-786','GoAir', 'Airbus A320', 
'CCU', 'DEL', 
'2023-03-27', '01:00:00',
'2023-03-27', '03:45:00',
 180,
 0,
 6000,
 4000
 );
 

insert into special_deal values(
	2323121, 'Offer! Offer! Go To Delhi','/city?city=del','https://media.easemytrip.com/media/Blog/India/637241941582007701/637241941582007701LjUxPM.png','2023-03-31','21:00:00','DEL'
);

insert into special_deal values(
	2323122, 'Offer! Offer! Go To Darjeeling','/city?city=ixb','https://www.tourmyindia.com/socialimg/best-time-visit-siliguri-west-bengal.jpg','2023-05-31', '21:00:00', 'IXB'
);

insert into special_deal values(
	2323123, 'Offer! Offer! Go To Mumbai','/city?city=bom','https://www.tourmyindia.com/socialimg/best-time-visit-siliguri-west-bengal.jpg','2023-03-27','15:53:00', 'BOM'
);

insert into one_stop_flight values(
	500, 106, 107, 'CCU', 'IXB', 'DEL', '2023-04-27', '2023-04-28'
);

insert into one_stop_flight values(
	501, 101, 108, 'DEL', 'CCU', 'BOM', '2023-03-27', '2023-03-28'
);

select * from one_stop_flight;


 
 
