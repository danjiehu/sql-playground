-- select * from pg_available_extensions;
-- create extension if not exists "uuid-ossp";
-- \df -- view list of functions
-- SELECT uuid_generate_v4(); 

-- replace id from person-car.sql to uuid as primary keys
create table car(
    -- id BIGSERIAL NOT NULL PRIMARY KEY,
    car_uid UUID NOT NULL PRIMARY KEY,
    make VARCHAR(100) NOT NULL,
    model VARCHAR(100) NOT NULL,
    price NUMERIC(19,2) NOT NULL
);

create table person (
    -- id BIGSERIAL NOT NULL PRIMARY KEY,
    person_uid UUID NOT NULL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    gender VARCHAR(7),
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100),
    date_of_birth DATE NOT NULL,
    country_of_birth VARCHAR(50) NOT NULL,
    car_uid UUID REFERENCES car(car_uid), -- foreign key 
    UNIQUE(car_uid), -- making one car only belongs to one person (there can be no duplicate car id in person table)
    UNIQUE(email) -- making one email one belongs to one person (there can be no duplicate emails in person table)
);

insert into person (person_uid, first_name, last_name, gender, email, date_of_birth, country_of_birth)
values (uuid_generate_v4(),'Fernanda','Beardon', 'Female','fernandab@is.gd','1953-10-28','Finland');
insert into person (person_uid, first_name, last_name, gender, email, date_of_birth, country_of_birth)
values (uuid_generate_v4(),'Omar','Colmore', 'Male', NULL,'1993-02-28','Sweden');
insert into person (person_uid, first_name, last_name, gender, email, date_of_birth, country_of_birth)
values (uuid_generate_v4(),'Adriana','Matuschek', 'Female','AMatuschek@gmail.com','1921-11-02','Russia');

insert into car (car_uid, make, model, price) 
values (uuid_generate_v4(),'Land Rover','Sterling','87665.38');
insert into car (car_uid, make, model, price) 
values (uuid_generate_v4(),'GMC','Acadia','17662.69');

update person set car_uid = 'bcd155dd-70bf-49d3-bcb6-3646b41b8c2e' where person_uid = 'd15355ce-9c6d-46d7-a153-81dc604e6f8a';
select * from person left join car on person.car_uid = car.car_uid; 
select * from person left join car using (car_uid); --! same as above

