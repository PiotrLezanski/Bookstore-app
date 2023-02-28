DROP TABLE IF EXISTS Association CASCADE;
DROP TABLE IF EXISTS Books CASCADE;
DROP TABLE IF EXISTS Suppliers CASCADE;
DROP TABLE IF EXISTS Types CASCADE;
DROP TABLE IF EXISTS Authors CASCADE;
DROP TABLE IF EXISTS Authors_territories CASCADE;
DROP TABLE IF EXISTS Links CASCADE;
DROP TABLE IF EXISTS Orders CASCADE;
DROP TABLE IF EXISTS Customers CASCADE;
DROP TABLE IF EXISTS Territories CASCADE;
DROP TABLE IF EXISTS Audit CASCADE;

CREATE TABLE Authors (
    author_id INT,
    name VARCHAR(20),
	last_name VARCHAR(25),
	address VARCHAR(60),
	association_id INT,
	territory_id INT,
	PRIMARY KEY(author_id),
	FOREIGN KEY(association_id) REFERENCES Association(association_id) ON DELETE CASCADE,
	FOREIGN KEY(territory_id) REFERENCES Authors_territories(territory_id)
);

INSERT INTO Authors VALUES 
	(1, 'James', 'Patterson', '777 Brockton Avenue, Abington MA 2351', 4, 2),
	(2, 'Elly', 'Griffiths', '30 Memorial Drive, Avon MA 2322', 4, 1),
	(3, 'Lj', 'Ross', '250 Hartford Avenue, Bellingham MA 2019', 2, 3),
	(4, 'Lee', 'Child', '700 Oak Street, Brockton MA 2301', 1, 4),
	(5, 'Michael', 'Connelly', '66-4 Parkhurst Rd, Chelmsford MA 1824', 3, 2),
	(6, 'Ann', 'Cleves', '591 Memorial Dr, Chicopee MA 1020', 1, 1),
	(7, 'Peter', 'James', '55 Brooksby Village Way, Danvers MA 1923', 6, 5),
	(8, 'JD', 'Kirk', '137 Teaticket Hwy, East Falmouth MA 2536', 5, 5),
	(9, 'Bernard', 'Cornwell', '42 Fairhaven Commons Way, Fairhaven MA 2719', 6, 1),
	(10, 'Louise', 'Penny', '374 William S Canning Blvd, Fall River MA 2721', 4, 6),
	(11, 'Dilly', 'Count', '121 Worcester Rd, Framingham MA 1701', 5, 2),
	(12, 'Stuard', 'MacBridge', '677 Timpany Blvd, Gardner MA 1440', 7, 1),
	(13, 'Ian', 'Rankin', '337 Russell St, Hadley MA 1035', 3, 1),
	(14, 'Nora', 'Roberts', '295 Plymouth Street, Halifax MA 2338', 5, 8),
	(15, 'Clive', 'Cussler', '1775 Washington St, Hanover MA 2339', 1, 7),
	(16, 'Anna', 'Jacobs', '280 Washington Street, Hudson MA 1749', 6, 7),
	(17, 'D j', 'Sansom', '20 Soojian Dr, Leicester MA 1524', 3, 8),
	(18, 'Mick', 'Heron', '11 Jungle Road, Leominster MA 1453', 2, 3),
	(19, 'Lj', 'Ross', '301 Massachusetts Ave, Lunenburg MA 1462', 4, 2),
	(20, 'Lj', 'Ross', '780 Lynnway, Lynn MA 1905', 7, 9)
	
INSERT INTO Association VALUES
	(1, 'Academy of American Poets', 350),
	(2, 'Society of Indexers ', 245),
	(3, 'Authors Guild, The', 130),
	(4, 'Canadian Authors Association', 400),
	(5, 'Mystery Writers of America', 120),
	(6, 'National Writers Union', 35),
	(7, 'Novelists, Inc.', 260)
	
INSERT INTO Authors_territories VALUES
	(1, 5),
	(2, 9),
	(3, 4),
	(4, 1),
	(5, 2),
	(6, 6),
	(7, 2),
	(8, 4),
	(9, 8),
	(10, 7),
	(11, 9),
	(12, 2),
	(13, 1),
	(14, 1),
	(15, 5),
	(16, 3),
	(17, 2),
	(18, 4),
	(19, 7),
	(20, 6)
	
INSERT INTO Territories VALUES
	(1, 'Belgium'),
	(2, 'North America'),
	(3, 'Poland'),
	(4, 'Japan'),
	(5, 'Croatia'),
	(6, 'Netherlands'),
	(7, 'Scotland'),
	(8, 'Germany'),
	(9, 'Sweden')
	
CREATE TABLE Authors_territories (
	author_id INT UNIQUE,
	territory_id INT,
	PRIMARY KEY(author_id),
	FOREIGN KEY(territory_id) REFERENCES Territories(territory_id) ON DELETE CASCADE
);

CREATE TABLE Territories (
	territory_id INT,
	territory_name VARCHAR(30),
	PRIMARY KEY(territory_id)
);

CREATE TABLE Association (
	association_id INT,
	name VARCHAR(40),
	members INT,
	PRIMARY KEY(association_id)
);

CREATE TABLE Books (
	book_id INT,
	title VARCHAR(40),
	author_id INT,
	type_id INT,
	supplier_id INT,
	PRIMARY KEY(book_id),
	FOREIGN KEY(author_id) REFERENCES Authors(author_id) ON DELETE CASCADE,
	FOREIGN KEY(type_id) REFERENCES Types(type_id) ON DELETE CASCADE,
	FOREIGN KEY(supplier_id) REFERENCES Suppliers(supplier_id) ON DELETE CASCADE,
);
	
INSERT INTO Types VALUES
	(1, 'Crime'),
	(2, 'Fiction'),
	(3, 'Thriller'),
	(4, 'Fantasy'),
	(5, 'Romance'),
	(6, 'Adventure'),
	(7, 'Childern''s Fiction'),
	(8, 'Scientific')

CREATE TABLE Types (
	type_id INT,
	type_name VARCHAR(30),
	PRIMARY KEY(type_id)
);

INSERT INTO Suppliers VALUES
	(1, 'Transworld', 'North America', '385910938'),
	(2, 'Bloomsbury', 'Sweden', '385910938'),
	(3, 'Random House', 'North America', '385910938'),
	(4, 'Brown Book', 'Germany', '385910938'),
	(5, 'Quercus', 'North America', '385910938'),
	(6, 'Macmillan', 'Mexico', '385910938'),
	(7, 'Penguin', 'North America', '385910938'),
	(8, 'Hodder', 'Poland', '385910938')

CREATE TABLE Suppliers (
	supplier_id INT,
	company_name VARCHAR(30),
	region VARCHAR(20),
	phone VARCHAR(20),
	PRIMARY KEY(supplier_id)
)

INSERT INTO Books VALUES
	(1, 'Da Vinci Code', 18, 1, 7),
	(2, 'Harry Potter and Deathly Hallows', 10, 4, 4),
	(3, 'Fifty Shades of Grey', 1, 6, 3),
	(4, 'Angles and Demons', 2, 8, 2),
	(5, 'Twilight', 2, 4, 2),
	(6, 'New Moon', 1, 2, 4),
	(7, 'The Art of War', 18, 3, 1),
	(8, 'Hostage at The Table', 14, 4, 4),
	(9, 'Why', 14, 1, 3),
	(10, 'Cryptography', 12, 2, 7),
	(11, 'Short History of Time', 11, 2, 7),
	(12, 'Tango', 13, 7, 6),
	(13, 'Rich Dad, Poor Dad', 3, 7, 8),
	(14, 'Eclipse', 18, 6, 3),
	(15, 'Lovely Bones', 9, 5, 4),
	(16, 'Fortress', 5, 5, 6),
	(17, 'Breaking Down', 18, 6, 3),
	(18, 'Gruffalo', 19, 8, 2),
	(19, 'One Day', 18, 3, 1),
	(20, 'Atonement', 3, 2, 6),
	(21, 'Sound of Laughter', 19, 1, 7),
	(22, 'Life of Pi', 17, 2, 8),
	(23, 'Birdsong', 20, 2, 2),
	(24, 'Labyrinth', 3, 8, 2),
	(25, 'Help', 1, 6, 4),
	(26, 'Memoirs', 8, 4, 5),
	(27, 'Island', 12, 4, 6),
	(28, 'Broker', 11, 5, 5)

CREATE TABLE Links (
	book_id INT,
	link VARCHAR(80),
	PRIMARY KEY(book_id)
)

INSERT INTO Links VALUES
	(1, 'https://www.google.com/search?q=da+vinci+code+book'),
	(2, 'https://www.google.com/search?q=harry+potter+and+deathly+hallows'),
	(3, 'https://www.google.com/search?q=fifty+shades+of+grey'),
	(4, 'https://www.google.com/search?q=angels+and+demons+book'),
	(5, 'https://www.google.com/search?q=twilight+book'),
	(6, 'https://www.google.com/search?q=new+moon'),
	(7, 'https://www.google.com/search?q=the+art+of+war'),
	(8, 'https://www.google.com/search?q=hostage+at+the+table'),
	(9, 'https://www.google.com/search?q=why+book'),
	(10, 'https://www.google.com/search?q=cryptography+book'),
	(11, 'https://www.google.com/search?q=short+history+of+time'),
	(12, 'https://www.google.com/search?q=tango+book'),
	(13, 'https://www.google.com/search?q=rich+dad+poor+dad'),
	(14, 'https://www.google.com/search?q=eclipse+book'),
	(15, 'https://www.google.com/search?q=lovely+bones+book'),
	(16, 'https://www.google.com/search?q=fortress+book'),
	(17, 'https://www.google.com/search?q=breaking+down+book'),
	(18, 'https://www.google.com/search?q=gruffalo+book'),
	(19, 'https://www.google.com/search?q=one+day+book'),
	(20, 'https://www.google.com/search?q=atonement+book'),
	(21, 'https://www.google.com/search?q=sound+of+laughter+book'),
	(22, 'https://www.google.com/search?q=life+of+pi+book'),
	(23, 'https://www.google.com/search?q=birdsong+book'),
	(24, 'https://www.google.com/search?q=labyrinth+book'),
	(25, 'https://www.google.com/search?q=help+book'),
	(26, 'https://www.google.com/search?q=memoirs+book'),
	(27, 'https://www.google.com/search?q=island+book'),
	(28, 'https://www.google.com/search?q=broker+book')
	
CREATE TABLE Orders (
	order_id INT,
	customer_id INT,
	unit_price INT,
	quantity INT,
	PRIMARY KEY(order_id),
	FOREIGN KEY(customer_id) REFERENCES Customers(customer_id) ON DELETE CASCADE

INSERT INTO Orders VALUES
	(1, 4, 54, 635),
	(2, 1, 34, 253),
	(3, 2, 2, 653),
	(4, 2, 4, 8653),
	(5, 5, 14, 153),
	(6, 3, 56, 9053),
	(7, 5, 75, 3335),
	(8, 8, 12, 1235),
	(9, 8, 24, 1653),
	(10, 3, 13, 4556),
	(11, 3, 64, 6213),
	(12, 2, 13, 22442),
	(13, 1, 73, 2964),
	(14, 2, 86, 313),
	(15, 5, 24, 133),
	(16, 7, 526, 251),
	(17, 8, 64, 9953),
	(18, 8, 264, 4525),
	(19, 2, 75, 6133),
	(20, 1, 34, 6515)

CREATE TABLE Customers (
	customer_id INT,
	customer_name VARCHAR(30),
	PRIMARY KEY(customer_id)
)

INSERT INTO Customers VALUES
	(1, 'Simon & Schuster'),
	(2, 'HarperCollins'),
	(3, 'Macmillan Publishers'),
	(4, 'Penguin Random House'),
	(5, 'Hachette Livre'),
	(6, 'Scholastic'),
	(7, 'Pearson Education'),
	(8, 'McGraw-Hill Education');


-- VIEWS (9)
	-- view 1 - customers with no orders
CREATE VIEW customers_no_order AS
	SELECT c.customer_id, c.customer_name FROM Customers c
	LEFT JOIN Orders o ON(o.customer_id = c.customer_id)
	WHERE order_id IS NULL 

	-- view 2 - list of authors from Germany
CREATE VIEW from_germany AS
	SELECT A.author_id, name FROM Authors A
	JOIN Authors_territories At ON(A.author_id = At.author_id)
	JOIN Territories T ON(At.territory_id = T.territory_id)
	WHERE territory_name = 'Germany';
	
	-- view 3 - list of asventure books
CREATE VIEW adventure_books AS
	SELECT book_id, title FROM Books B
	JOIN Types T ON(B.type_id = T.type_id)
	WHERE T.type_name = 'Adventure';
	
	-- view 4 - supplier with max number of books produced
CREATE VIEW max_supplier AS
	SELECT company_name FROM Books B
	JOIN Suppliers S ON(B.supplier_id = S.supplier_id)
	GROUP BY company_name
	ORDER BY count(*) DESC
	LIMIT 1;
	
	-- view 5 - association with max number of members
CREATE VIEW max_association AS
	SELECT Ass.name, count(*) AS num_of_members FROM Association Ass
	JOIN Authors A ON(Ass.association_id = A.association_id)
	GROUP BY Ass.name
	ORDER BY count(*) DESC
	LIMIT 1

	-- view 6 -- authors with no association
CREATE VIEW no_association AS
	SELECT author_id FROM Authors A
	LEFT JOIN Association Ass 
	ON(A.association_id = Ass.association_id)
	WHERE Ass.association_id IS NULL

	-- view 7 - list of authors and suppliers selling their books
CREATE VIEW author_supplier AS
	SELECT A.name, A.last_name, S.company_name FROM Authors A
	JOIN Books B ON(A.author_id = B.author_id)
	JOIN Suppliers S ON(B.supplier_id = S.supplier_id)
	
	-- view 8 - books written by authors from Scotland
CREATE VIEW books_scotland AS
	SELECT B.title FROM Books B
	JOIN Authors A ON(B.author_id = A.author_id)
	JOIN Authors_territories At ON (A.author_id = At.author_id)
	JOIN Territories T ON(At.territory_id = T.territory_id)
	WHERE T.territory_name = 'Scotland';

	-- view 9 - the order with the biggest cost
CREATE VIEW max_order AS
	SELECT order_id, (unit_price * quantity) AS cost
	FROM Orders
	ORDER BY cost DESC
	LIMIT 1;

-- FUNCTION (1) - function that prints all books with given type
CREATE OR REPLACE FUNCTION books_from_type(type_n VARCHAR) 
	RETURNS TABLE (
		title VARCHAR
	)
AS $$ 
BEGIN
	RETURN QUERY
	SELECT B.title FROM Books B
	JOIN Types T ON(B.type_id = T.type_id)
	WHERE T.type_name = type_n;
END; $$ LANGUAGE 'plpgsql';
	
-- TRIGGERS (5)
	-- trigger 1 - adding announcement in the table Audit "added new book", when new book is added
CREATE TABLE Audit(
	command VARCHAR(40)	
);

CREATE FUNCTION book_insert()
	RETURNS TRIGGER 
	LANGUAGE 'plpgsql'
AS $$ 
	BEGIN  
		INSERT INTO Audit VALUES ('New book added');
		RETURN NEW;
END; $$

CREATE TRIGGER book_added 
	BEFORE INSERT
	ON Books 
		FOR EACH ROW
			EXECUTE PROCEDURE book_insert()
	
	-- trigger 2 - adding type id of newly added book 
CREATE FUNCTION book_type()
	RETURNS TRIGGER 
	LANGUAGE 'plpgsql'
AS $$ 
	BEGIN  
		INSERT INTO Audit VALUES (NEW.type_id);
		RETURN NEW;
END; $$

CREATE TRIGGER book_added_type 
	BEFORE INSERT
	ON Books 
		FOR EACH ROW
			EXECUTE PROCEDURE book_type()

	-- trigger 3 - adding name of newly added author
CREATE FUNCTION author_added()
	RETURNS TRIGGER
	LANGUAGE 'plpgsql'
AS $$
	BEGIN
		INSERT INTO Audit VALUES (NEW.name + NEW.last_name);
		RETURN NEW;
END; $$
	
CREATE TRIGGER author_added
	BEFORE INSERT
	ON Authors
		FOR EACH ROW
			EXECUTE PROCEDURE author_added()
	
	-- trigger 4 - adding old company name and new, when updating in table Suppliers
CREATE FUNCTION name_updated()
	RETURNS TRIGGER
	LANGUAGE 'plpgsql'
AS $$
	BEGIN 
		INSERT INTO Audit VALUES (OLD.company_name + ' changed to ' + NEW.company_name);
		RETURN NEW;
END; $$
	
CREATE TRIGGER name_changed
	BEFORE UPDATE
	ON Suppliers
		FOR EACH ROW
			EXECUTE PROCEDURE name_updated();

	-- trigger 5 - adding name of newly deleted author
CREATE FUNCTION author_deleted()
	RETURNS TRIGGER
	LANGUAGE 'plpgsql'
AS $$
	BEGIN 
		INSERT INTO Audit VALUES (OLD.name + ' deleted');
		RETURN NEW;
END; $$
	
CREATE TRIGGER author_delete
	BEFORE DELETE
	ON Authors
		FOR EACH ROW
			EXECUTE PROCEDURE author_deleted();

-- PROCEDURES (5)

	-- procedure 1 - adding new member to association
CREATE OR REPLACE PROCEDURE memeber_add(ass_id int)
LANGUAGE 'plpgsql'
AS $$
	BEGIN
		UPDATE Association
		SET memebers = members + 1
		WHERE association_id = ass_id;
		COMMIT;
END; $$
	
	-- procedure 2 - adding new link to book
CREATE OR REPLACE PROCEDURE change_link(b_id INT, new_link VARCHAR)
LANGUAGE 'plpgsql'
AS $$
	BEGIN
		UPDATE Links
		SET link = new_link
		WHERE book_id = b_id;
		COMMIT;
END; $$
	
	-- procedure 3 - all books from type1 have from this time type2
CREATE OR REPLACE PROCEDURE change_link(type1 VARCHAR, type2 VARCHAR)
LANGUAGE 'plpgsql'
AS $$
	BEGIN
		UPDATE Books
		SET type_id = (SELECT type_id FROM Types 
					   WHERE type_name = type2)
		WHERE type_id = (SELECT type_id FROM Types
						 WHERE type_name = type1);
		COMMIT;
END; $$
	
	-- procedure 4 - decrease unit_price by specific value_d where customer_name is cus_name
CREATE OR REPLACE PROCEDURE change_link(value_d INT, cus_name VARCHAR)
LANGUAGE 'plpgsql'
AS $$
	BEGIN
		UPDATE Orders
		SET unit_price = 
			CASE
				WHEN unit_price <= value_d THEN
					unit_price = 0
				ELSE unit_price = unit_price - value_d
			END
		WHERE customer_id = (
			SELECT customer_id 
			FROM Customers
			WHERE customer_name = cus_name
		);
		COMMIT;
END; $$
	
	-- procedure 5 - all books from type type1 are supplied by supplier named sup_name
CREATE OR REPLACE PROCEDURE change_supp(type1 VARCHAR, sup_name VARCHAR)
LANGUAGE 'plpgsql'
AS $$
	BEGIN
		UPDATE Books
		SET supplier_id = (SELECT supplier_id 
						   FROM Supplier 
						   WHERE supplier_name = sup_name)
		WHERE type_id = (SELECT type_id 
						FROM Types
						WHERE type_name = type1);
		COMMIT;
END; $$