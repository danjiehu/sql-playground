-- summary:
-- 1. one-on-one relationship between tables
-- 2. assigning car to people
--  UPPDATE person SET car_id = 2 WHERE id = 1;
-- 3. INNER JOIN: returns only the people who has cars
--  SELECT * FROM person
--  JOIN car ON person.car_id = car.id;
-- 4. turn of expanded view: \x
-- 5. select only a list of things from joinned table
--  SELECT person.first_name, car.make, car.model, car.price
--  FROM person
--  JOIN car ON person.car_id = car.id;
-- 6. LEFT JOINS: returns all the people regardless if he/she has a car （person without a foreign key relationship）
--  SELECT * FROM person
--  LEFT JOIN car ON person.car_id = car.id;
-- 7. performing operations on LEFT JOIN table (finding out people who don't have a foreign key relationship in a left join table)
--  SELECT * FROM person WHERE car_id IS NULL;
--  SELECT * FROM person 
--  LEFT JOIN car ON car.id = person.car_id
--  WHERE car.* IS NULL;


-- creating car prior to creating person because person table will need to reference car table primary key
create table car(
    id BIGSERIAL NOT NULL PRIMARY KEY,
    make VARCHAR(100) NOT NULL,
    model VARCHAR(100) NOT NULL,
    price NUMERIC(19,2) NOT NULL
);

create table person (
    id BIGSERIAL NOT NULL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    gender VARCHAR(7),
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100),
    date_of_birth DATE NOT NULL,
    country_of_birth VARCHAR(50) NOT NULL,
    car_id BIGINT REFERENCES car(id), -- foreign key 
    UNIQUE(car_id), -- making one car only belongs to one person
    UNIQUE(email) -- making one email one belongs to one 
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

