-- Insert data into User table
INSERT INTO User (Username, Email, Password, SubscriptionType, City, Country, Age) VALUES
('john_doe', 'john@example.com', 'password1', 'hd', 'new york', 'usa', 28),
('alice_smith', 'alice@example.com', 'password2', 'hd', 'los angeles', 'usa', 34),
('jane_doe', 'jane@example.com', 'password3', 'uhd', 'chicago', 'usa', 21),
('bob_jones', 'bob@example.com', 'password4', 'uhd', 'boston', 'usa', 30),
('emma_johnson', 'emma@example.com', 'password5', 'hd', 'san francisco', 'usa', 25),
('chris_evans', 'chris@example.com', 'password6', 'hd', 'houston', 'usa', 35),
('scarlett_johansson', 'scarlett@example.com', 'password7', 'uhd', 'miami', 'usa', 29),
('mark_ruffalo', 'mark@example.com', 'password8', 'hd', 'denver', 'usa', 40),
('chris_hemsworth', 'chrish@example.com', 'password9', 'uhd', 'seattle', 'usa', 32),
('robert_downey', 'robert@example.com', 'password10', 'hd', 'austin', 'usa', 48);

-- Insert data into Subscription table
INSERT INTO Subscription (UserID, PlanName, Price, Duration) VALUES
(1, 'hd', 9.99, 1),
(2, 'hd', 9.99, 1),
(3, 'uhd', 14.99, 1),
(4, 'uhd', 14.99, 1),
(5, 'hd', 9.99, 1),
(6, 'hd', 9.99, 1),
(7, 'uhd', 14.99, 1),
(8, 'hd', 9.99, 1),
(9, 'uhd', 14.99, 1),
(10, 'hd', 9.99, 1);

-- Insert data into Movie table
INSERT INTO Movie (MovieID, Title, Genre, ReleaseDate) VALUES
(1, 'stranger things', 'sci-fi', '2016-07-15'),
(2, 'breaking bad', 'drama', '2008-01-20'),
(3, 'the office', 'comedy', '2005-03-24'),
(4, 'parks and recreation', 'comedy', '2009-04-09'),
(5, 'the godfather', 'crime', '1972-03-24'),
(6, 'inception', 'sci-fi', '2010-07-16'),
(7, 'the dark knight', 'action', '2008-07-18'),
(8, 'pulp fiction', 'crime', '1994-10-14'),
(9, 'schindler\'s list', 'drama', '1993-12-15'),
(10, 'forrest gump', 'drama', '1994-07-06'),
(11, 'titanic', 'drama', '1997-12-19'),
(12, 'django unchained', 'western', '2012-12-25'),
(13, 'the revenant', 'adventure', '2015-12-25'),
(14, 'superbad', 'comedy', '2007-08-17'),
(15, 'superman', 'action', '1978-12-15'),
(16, 'goodfellas', 'crime', '1990-09-19'),
(17, 'jaws', 'thriller', '1975-06-20'),
(18, 'taxi driver', 'drama', '1976-02-08'),
(19, 'rocky', 'drama', '1976-11-21'),
(20, 'the shining', 'horror', '1980-05-23'),
(21, 'die hard', 'action', '1988-07-15'),
(22, 'no country for old men', 'thriller', '2007-11-09'),
(23, 'batman begins', 'action', '2005-06-15'),
(24, 'taken', 'action', '2008-02-27'),
(25, 'clash of the titans', 'fantasy', '2010-04-02');

-- Insert data into Actor table
INSERT INTO Actor (ActorID, Name, City, DateOfBirth) VALUES
(1, 'millie bobby brown', 'los angeles', '2004-02-19'),
(2, 'bryan cranston', 'hollywood', '1956-03-07'),
(3, 'winona ryder', 'new york', '1971-10-29'),
(4, 'aaron paul', 'boise', '1979-08-27'),
(5, 'david harbour', 'white plains', '1975-04-10'),
(6, 'leonardo dicaprio', 'los angeles', '1974-11-11'),
(7, 'marlon brando', 'omaha', '1924-04-03'),
(8, 'christian bale', 'haverfordwest', '1974-01-30'),
(9, 'john travolta', 'englewood', '1954-02-18'),
(10, 'liam neeson', 'ballymena', '1952-06-07');

-- Insert data into Review table
INSERT INTO Review (UserID, MovieID, Score, Comment) VALUES
(1, 1, 5, 'amazing show!'),
(2, 2, 3, 'good show'),
(3, 3, 4, 'funny and smart'),
(4, 4, 2, 'not my taste'),
(5, 5, 5, 'a classic!'),
(6, 6, 4, 'mind-bending!'),
(7, 7, 5, 'excellent action.'),
(8, 8, 3, 'very entertaining.'),
(9, 9, 5, 'very moving.'),
(10, 10, 4, 'heartwarming story.');

-- Insert data into FavoriteMovie table
INSERT INTO FavoriteMovie (UserID, MovieID, Score) VALUES
(1, 3, 5),
(1, 4, 4),
(2, 5, 3),
(3, 1, 5),
(4, 2, 4),
(5, 6, 5),
(6, 7, 4),
(7, 8, 5),
(8, 9, 4),
(9, 10, 5);

-- Insert data into MovieActor table
INSERT INTO MovieActor (MovieID, ActorID, Role) VALUES
(1, 1, 'eleven'),
(2, 2, 'walter white'),
(3, 3, 'joyce byers'),
(4, 4, 'jesse pinkman'),
(5, 5, 'jim hopper'),
(6, 6, 'cobb'),
(7, 7, 'don vito corleone'),
(8, 8, 'bruce wayne'),
(9, 9, 'vincent vega'),
(10, 10, 'oskar schindler'),
(11, 6, 'jack dawson'),
(12, 6, 'calvin candie'),
(13, 6, 'hugh glass'),
(14, 8, 'patrick bateman'),
(15, 8, 'bruce wayne'),
(16, 8, 'alfred borden'),
(17, 7, 'vito corleone'),
(18, 7, 'terry malloy'),
(19, 7, 'stanley kowalski'),
(20, 9, 'john mcclane'),
(21, 9, 'john mcclane'),
(22, 9, 'sheriff bell'),
(23, 10, 'ras al ghul'),
(24, 10, 'bryan mills'),
(25, 10, 'zeus');

-- Insert data into WatchHistory table
INSERT INTO WatchHistory (UserID, MovieID, WatchDate) VALUES
(1, 1, '2023-06-10'),
(2, 2, '2023-06-11'),
(3, 3, '2023-06-12'),
(4, 4, '2023-06-13'),
(5, 5, '2023-06-14'),
(6, 6, '2023-06-15'),
(7, 7, '2023-06-16'),
(8, 8, '2023-06-17'),
(9, 9, '2023-06-18'),
(10, 10, '2023-06-19');