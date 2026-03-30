CREATE TABLE dim_product_category (
	record_id int not null auto_increment,
	product_category_key int,
    product_category_alternate_key int,
    english_product_category_name varchar(50),
    spanish_product_category_name varchar(50),
    french_product_category_name varchar(50),
    PRIMARY KEY(record_id)
);

INSERT INTO dim_product_category(product_category_key, product_category_alternate_key, english_product_category_name, spanish_product_category_name, french_product_category_name)
VALUES
(1,1,'Bikes','Bicicleta','Vélo'),
(2,2,'Components','Componente','Composant'),
(3,3,'Clothing','Prenda','Vêtements'),
(4,4,'Accessories','Accesorio','Accessoire');
