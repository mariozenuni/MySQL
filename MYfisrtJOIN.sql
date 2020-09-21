CREATE DATABASE tv_show_reviewing_app;
USE tv_show_reviewing_app;

CREATE TABLE Reviewers
(Id INT AUTO_INCREMENT PRIMARY KEY,
first_name VARCHAR(100), 
last_name VARCHAR(100)

);

CREATE TABLE Series
(Id INT AUTO_INCREMENT PRIMARY KEY,
title VARCHAR(100), 
released_year YEAR(4),
genre VARCHAR(100)
);

CREATE TABLE Reviews
(
Id INT AUTO_INCREMENT PRIMARY KEY, 
rating DECIMAL(2,1),
series_id INT, 
FOREIGN KEY(series_id) REFERENCES Series(Id),
Reviewer_id INT,
FOREIGN KEY(Reviewer_id) REFERENCES Reviewers(Id) 
);


INSERT INTO Reviewers(first_name, last_name) 
VALUES
	('Thomas', 'Stoneman'),
    ('Wyatt', 'Skaggs'),
    ('Kimbra', 'Masters'),
    ('Domingo', 'Cortes'),
    ('Colt', 'Steele'),
    ('Pinkie', 'Petit'),
    ('Marlon', 'Crafford');
    
    INSERT INTO Series(title,released_year,genre)
    VALUES
    ('Archer', 2009, 'Animation'),
    ('Arrested Development', 2003, 'Comedy'),
    ("Bob's Burgers", 2011, 'Animation'),
    ('Bojack Horseman', 2014, 'Animation'),
    ("Breaking Bad", 2008, 'Drama'),
    ('Curb Your Enthusiasm', 2000, 'Comedy'),
    ("Fargo", 2014, 'Drama'),
    ('Freaks and Geeks', 1999, 'Comedy'),
    ('General Hospital', 1963, 'Drama'),
    ('Halt and Catch Fire', 2014, 'Drama'),
    ('Malcolm In The Middle', 2000, 'Comedy'),
    ('Pushing Daisies', 2007, 'Comedy'),
    ('Seinfeld', 1989, 'Comedy'),
    ('Stranger Things', 2016, 'Drama');
    





INSERT INTO reviews(series_id, reviewer_id, rating) VALUES
    (1,1,8.0),(1,2,7.5),(1,3,8.5),(1,4,7.7),(1,5,8.9),
    (2,1,8.1),(2,4,6.0),(2,3,8.0),(2,6,8.4),(2,5,9.9),
    (3,1,7.0),(3,6,7.5),(3,4,8.0),(3,3,7.1),(3,5,8.0),
    (4,1,7.5),(4,3,7.8),(4,4,8.3),(4,2,7.6),(4,5,8.5),
    (5,1,9.5),(5,3,9.0),(5,4,9.1),(5,2,9.3),(5,5,9.9),
    (6,2,6.5),(6,3,7.8),(6,4,8.8),(6,2,8.4),(6,5,9.1),
    (7,2,9.1),(7,5,9.7),
    (8,4,8.5),(8,2,7.8),(8,6,8.8),(8,5,9.3),
    (9,2,5.5),(9,3,6.8),(9,4,5.8),(9,6,4.3),(9,5,4.5),
    (10,5,9.9),
    (13,3,8.0),(13,4,7.2),
    (14,2,8.5),(14,3,8.9),(14,4,8.9);
    
    
    
    SELECT*FROM Reviewers;
    
    SELECT title FROM Series;
    SELECT rating FROM Reviews;
    
    SELECT title, rating FROM Series, Reviews;
    
    SELECT *FROM Series 
    JOIN Reviews 
    ON Reviews.series_id=Series.id 
    ;
    
	SELECT title, rating FROM Series 
    JOIN Reviews 
    ON Reviews.series_id=Series.id 
   ;
   SELECT title, RATING FROM Series 
    JOIN Reviews 
    ON Reviews.series_id=Series.id 
   ;
   
   
   SELECT *FROM Series 
    JOIN Reviews 
    ;
   
   
   SELECT *FROM Series 
    JOIN Reviews 
    ;
    
   SELECT title, 
   AVG(rating) AS 'AVG_rating ' 
FROM Series 
JOIN Reviews
    ON Series.id=Reviews.series_id
GROUP BY  Series.id
ORDER  BY AVG_rating
;

SELECT first_name, last_name FROM Reviewers 
    JOIN Reviews
    ON Reviews.Reviewer_id=Reviewers.id
    ;

    
SELECT 
first_name, 
last_name, 
rating  
FROM Reviewers 
	JOIN Reviews
		ON Reviewers.id=Reviews.Reviewer_id
    ;
    
    
    SELECT *FROM Series 
    JOIN Reviews
    ;
    
SELECT title AS 'unreviewed_series' FROM Series 
    JOIN Reviews
    ON Reviews.series_id=Series.id
    GROUP BY title 
    ;
    
    SELECT *FROM Reviewers
    JOIN Series
    JOIN Reviews
    ON Reviews.series_id=Series.id 
    ON Reviews.Reviewer_id=Reviewers.Id
    ;
    
	SELECT title   FROM Series
    LEFT JOIN Reviews
    ON Series.Id=Reviews.series_id
    WHERE Rating IS NULL
	;
    
    SELECT genre, 
    ROUND(AVG(rating), 2 ) 
    AS 'AVG_Rating' FROM Series
    INNER JOIN Reviews
		ON Series.Id=Reviews.series_id
    GROUP BY genre 
    ORDER BY  rating ;
    
    
    
    SELECT 
    first_name, 
    last_name,
    Reviewer_id,
    rating 
    FROM Reviewers
    LEFT JOIN Reviews
		ON Reviewers.Id=Reviews.Reviewer_id
	GROUP BY first_name, last_name
	;
     
     
SELECT 
      first_name,
      last_name,
      IFNULL(COUNT(series_id),0) AS 'COUNT',
      IFNULL(MIN(rating),0) AS 'MIN', 
      IFNULL(MAX(rating),0) AS 'MAX',
      Round(IFNULL(AVG(rating),0),2) AS 'AVG',
	CASE 
      WHEN 
      series_id > 0 THEN 'ACTIVE'
      ELSE 'INACTIVE'
      END AS 'STATUS'
FROM Reviewers
LEFT JOIN Reviews
		ON Reviewers.Id=Reviews.Reviewer_id
GROUP BY  Reviewers.id
        ;
        
        
        
SELECT 
		title, 
        rating, 
        CONCAT(first_name, last_name) AS Reviewer   
FROM Series 
JOIN Reviews
JOIN Reviewers
		ON Series.id=Reviews.series_id
		ON Reviewers.id=Reviews.Reviewer_id
    ;
   
SELECT 
		title, 
        rating, 
        CONCAT(first_name, last_name) AS Reviewer   
FROM Series 
JOIN Reviews
JOIN Reviewers
;



SELECT 
title, 
rating, 
concat(first_name,' ',last_name) AS Reviewer 
FROM Reviewers
JOIN reviews
	ON Reviewers.Id=reviews.reviewer_id 
 JOIN series
	ON SERIES.ID=reviews.SERIES_ID 
    GROUP BY RATING 
;







 
 
 
 
 