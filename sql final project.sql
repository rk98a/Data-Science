                                      
                                      -- Final project 
USE netflix;
-- 1 
SELECT g.Genre, AVG(n.IMDBScore) AS Avg_IMDb_Score
FROM Netflix_Originals n
JOIN Genre_Details g ON n.GenreID = g.GenreID
GROUP BY g.Genre;

-- 2
SELECT g.Genre, AVG(n.IMDBScore) AS Avg_IMDb_Score
FROM Netflix_Originals n
JOIN Genre_Details g ON n.GenreID = g.GenreID
GROUP BY g.Genre
HAVING AVG(n.IMDBScore) > 7.5;

-- 3
SELECT Title, IMDBScore
FROM Netflix_Originals
ORDER BY IMDBScore DESC;

-- 4
SELECT Title, Runtime
FROM Netflix_Originals
ORDER BY Runtime DESC
LIMIT 10;

-- 5
SELECT n.Title, g.Genre
FROM Netflix_Originals n
JOIN Genre_Details g ON n.GenreID = g.GenreID;

-- 6 
SELECT n.Title, g.Genre, n.IMDBScore, 
       RANK() OVER (PARTITION BY g.Genre ORDER BY n.IMDBScore DESC) AS Rank_Within_Genre
FROM Netflix_Originals n
JOIN Genre_Details g ON n.GenreID = g.GenreID;

-- 7 
SELECT Title, IMDBScore
FROM Netflix_Originals
WHERE IMDBScore > (SELECT AVG(IMDBScore) FROM Netflix_Originals);

-- 8
SELECT g.Genre, COUNT(n.Title) AS Number_of_Titles
FROM Netflix_Originals n
JOIN Genre_Details g ON n.GenreID = g.GenreID
GROUP BY g.Genre;

-- 9 
SELECT g.Genre, COUNT(n.Title) AS High_Rated_Titles
FROM Netflix_Originals n
JOIN Genre_Details g ON n.GenreID = g.GenreID
WHERE n.IMDBScore > 8
GROUP BY g.Genre
HAVING COUNT(n.Title) > 5;

-- 10
SELECT g.Genre, COUNT(n.Title) AS Number_of_Titles, AVG(n.IMDBScore) AS Avg_IMDb_Score
FROM Netflix_Originals n
JOIN Genre_Details g ON n.GenreID = g.GenreID
GROUP BY g.Genre
ORDER BY Avg_IMDb_Score DESC
LIMIT 3;


