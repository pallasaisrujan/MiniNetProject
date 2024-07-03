

-- Insert data into the User table
INSERT INTO User (Username, Email, Password, SubscriptionType, City, Country, Age) VALUES
('user1', 'user1@example.com', 'password1', 'Basic', 'New York', 'USA', 25),
('user2', 'user2@example.com', 'password2', '6 months premium', 'Los Angeles', 'USA', 30),
('user3', 'user3@example.com', 'password3', 'Basic', 'Chicago', 'USA', 22),
('user4', 'user4@example.com', 'password4', '1 year premium', 'Houston', 'USA', 35),
('user5', 'user5@example.com', 'password5', 'Basic', 'Phoenix', 'USA', 28),
('user6', 'user6@example.com', 'password6', 'Basic', 'Boston', 'USA', 32),
('user7', 'user7@example.com', 'password7', '6 months premium', 'San Francisco', 'USA', 27),
('user8', 'user8@example.com', 'password8', '1 year premium', 'Seattle', 'USA', 24),
('user9', 'user9@example.com', 'password9', 'Basic', 'Austin', 'USA', 29),
('user10', 'user10@example.com', 'password10', '6 months premium', 'Denver', 'USA', 31);

-- Insert data into the Subscription table
INSERT INTO Subscription (UserID, PlanName, Price, Duration) VALUES
(1, 'Basic', 9.99, 180),      -- Basic plan for 6 months
(2, '6 months premium', 19.99, 180), -- Premium plan for 6 months
(3, 'Basic', 9.99, 180),      -- Basic plan for 6 months
(4, '1 year premium', 199.99, 365), -- Premium plan for 1 year
(5, 'Basic', 9.99, 180),      -- Basic plan for 6 months
(6, 'Basic', 9.99, 180),      -- Basic plan for 6 months
(7, '6 months premium', 19.99, 180), -- Premium plan for 6 months
(8, '1 year premium', 199.99, 365), -- Premium plan for 1 year
(9, 'Basic', 9.99, 180),      -- Basic plan for 6 months
(10, '6 months premium', 19.99, 180); -- Premium plan for 6 months

-- Insert real-time data into the Movie table
INSERT INTO Movie (Title, Genre, ReleaseDate) VALUES
('Inception', 'Sci-Fi', '2010-07-16'),
('The Godfather', 'Crime', '1972-03-24'),
('The Dark Knight', 'Action', '2008-07-18'),
('Pulp Fiction', 'Crime', '1994-10-14'),
('Schindler\'s List', 'Drama', '1993-12-15'),
('Forrest Gump', 'Drama', '1994-07-06'),
('The Matrix', 'Sci-Fi', '1999-03-31'),
('The Shawshank Redemption', 'Drama', '1994-09-23'),
('The Lord of the Rings: The Return of the King', 'Fantasy', '2003-12-17'),
('Fight Club', 'Drama', '1999-10-15');

-- Insert real-time data into the Actor table
INSERT INTO Actor (Name, City, DateOfBirth) VALUES
('Leonardo DiCaprio', 'Los Angeles', '1974-11-11'),
('Marlon Brando', 'Omaha', '1924-04-03'),
('Christian Bale', 'Haverfordwest', '1974-01-30'),
('John Travolta', 'Englewood', '1954-02-18'),
('Liam Neeson', 'Ballymena', '1952-06-07'),
('Tom Hanks', 'Concord', '1956-07-09'),
('Keanu Reeves', 'Beirut', '1964-09-02'),
('Morgan Freeman', 'Memphis', '1937-06-01'),
('Elijah Wood', 'Cedar Rapids', '1981-01-28'),
('Brad Pitt', 'Shawnee', '1963-12-18');

-- Insert data into the Review table
INSERT INTO Review (UserID, MovieID, Score, Comment) VALUES
(1, 1, 5, 'Amazing movie!'),
(2, 2, 5, 'A classic.'),
(3, 3, 4, 'Great movie, but a bit long.'),
(4, 4, 5, 'One of the best.'),
(5, 5, 5, 'Very moving.'),
(6, 6, 4, 'Heartwarming story.'),
(7, 7, 5, 'Revolutionary film.'),
(8, 8, 5, 'A masterpiece.'),
(9, 9, 5, 'Epic conclusion.'),
(10, 10, 4, 'Thought-provoking.');

-- Insert data into the FavoriteMovie table
INSERT INTO FavoriteMovie (UserID, MovieID, Score) VALUES
(1, 1, 5),
(2, 2, 5),
(3, 3, 4),
(4, 4, 5),
(5, 5, 5),
(6, 6, 4),
(7, 7, 5),
(8, 8, 5),
(9, 9, 5),
(10, 10, 4);

-- Insert data into the MovieActor table
INSERT INTO MovieActor (MovieID, ActorID, Role) VALUES
(1, 1, 'Cobb'),
(2, 2, 'Don Vito Corleone'),
(3, 3, 'Bruce Wayne'),
(4, 4, 'Vincent Vega'),
(5, 5, 'Oskar Schindler'),
(6, 6, 'Forrest Gump'),
(7, 7, 'Neo'),
(8, 8, 'Ellis Redding'),
(9, 9, 'Frodo Baggins'),
(10, 10, 'Tyler Durden');

-- Insert data into the WatchHistory table
INSERT INTO WatchHistory (UserID, MovieID, WatchDate) VALUES
(1, 1, '2023-01-01'),
(2, 2, '2023-01-02'),
(3, 3, '2023-01-03'),
(4, 4, '2023-01-04'),
(5, 5, '2023-01-05'),
(6, 6, '2023-01-06'),
(7, 7, '2023-01-07'),
(8, 8, '2023-01-08'),
(9, 9, '2023-01-09'),
(10, 10, '2023-01-10');
