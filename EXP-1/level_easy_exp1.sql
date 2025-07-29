-- Create Author table
CREATE TABLE Author (
    author_id INT PRIMARY KEY,
    name VARCHAR(100),
    country VARCHAR(100)
);

-- Create Book table with a foreign key to Author
CREATE TABLE Book (
    book_id INT PRIMARY KEY,
    title VARCHAR(200),
    author_id INT,
    FOREIGN KEY (author_id) REFERENCES Author(author_id)
);

-- Insert data into Author
INSERT INTO Author (author_id, name, country) VALUES
(1, 'J.K. Rowling', 'United Kingdom'),
(2, 'George R.R. Martin', 'United States'),
(3, 'Eichiro Oda', 'Japan');

-- Insert data into Book
INSERT INTO Book (book_id, title, author_id) VALUES
(101, 'Harry Potter and the Philosopher\'s Stone', 1),
(102, 'A Game of Thrones', 2),
(103, 'The One Piece', 3);

-- Join the tables to get book title, author name, and country
SELECT 
    Book.title AS Book_Title,
    Author.name AS Author_Name,
    Author.country AS Author_Country
FROM 
    Book
INNER JOIN 
    Author ON Book.author_id = Author.author_id;
