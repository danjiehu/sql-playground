create table person (
    id BIGSERIAL NOT NULL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    gender VARCHAR(7),
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100),
    date_of_birth DATE NOT NULL,
    country_of_birth VARCHAR(50) NOT NULL
);

create table car(
    id BIGSERIAL NOT NULL PRIMARY KEY,
    make VARCHAR(100) NOT NULL,
    model VARCHAR(100) NOT NULL,
    price NUMERIC(19,2) NOT NULL
);

insert into person (first_name, last_name, gender, email, date_of_birth, country_of_birth)
value ('Fernanda','Beardon', 'Female','fernandab@is.gd','1953-10-28','Finland');
insert into person (first_name, last_name, gender, email, date_of_birth, country_of_birth)
value ('Omar','Colmore', 'Male', NULL,'1993-02-28','Sweden');
insert into person (first_name, last_name, gender, email, date_of_birth, country_of_birth)
value ('Adriana','Matuschek', 'Female','AMatuschek@gmail.com','1921-11-02','Russia');

insert int car (make, model, price) 
values ('Land Rover','Sterling','87665.38');
insert int car (make, model, price) 
values ('GMC','Acadia','17662.69');

