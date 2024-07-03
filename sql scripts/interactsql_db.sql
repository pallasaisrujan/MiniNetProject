-- 1. Best movie in Sci-Fi genre based on average review score
SELECT Title, AVG(Score) as AverageScore
FROM Movie
JOIN Review ON Movie.MovieID = Review.MovieID
WHERE Genre = 'Sci-Fi'
GROUP BY Title
ORDER BY AverageScore DESC
LIMIT 1;

-- 2. Best actor in Drama genre based on average review score of movies they acted in
SELECT Name, AVG(Score) as AverageScore
FROM Actor
JOIN MovieActor ON Actor.ActorID = MovieActor.ActorID
JOIN Movie ON MovieActor.MovieID = Movie.MovieID
JOIN Review ON Movie.MovieID = Review.MovieID
WHERE Genre = 'Drama'
GROUP BY Name
ORDER BY AverageScore DESC
LIMIT 1;

-- 3. Total number of users by subscription type
SELECT SubscriptionType, COUNT(*) as TotalUsers
FROM User
GROUP BY SubscriptionType;

-- 4. Most favorited movie
SELECT Title, COUNT(*) as Favorites
FROM Movie
JOIN FavoriteMovie ON Movie.MovieID = FavoriteMovie.MovieID
GROUP BY Title
ORDER BY Favorites DESC
LIMIT 1;

-- 5. Most active user based on number of reviews
SELECT Username, COUNT(*) as ReviewCount
FROM User
JOIN Review ON User.UserID = Review.UserID
GROUP BY Username
ORDER BY ReviewCount DESC
LIMIT 1;

-- 6. Average age of users by subscription type
SELECT SubscriptionType, AVG(Age) as AverageAge
FROM User
GROUP BY SubscriptionType;

-- 7. Most popular genre based on the number of movies
SELECT Genre, COUNT(*) as MovieCount
FROM Movie
GROUP BY Genre
ORDER BY MovieCount DESC
LIMIT 1;

-- 8. Movies watched by a specific user
SELECT Title, WatchDate
FROM Movie
JOIN WatchHistory ON Movie.MovieID = WatchHistory.MovieID
JOIN User ON WatchHistory.UserID = User.UserID
WHERE Username = 'user1';

-- 9. Top 5 users who watched the most movies
SELECT Username, COUNT(*) as WatchCount
FROM User
JOIN WatchHistory ON User.UserID = WatchHistory.UserID
GROUP BY Username
ORDER BY WatchCount DESC
LIMIT 5;

-- 10. Average score of movies by genre
SELECT Genre, AVG(Score) as AverageScore
FROM Movie
JOIN Review ON Movie.MovieID = Review.MovieID
GROUP BY Genre;
