-- Query 1: Best actor in a given genre based on average review score of movies they acted in
-- Input: {genre}
SELECT Name, AVG(Score) as AverageScore
FROM Actor
JOIN MovieActor ON Actor.ActorID = MovieActor.ActorID
JOIN Movie ON MovieActor.MovieID = Movie.MovieID
JOIN Review ON Movie.MovieID = Review.MovieID
WHERE Genre = '{genre}'
GROUP BY Name
ORDER BY AverageScore DESC
LIMIT 1;

-- Query 2: Movies acted in by a specific actor
-- Input: {actor_name}
SELECT Title
FROM Movie
JOIN MovieActor ON Movie.MovieID = MovieActor.MovieID
JOIN Actor ON MovieActor.ActorID = Actor.ActorID
WHERE Actor.Name = '{actor_name}';

-- Query 3: Total number of movies by a specific actor
-- Input: {actor_name}
SELECT Actor.Name, COUNT(*) as TotalMovies
FROM Actor
JOIN MovieActor ON Actor.ActorID = MovieActor.ActorID
WHERE Actor.Name = '{actor_name}'
GROUP BY Actor.Name;

-- Query 4: Highest rated movie by a specific actor
-- Input: {actor_name}
SELECT Movie.Title, MAX(Review.Score) as HighestScore
FROM Movie
JOIN MovieActor ON Movie.MovieID = MovieActor.MovieID
JOIN Actor ON MovieActor.ActorID = Actor.ActorID
JOIN Review ON Movie.MovieID = Review.MovieID
WHERE Actor.Name = '{actor_name}'
GROUP BY Movie.Title
ORDER BY HighestScore DESC
LIMIT 1;

-- Query 5: Actors who acted in a given movie
-- Input: {movie_title}
SELECT Actor.Name
FROM Actor
JOIN MovieActor ON Actor.ActorID = MovieActor.ActorID
JOIN Movie ON Movie.MovieID = MovieActor.MovieID
WHERE Movie.Title = '{movie_title}';

-- Query 6: Average review score of movies by a specific actor
-- Input: {actor_name}
SELECT Actor.Name, AVG(Review.Score) as AverageScore
FROM Actor
JOIN MovieActor ON Actor.ActorID = MovieActor.ActorID
JOIN Movie ON Movie.MovieID = MovieActor.MovieID
JOIN Review ON Movie.MovieID = Review.MovieID
WHERE Actor.Name = '{actor_name}'
GROUP BY Actor.Name;

-- Query 7: Genres an actor has acted in
-- Input: {actor_name}
SELECT DISTINCT Movie.Genre
FROM Movie
JOIN MovieActor ON Movie.MovieID = MovieActor.MovieID
JOIN Actor ON MovieActor.ActorID = Actor.ActorID
WHERE Actor.Name = '{actor_name}';

-- Query 8: Number of movies by genre for a specific actor
-- Input: {actor_name}
SELECT Movie.Genre, COUNT(*) as MovieCount
FROM Movie
JOIN MovieActor ON Movie.MovieID = MovieActor.MovieID
JOIN Actor ON MovieActor.ActorID = Actor.ActorID
WHERE Actor.Name = '{actor_name}'
GROUP BY Movie.Genre;

-- Query 9: Actors who have acted in the most movies
-- Input: None
SELECT Actor.Name, COUNT(*) as MovieCount
FROM Actor
JOIN MovieActor ON Actor.ActorID = MovieActor.ActorID
GROUP BY Actor.Name
ORDER BY MovieCount DESC
LIMIT 5;

-- Query 10: Most common role for a specific actor
-- Input: {actor_name}
SELECT MovieActor.Role, COUNT(*) as RoleCount
FROM MovieActor
JOIN Actor ON MovieActor.ActorID = Actor.ActorID
WHERE Actor.Name = '{actor_name}'
GROUP BY MovieActor.Role
ORDER BY RoleCount DESC
LIMIT 1;

-- Query 11: Actors with the highest average review score
-- Input: None
SELECT Actor.Name, AVG(Review.Score) as AverageScore
FROM Actor
JOIN MovieActor ON Actor.ActorID = MovieActor.ActorID
JOIN Movie ON Movie.MovieID = MovieActor.MovieID
JOIN Review ON Movie.MovieID = Review.MovieID
GROUP BY Actor.Name
ORDER BY AverageScore DESC
LIMIT 5;

-- Query 12: Movies and roles of a specific actor
-- Input: {actor_name}
SELECT Movie.Title, MovieActor.Role
FROM Movie
JOIN MovieActor ON Movie.MovieID = MovieActor.MovieID
JOIN Actor ON MovieActor.ActorID = Actor.ActorID
WHERE Actor.Name = '{actor_name}';

-- Query 13: Actors who have acted in multiple genres
-- Input: None
SELECT Actor.Name, COUNT(DISTINCT Movie.Genre) as GenreCount
FROM Actor
JOIN MovieActor ON Actor.ActorID = MovieActor.ActorID
JOIN Movie ON Movie.MovieID = MovieActor.MovieID
GROUP BY Actor.Name
HAVING GenreCount > 1
ORDER BY GenreCount DESC;

-- Query 14: Actors who have the most roles
-- Input: None
SELECT Actor.Name, COUNT(*) as RoleCount
FROM Actor
JOIN MovieActor ON Actor.ActorID = MovieActor.ActorID
GROUP BY Actor.Name
ORDER BY RoleCount DESC
LIMIT 5;

-- Query 15: Movies acted in by a specific actor with review scores
-- Input: {actor_name}
SELECT Movie.Title, Review.Score, Review.Comment
FROM Movie
JOIN MovieActor ON Movie.MovieID = MovieActor.MovieID
JOIN Actor ON MovieActor.ActorID = Actor.ActorID
JOIN Review ON Movie.MovieID = Review.MovieID
WHERE Actor.Name = '{actor_name}';
