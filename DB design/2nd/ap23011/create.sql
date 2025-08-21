ALTER SESSION SET NLS_DATE_FORMAT='DD/MM/YYYY';
ALTER SESSION SET NLS_TIMESTAMP_FORMAT = 'DD/MM/YYYY hh:mi';

CREATE TABLE airplane (
aircraft_register VARCHAR(10),
airplane_type VARCHAR(25) UNIQUE NOT NULL,
max_passengers NUMBER(4,0) NOT NULL,
max_weight NUMBER(9,2) NOT NULL,
fuel_quantity NUMBER(9,2) NOT NULL,
fuel_consumption_per_hour NUMBER(7,2) NOT NULL,
take_off_distance NUMBER(5,0) NOT NULL,
landingd_distance NUMBER(5,0) NOT NULL,
cruising_speed NUMBER(5,2) NOT NULL,
CONSTRAINT pk_airplane PRIMARY KEY (aircraft_register)
);

CREATE TABLE airport (
icao CHAR(4),
longitude VARCHAR(12) NOT NULL,
latitude VARCHAR(12) NOT NULL,
runway_heading VARCHAR(3) NOT NULL,
runway_length NUMBER(5,0) NOT NULL,
CONSTRAINT pk_airport PRIMARY KEY (icao)
);

CREATE TABLE route (
route_ID NUMBER(4,0),
departure_date_time TIMESTAMP NOT NULL,
route_diastance NUMBER(9,0) NOT NULL,
aircraft_register VARCHAR(10),
destination CHAR(4),
CONSTRAINT pk_route PRIMARY KEY (route_ID),
CONSTRAINT fk_route_airplane FOREIGN KEY (aircraft_register) REFERENCES airplane(aircraft_register),
CONSTRAINT fk_route_airport FOREIGN KEY (destination) REFERENCES airport(icao)
);

CREATE TABLE employee (
employee_ID NUMBER(4,0),
title CHAR(4)NOT NULL CHECK(title IN ('Ms.','Mrs.')),
fname CHAR(50)NOT NULL,
surname CHAR(50)NOT NULL,
qualification CHAR(50)NOT NULL,
hours_of_flight NUMBER(7,2) NOT NULL,
payment NUMBER(5,0) NOT NULL,
aircraft_register VARCHAR(10),
CONSTRAINT pk_employee PRIMARY KEY (employee_ID),
CONSTRAINT fk_employee_airplane FOREIGN KEY (aircraft_register) REFERENCES airplane(aircraft_register)
);

CREATE TABLE passenger (
passenger_ID NUMBER(4,0),
title CHAR(4) NOT NULL CHECK(title IN('Ms.','Mrs.')),
fname CHAR(50) NOT NULL,
surname CHAR(50) NOT NULL,
birthdate DATE NOT NULL,
email VARCHAR(50) NOT NULL,
aircraft_register VARCHAR(10),
route_ID NUMBER(4,0), 
CONSTRAINT pk_passenger PRIMARY KEY (passenger_ID),
CONSTRAINT fk_passenger_airplane FOREIGN KEY (aircraft_register) REFERENCES airplane(aircraft_register),
CONSTRAINT fk_passenger_route FOREIGN KEY (route_ID) REFERENCES route(route_ID)
);

CREATE TABLE capability (
aircraft_register VARCHAR(10),
icao CHAR(4),
CONSTRAINT pk_capability PRIMARY KEY (aircraft_register, icao),
CONSTRAINT fk_capability_airplane FOREIGN KEY (aircraft_register) REFERENCES airplane(aircraft_register),
CONSTRAINT fk_capability_airport FOREIGN KEY (icao) REFERENCES airport(icao)
);