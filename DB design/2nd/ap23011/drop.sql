ALTER TABLE employee DROP CONSTRAINT fk_employee_airplane;
ALTER TABLE passenger DROP CONSTRAINT fk_passenger_airplane;
ALTER TABLE route DROP CONSTRAINT fk_route_airplane;
DROP TABLE airplane;


ALTER TABLE connection DROP CONSTRAINT fk_connection_airport;
ALTER TABLE toff_land DROP CONSTRAINT fk_toff_land_airport;
DROP TABLE airport;

DROP TABLE employee;


DROP TABLE passenger;

DROP TABLE route;

DROP TABLE toff_land;

DROP TABLE capability;