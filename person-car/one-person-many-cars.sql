-- one person can have many cars: therefore car should have the foreign key
-- one car can only belong to one person
-- ! person_id BIGINT REFERENCES person(id);  in car table will satisfy both constraints for the one-to-many relationship above

create table person (
    person_id BIGSERIAL NOT NULL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    gender VARCHAR(7),
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100),
    date_of_birth DATE NOT NULL,
    country_of_birth VARCHAR(50) NOT NULL,
    -- car_id BIGINT REFERENCES car(id), -- foreign key 
    -- UNIQUE(car_id), -- making one car only belongs to one person
    UNIQUE(email) -- making one email one belongs to one 
);

create table car(
    car_id BIGSERIAL NOT NULL PRIMARY KEY,
    make VARCHAR(100) NOT NULL,
    model VARCHAR(100) NOT NULL,
    price NUMERIC(19,2) NOT NULL,
    person_id BIGINT REFERENCES person(person_id) 
);

insert into person (first_name, last_name, gender, email, date_of_birth, country_of_birth)
values ('Fernanda','Beardon', 'Female','fernandab@is.gd','1953-10-28','Finland');
insert into person (first_name, last_name, gender, email, date_of_birth, country_of_birth)
values ('Omar','Colmore', 'Male', NULL,'1993-02-28','Sweden');
insert into person (first_name, last_name, gender, email, date_of_birth, country_of_birth)
values ('Adriana','Matuschek', 'Female','AMatuschek@gmail.com','1921-11-02','Russia');

insert into car (make, model, price) 
values ('Land Rover','Sterling','87665.38');
insert into car (make, model, price) 
values ('GMC','Acadia','17662.69');

-- make person 1 have both car 1 and car 2;
update car set person_id = 1 where car_id = 1;
update car set person_id = 1 where car_id = 2;

select * from car left join person using (person_id); -- display all cars even without foreign relations
select * from person left join car using (person_id); -- display all person even without foreign relations 