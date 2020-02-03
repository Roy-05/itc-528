/*
--------------------------------------
Chapter 4, Lesson A, page 109: Ex4A-7
--------------------------------------
*/

UPDATE product
SET price = 6.99
WHERE Product_ID = 10020;


/*
--------------------------------------
Chapter 4, Lesson A, page 110: Ex4A-17
--------------------------------------
*/

CREATE TABLE Distributor (
distributor_id VARCHAR2(10),
name VARCHAR2(30),
city VARCHAR2(20),
state CHAR(2),
phone VARCHAR2(10),
CONSTRAINT distributor_pk 
    PRIMARY KEY(distributor_id)
);

INSERT INTO Distributor
(distributor_id, name, city, state, phone)
VALUES
('S500', 'Hillside Ski', 'Los Angeles', 'CA', 7146654959);

INSERT INTO Distributor
(distributor_id, name, city, state, phone)
VALUES
('S510', 'Tiger Mountain', 'Los Angeles', 'CA', 7143327878);


/*
--------------------------------------
Chapter 4, Lesson A, page 110: Ex4A-18
--------------------------------------
*/

CREATE TABLE Items(
items_id NUMBER,
item_name VARCHAR2(100),
price NUMBER,
distributor_id VARCHAR2(10),

CONSTRAINT items_pk
    primary key(items_id),
    
constraint items_fk 
    foreign key(distributor_id)
    references Distributor(distributor_id)
);

INSERT INTO Items
(items_id, item_name, price, distributor_id)
VALUES
(10010, 'Beginner''s Ski Boot', 9.75, 'S500');

INSERT INTO Items
(items_id, item_name, price, distributor_id)
VALUES
(10011, 'Intermediate Ski Boot', 12.99, 'S500');

INSERT INTO Items
(items_id, item_name, price, distributor_id)
VALUES
(10012, 'Pro Ski Boot', 15.49, 'S510');

INSERT INTO Items
(items_id, item_name, price, distributor_id)
VALUES
(10013, 'Beginner''s Ski Pole', 25.49, 'S500');

INSERT INTO Items
(items_id, item_name, price, distributor_id)
VALUES
(10014, 'Intermediate Ski Pole', 29.99, 'S510');


/*
--------------------------------------
Chapter 4, Lesson A, page 110: Ex4A-19
--------------------------------------
*/

CREATE TABLE Activity_Clubs (
activity_id NUMBER,
name VARCHAR2(100),
city VARCHAR2(20),
state CHAR(2),
phone VARCHAR2(10),

CONSTRAINT activity_clubs_pk
    PRIMARY KEY(activity_id)
);

INSERT INTO Activity_Clubs
(activity_id, name, city, state, phone)
VALUES
(100, 'Hillside Mountain Club', 'Wichita', 'KS', 3163997676);

INSERT INTO Activity_Clubs
(activity_id, name, city, state, phone)
VALUES
(110, 'Branson Climbing Club', 'Branson', 'MO', 4174485676);

INSERT INTO Activity_Clubs
(activity_id, name, city, state, phone)
VALUES
(120, 'Cherokee Rafting Club', 'St. Charles', 'MO', 3147780870);


CREATE TABLE Membership (
membership_id NUMBER,
membership_date DATE,
duration NUMBER,
activity_id NUMBER,

CONSTRAINT membership_pk
    PRIMARY KEY(membership_id),
    
CONSTRAINT membership_fk 
    FOREIGN KEY(activity_id)
    REFERENCES Activity_Clubs(activity_id)
);

INSERT INTO Membership 
(membership_id, membership_date, duration, activity_id)
VALUES
(10010, '12-JUN-08', 4, 100);

INSERT INTO Membership 
(membership_id, membership_date, duration, activity_id)
VALUES
(10020, '15-JUN-08', 2, 110);

INSERT INTO Membership 
(membership_id, membership_date, duration, activity_id)
VALUES
(10030, '21-JUN-08', 5, 120);


/*
--------------------------------------
Chapter 4, Lesson B, page 148: Ex4B-39
--------------------------------------
*/

DELETE FROM club_activity
WHERE club_activity.club_id IN (
    SELECT club_id
    FROM sporting_clubs
    WHERE sporting_clubs.state = 'NY'
    );

DELETE FROM sporting_clubs
WHERE sporting_clubs.state = 'NY';


COMMIT;