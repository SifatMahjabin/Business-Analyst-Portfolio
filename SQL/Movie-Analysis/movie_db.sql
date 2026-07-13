create database movie_db;
use movie_db;
create TABLE Movies(
MovieID INT PRIMARY KEY,
Title VARCHAR(100),
Genre VARCHAR(50),
ReleaseYear INT,
Rating FLOAT,
BoxOfficeRevenue DECIMAL(15,0),
Director VARCHAR(100)
);
INSERT INTO Movies(MovieID,Title,Genre,ReleaseYear,Rating,BoxOfficeRevenue,Director)values
('1','Inception','Sci-Fi',2010,8.8,830000000,'Christopher Nolan'),
('2','Titanic','Romance',1997,7.8,2200000000,'James Cameron'),
('3','the Godfather','Crime',1972,9.2,134000000,'Francis Ford Coppola'),
('4','Avater','Sci-Fi',2009,7.9,2840000000,'James Cameron'),
('5','Intersteller','Sci-Fi',2014,8.6,677000000,'Christopher Nolan'),
('6','Parasite','Thriller',2019,8.6,264000000,'Bong Joon Hu'),
('7','The Dark Knight','Action',2008,9.0,1000000000,'Christopher Nolan'),
('8','Schindler''s list','Drama',1993,9.0,322000000,'Steven Spielberg'),
('9','The Shawshank Redemption','Drama',1994,9.3,28300000,'Frank Darabont'),
('10','Pulp Fiction','Crime',1994,8.9,213000000,'Quentin Tarantino');
-- Retrive all information about movies directed by Christopher Nolan
select * from Movies
where Director='Christopher Nolan';
-- Find all Distinct Genres in the Movie table
select Distinct Genre from Movies;
-- Display the top 5 high-rated movies, sorted by their rating in descending order
select * from Movies
Order By rating desc
limit 5;
-- List all movies released before the year 2000
select * from Movies
where ReleaseYear<2000;
-- Show the total number of movies in each genre
select Genre, Count(*) as TotalMovies
from Movies
Group by Genre;
-- Find the total revenue of all movies in the sci-fi genre
select Genre, Sum(BoxOfficeRevenue) as TotalRevenue
From Movies
where Genre='Sci-Fi';
-- Retrive the titles of movies with a rating greater than 8.5 but less than 9.0
select Title, Rating from Movies
 where rating>8.5 and rating<9.0;
 -- Display the names of all movies that have the word 'The' in their title.
 select Title from Movies
 where Title like '%The%';
 -- Find the movie with the highest box office revenue.
 select * from Movies
 Order By BoxOfficeRevenue desc
 Limit 1;
-- Retrive thw average rating of all movies released after 2000.
 select  avg(rating) as averageRating
from Movies
where ReleaseYear>2000;
 