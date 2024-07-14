
-- Category: About Users Queries,-- Description: Export all users
SELECT User_ID AS CustomerID, UserName AS Username, UserEmail AS Email, UserPassword AS Password, UserSubscriptionType AS SubscriptionType, UserCity AS City, UserCountry AS Country, UserAge AS Age FROM UserInfo;

-- Category: About Users Queries,-- Description: Export all users from a specific country
SELECT User_ID AS CustomerID, UserName AS Username, UserEmail AS Email, UserPassword AS Password, UserSubscriptionType AS SubscriptionType, UserCity AS City, UserCountry AS Country, UserAge AS Age FROM UserInfo WHERE UserCountry = '{country}';

-- Category: About Users Queries,-- Description: Export data to find users between 22-30 years old (including 22 and 30)
SELECT User_ID AS CustomerID, UserName AS Username, UserEmail AS Email, UserPassword AS Password, UserSubscriptionType AS SubscriptionType, UserCity AS City, UserCountry AS Country, UserAge AS Age FROM UserInfo WHERE UserAge BETWEEN 22 AND 30;

-- Category: About Users Queries,-- Description: Count how many users exist per specific city
SELECT UserCity AS City, COUNT(*) AS UserCount FROM UserInfo GROUP BY UserCity;


-- Category: About Subscriptions Queries,-- Description: Export all subscriptions
SELECT Subscription_ID AS SubscriptionID, User_ID AS CustomerID, SubscriptionPlanName AS PlanName, SubscriptionPrice AS Price, SubscriptionDuration AS Duration FROM UserSubscriptions;

-- Category: About Subscriptions Queries,-- Description: Export all subscriptions for a specific user
SELECT Subscription_ID AS SubscriptionID, User_ID AS CustomerID, SubscriptionPlanName AS PlanName, SubscriptionPrice AS Price, SubscriptionDuration AS Duration FROM UserSubscriptions WHERE User_ID = {user_id};


-- Category: About Movies Queries,-- Description: Export all movies
SELECT Film_ID AS MovieID, FilmTitle AS Title, FilmGenre AS Genre, FilmReleaseDate AS ReleaseDate FROM Films;

-- Category: About Movies Queries,-- Description: Export all movies of a specific genre
SELECT Film_ID AS MovieID, FilmTitle AS Title, FilmGenre AS Genre, FilmReleaseDate AS ReleaseDate FROM Films WHERE FilmGenre = '{genre}';


-- Category: About Actors Queries,-- Description: Export all actors
SELECT Actor_ID AS ActorID, ActorName AS Name, ActorCity AS City, ActorDOB AS DateOfBirth FROM FilmActors;

-- Category: About Actors Queries,-- Description: Export all actors from a specific city
SELECT Actor_ID AS ActorID, ActorName AS Name, ActorCity AS City, ActorDOB AS DateOfBirth FROM FilmActors WHERE ActorCity = '{city}';


-- Category: About Reviews Queries,-- Description: Export all reviews
SELECT Review_ID AS ReviewID, User_ID AS CustomerID, Film_ID AS MovieID, ReviewScore AS Score, ReviewComment AS Comment FROM FilmReviews;

-- Category: About Reviews Queries,-- Description: Export all reviews for a specific movie
SELECT Review_ID AS ReviewID, User_ID AS CustomerID, Film_ID AS MovieID, ReviewScore AS Score, ReviewComment AS Comment FROM FilmReviews WHERE Film_ID = {movie_id};


-- Category: Task 4 Queries,-- Description: Export all data about users in the specified subscription plan[4.1].
SELECT User_ID AS CustomerID, UserName AS Username, UserEmail AS Email, UserPassword AS Password,
       UserSubscriptionType AS SubscriptionType, UserCity AS City, UserCountry AS Country, UserAge AS Age
FROM UserInfo
WHERE UserSubscriptionType = %s;

-- Category: Task 4 Queries,-- Description: Export all data about actors and their associated movies[4.2].
SELECT fa.Actor_ID AS ActorID, fa.ActorName AS Name, fa.ActorCity AS City, fa.ActorDOB AS DateOfBirth,
       f.Film_ID AS MovieID, f.FilmTitle AS Title, f.FilmGenre AS Genre, f.FilmReleaseDate AS ReleaseDate
FROM FilmActors fa
JOIN FilmCast fc ON fa.Actor_ID = fc.Actor_ID
JOIN Films f ON fc.Film_ID = f.Film_ID;

-- Category: Task 4 Queries,-- Description: Export all data to group actors from a specific city, showing also the average age (per city)[4.3].
SELECT ActorCity AS City, COUNT(*) AS NumberOfActors,
       AVG(YEAR(CURDATE()) - YEAR(ActorDOB)) AS AverageAge
FROM FilmActors
WHERE ActorCity = %s
GROUP BY ActorCity;

-- Category: Task 4 Queries,-- Description: Export all data to show the favourite comedy movies for a specific user[4.4].
SELECT ui.UserName AS Username, f.Film_ID AS MovieID, f.FilmTitle AS Title, f.FilmGenre AS Genre,
       f.FilmReleaseDate AS ReleaseDate, ff.FavoriteScore AS Rating
FROM UserInfo ui
JOIN FavoriteFilms ff ON ui.User_ID = ff.User_ID
JOIN Films f ON ff.Film_ID = f.Film_ID
WHERE ui.UserName = %s AND f.FilmGenre = %s;

-- Category: Task 4 Queries,-- Description: Export all data to count how many subscriptions are in the database per country[4.5].
SELECT UserCountry AS Country, COUNT(*) AS SubscriptionCount
FROM UserInfo
GROUP BY UserCountry;

-- Category: Task 4 Queries,-- Description: Export all data to find the movies that start with a specific keyword[4.6].
SELECT Film_ID AS FilmID, FilmTitle AS Title, FilmGenre AS Genre, FilmReleaseDate AS ReleaseDate
FROM Films
WHERE FilmTitle LIKE %s;

-- Category: Task 4 Queries,-- Description: Export data to find the number of subscriptions per movie category[4.7].
SELECT f.FilmGenre AS Genre, COUNT(DISTINCT ui.User_ID) AS SubscriptionCount
FROM Films f
JOIN FavoriteFilms ff ON f.Film_ID = ff.Film_ID
JOIN UserInfo ui ON ff.User_ID = ui.User_ID
GROUP BY f.FilmGenre;

-- Category: Task 4 Queries,-- Description: Export data to find the username and the city of the youngest customer in a specific subscription category[4.8].
WITH YoungestUser AS (
    SELECT UserName AS Username, UserCity AS City, UserAge AS Age,
           ROW_NUMBER() OVER (ORDER BY UserAge ASC) AS RowNum
    FROM UserInfo
    WHERE UserSubscriptionType = %s
)
SELECT Username, City
FROM YoungestUser
WHERE RowNum = 1;

-- Category: Task 4 Queries,-- Description: Export data to find users between a specified age range (inclusive)[4.9].
SELECT User_ID AS CustomerID, UserName AS Username, UserEmail AS Email, UserPassword AS Password,
       UserSubscriptionType AS SubscriptionType, UserCity AS City, UserCountry AS Country, UserAge AS Age
FROM UserInfo
WHERE UserAge BETWEEN %s AND %s;

-- Category: Task 4 Queries,-- Description: Export data to find the average age of users with low score reviews (less than a specified rating). Group your data for users under 20, 21-40, and 41 and over[4.10].
WITH UserAgeGroups AS (
    SELECT ui.User_ID, ui.UserAge,
           CASE
               WHEN ui.UserAge < 20 THEN 'Under 20'
               WHEN ui.UserAge BETWEEN 21 AND 40 THEN '21-40'
               ELSE '41 and over'
           END AS AgeGroup
    FROM UserInfo ui
    JOIN FilmReviews fr ON ui.User_ID = fr.User_ID
    WHERE fr.ReviewScore < %s
)
SELECT AgeGroup, AVG(UserAge) AS AverageAge
FROM UserAgeGroups
GROUP BY AgeGroup;
