CREATE TABLE territory (
	record_id int not null auto_increment,
	territory_key int,
    region varchar(50),
    country varchar(50),
    group_name varchar(50),
    PRIMARY KEY(record_id)
);

INSERT INTO territory(territory_key, region, country, group_name)
VALUES
(1,'Northwest','United States','North America'),
(2,'Northeast','United States','North America'),
(3,'Central','United States','North America'),
(4,'Southwest','United States','North America'),
(5,'Southeast','United States','North America'),
(6,'Canada','Canada','North America'),
(7,'France','France','Europe'),
(8,'Germany','Germany','Europe'),
(9,'Australia','Australia','Pacific'),
(10,'United Kingdom','United Kingdom','Europe'),
(11,'NA','NA','NA');