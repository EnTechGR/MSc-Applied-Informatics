ALTER SESSION SET NLS_DATE_FORMAT='DD/MM/YYYY';
ALTER SESSION SET NLS_TIMESTAMP_FORMAT = 'DD/MM/YYYY hh:mi';

INSERT INTO airplane VALUES(
'sx01','A220', 160, 156000, 21508, 1800, 4800, 4100, 0.8
);
INSERT INTO airplane VALUES(
'sx02','A320', 186, 206000, 27200, 2100, 5997, 4593, 0.8
);
INSERT INTO airplane VALUES(
'sx03','A330', 406, 445000, 139090, 5200, 7280, 4200, 0.8
);
INSERT INTO airplane VALUES(
'sx04','A350', 480, 624000, 166488, 5800, 8500, 6561, 0.8
);
INSERT INTO airplane VALUES(
'sx05','A380', 853, 1268000, 320000, 11400, 9800, 7000, 0.8
);

INSERT INTO airport VALUES(
'LGEL','N38 04.17', 'E023 33.25', '36R', 8981
);
INSERT INTO airport VALUES (
'LGPZ', 'N38 55.53', 'E020 45.90', '07R', 9814
);
INSERT INTO airport VALUES (
'LGAL', 'N40 51.35', 'E025 57.37', '07', 8471
);
INSERT INTO airport VALUES (
'LGAV', 'N37 56.20', 'E023 56.67', '03R', 13123
);
INSERT INTO airport VALUES (
'LGKP', 'N35 25.27', 'E027 08.75', '12', 7871
);
INSERT INTO airport VALUES (
'LGRX', 'N38 09.07', 'E021 25.53', '36L', 10997
);

INSERT INTO employee VALUES (
1, 'Ms.', 'Waylon', 'Nelson', 'Pilot', 500, 1000, 'sx01'
);
INSERT INTO employee VALUES (
2, 'Ms.', 'Messiah', 'Leonard', 'Pilot', 800, 1000, 'sx02'
);
INSERT INTO employee VALUES (
3, 'Mrs.', 'Analia', 'Coleman', 'Pilot', 830, 1000, 'sx03'
);
INSERT INTO employee VALUES (
4, 'Mrs.', 'Elise', 'Stafford', 'Hostess', 200, 800,  'sx04'
);
INSERT INTO employee VALUES (
5, 'Ms.', 'Sam', 'Phillips', 'Hostess', 640, 800,  'sx05'
);


INSERT INTO passenger VALUES(
1, 'Ms.', 'Zayn', 'Taylor', '01/01/1980', 'steve@me.com','sx01',1
);
INSERT INTO passenger VALUES(
2, 'Mrs.','Laurel', 'Snyder', '02/02/1981', 'andrei@yahoo.ca', 'sx02',2
);
INSERT INTO passenger VALUES(
3, 'Ms.', 'Ahmir', 'Neal', '03/03/1983', 'bockelboy@aol.com', 'sx03',3
);
INSERT INTO passenger VALUES(
4, 'Ms.', 'Leonidas', 'Randolph', '04/04/1984', 'parkes@gmail.com', 'sx04',4
);
INSERT INTO passenger VALUES(
5, 'Ms.', 'Presley', 'Parks', '05/05/1985', 'floxy@msn.com', 'sx05',5
);

INSERT INTO route VALUES(
1, '01/01/2024 08:00', 120, 'sx01', 'LGEL'
);
INSERT INTO route VALUES(
2, '01/01/2024 08:00', 180, 'sx02', 'LGPZ'
);
INSERT INTO route VALUES(
3, '01/01/2024 08:00', 90, 'sx03', 'LGAL'
);
INSERT INTO route VALUES(
4, '01/01/2024 08:00', 110, 'sx04', 'LGKP'
);
INSERT INTO route VALUES(
5, '01/01/2024 08:00', 240, 'sx05', 'LGRX'
);

INSERT INTO capability VALUES(
'sx01', 'LGEL'
);

INSERT INTO capability VALUES(
'sx02', 'LGPZ'
);
INSERT INTO capability VALUES(
'sx03', 'LGAL'
);
INSERT INTO capability VALUES(
'sx04', 'LGKP'
);
INSERT INTO capability VALUES(
'sx05', 'LGRX'
);