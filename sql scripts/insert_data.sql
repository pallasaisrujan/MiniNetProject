-- Update User table to increase SubscriptionType length
ALTER TABLE User MODIFY SubscriptionType VARCHAR(20) NOT NULL;

-- Insert data into the User table
INSERT INTO User (Username, Email, Password, SubscriptionType, City, Country, Age) VALUES
('user1', 'user1@example.com', 'password1', 'Basic', 'New York', 'USA', 25),
('user2', 'user2@example.com', 'password2', '6 months premium', 'Los Angeles', 'USA', 30),
('user3', 'user3@example.com', 'password3', 'Basic', 'Chicago', 'USA', 22),
('user4', 'user4@example.com', 'password4', '1 year premium', 'Houston', 'USA', 35),
('user5', 'user5@example.com', 'password5', 'Basic', 'Phoenix', 'USA', 28);

-- Insert data into the Subscription table
INSERT INTO Subscription (UserID, PlanName, Price, Duration) VALUES
(1, 'Basic', 9.99, 180),      -- Basic plan for 6 months
(2, '6 months premium', 19.99, 180), -- Premium plan for 6 months
(3, 'Basic', 9.99, 180),      -- Basic plan for 6 months
(4, '1 year premium', 199.99, 365), -- Premium plan for 1 year
(5, 'Basic', 9.99, 180);      -- Basic plan for 6 months

-- Insert data into the Movie table
INSERT INTO Movie (Title, Genre, ReleaseDate) VALUES
('Movie 1', 'Action', '2022-01-01'),
('Movie 2', 'Comedy', '2022-02-01'),
('Movie 3', 'Drama', '2022-03-01'),
('Movie 4', 'Horror', '2022-04-01'),
('Movie 5', 'Sci-Fi', '2022-05-01');

-- Insert data into the Actor table
INSERT INTO Actor (Name, City, DateOfBirth) VALUES
('Actor 1', 'Los Angeles', '1980-01-01'),
('Actor 2', 'New York', '1985-02-01'),
('Actor 3', 'Chicago', '1990-03-01'),
('Actor 4', 'Houston', '1975-04-01'),
('Actor 5', 'Phoenix', '1988-05-01');

-- Insert data into the Review table
INSERT INTO Review (UserID, MovieID, Score, Comment) VALUES
(1, 1, 5, 'Great movie!'),
(2, 2, 4, 'Very funny.'),
(3, 3, 3, 'It was okay.'),
(4, 4, 2, 'Not my type.'),
(5, 5, 1, 'Did not enjoy.');

-- Insert data into the FavoriteMovie table
INSERT INTO FavoriteMovie (UserID, MovieID, Score) VALUES
(1, 1, 5),
(2, 2, 4),
(3, 3, 3),
(4, 4, 2),
(5, 5, 1);

-- Insert data into the MovieActor table
INSERT INTO MovieActor (MovieID, ActorID, Role) VALUES
(1, 1, 'Hero'),
(2, 2, 'Comedian'),
(3, 3, 'Lead'),
(4, 4, 'Villain'),
(5, 5, 'Scientist');

-- Insert data into the WatchHistory table
INSERT INTO WatchHistory (UserID, MovieID, WatchDate) VALUES
(1, 1, '2022-06-01'),
(2, 2, '2022-06-02'),
(3, 3, '2022-06-03'),
(4, 4, '2022-06-04'),
(5, 5, '2022-06-05');
