-- Insert data into UserInfo table
INSERT INTO UserInfo (UserName, UserEmail, UserPassword, UserSubscriptionType, UserCity, UserCountry, UserAge) VALUES
('Leonard_Hofstadter', 'leonard@example.com', 'password1', 'HD', 'Pasadena', 'USA', 25),
('Sheldon_Cooper', 'sheldon@example.com', 'password2', 'HD', 'Pasadena', 'USA', 28),
('Penny_Teller', 'penny@example.com', 'password3', 'UHD', 'Pasadena', 'USA', 21),
('Howard_Wolowitz', 'howard@example.com', 'password4', 'UHD', 'Pasadena', 'USA', 26),
('Raj_Koothrappali', 'raj@example.com', 'password5', 'HD', 'Pasadena', 'USA', 24),
('Barack_Obama', 'obama@example.com', 'password6', 'HD', 'Chicago', 'USA', 25),
('Donald_Trump', 'trump@example.com', 'password7', 'UHD', 'New York', 'USA', 24),
('Mickey_Mouse', 'mickey@example.com', 'password8', 'HD', 'Disneyland', 'USA', 20),
('Donald_Duck', 'donald@example.com', 'password9', 'UHD', 'Duckburg', 'USA', 22),
('Batman', 'batman@example.com', 'password10', 'HD', 'Gotham', 'USA', 41),
('Superman', 'superman@example.com', 'password11', 'UHD', 'Metropolis', 'USA', 29),
('Wonder_Woman', 'wonder@example.com', 'password12', 'HD', 'Themyscira', 'Greece', 22),
('Iron_Man', 'ironman@example.com', 'password13', 'HD', 'Malibu', 'USA', 45),
('Captain_America', 'cap@example.com', 'password14', 'UHD', 'Brooklyn', 'USA', 34),
('Thor', 'thor@example.com', 'password15', 'UHD', 'Asgard', 'Norway', 33);

-- Insert data into UserSubscriptions table
INSERT INTO UserSubscriptions (User_ID, SubscriptionPlanName, SubscriptionPrice, SubscriptionDuration) VALUES
(1, 'HD', 9.99, 1),
(2, 'HD', 9.99, 1),
(3, 'UHD', 14.99, 1),
(4, 'UHD', 14.99, 1),
(5, 'HD', 9.99, 1),
(6, 'HD', 9.99, 1),
(7, 'UHD', 14.99, 1),
(8, 'HD', 9.99, 1),
(9, 'UHD', 14.99, 1),
(10, 'HD', 9.99, 1),
(11, 'UHD', 14.99, 1),
(12, 'HD', 9.99, 1),
(13, 'HD', 9.99, 1),
(14, 'UHD', 14.99, 1),
(15, 'UHD', 14.99, 1);

-- Insert data into Films table
INSERT INTO Films (Film_ID, FilmTitle, FilmGenre, FilmReleaseDate) VALUES
(1, 'Stranger Things', 'Sci-Fi', '2016-07-15'),
(2, 'Breaking Bad', 'Drama', '2008-01-20'),
(3, 'The Office', 'Comedy', '2005-03-24'),
(4, 'Parks and Recreation', 'Comedy', '2009-04-09'),
(5, 'The Godfather', 'Crime', '1972-03-24'),
(6, 'Inception', 'Sci-Fi', '2010-07-16'),
(7, 'The Dark Knight', 'Action', '2008-07-18'),
(8, 'Pulp Fiction', 'Crime', '1994-10-14'),
(9, 'Schindler''s List', 'Drama', '1993-12-15'),
(10, 'Forrest Gump', 'Drama', '1994-07-06'),
(11, 'Titanic', 'Drama', '1997-12-19'),
(12, 'Django Unchained', 'Western', '2012-12-25'),
(13, 'The Revenant', 'Adventure', '2015-12-25'),
(14, 'Superbad', 'Comedy', '2007-08-17'),
(15, 'Superman', 'Action', '1978-12-15'),
(16, 'Goodfellas', 'Crime', '1990-09-19'),
(17, 'Jaws', 'Thriller', '1975-06-20'),
(18, 'Taxi Driver', 'Drama', '1976-02-08'),
(19, 'Rocky', 'Drama', '1976-11-21'),
(20, 'The Shining', 'Horror', '1980-05-23'),
(21, 'Die Hard', 'Action', '1988-07-15'),
(22, 'No Country for Old Men', 'Thriller', '2007-11-09'),
(23, 'Batman Begins', 'Action', '2005-06-15'),
(24, 'Taken', 'Action', '2008-02-27'),
(25, 'Clash of the Titans', 'Fantasy', '2010-04-02');

-- Insert data into FilmActors table
INSERT INTO FilmActors (Actor_ID, ActorName, ActorCity, ActorDOB) VALUES
(1, 'Millie Bobby Brown', 'Los Angeles', '2004-02-19'),
(2, 'Bryan Cranston', 'Hollywood', '1956-03-07'),
(3, 'Winona Ryder', 'New York', '1971-10-29'),
(4, 'Aaron Paul', 'Boise', '1979-08-27'),
(5, 'David Harbour', 'White Plains', '1975-04-10'),
(6, 'Leonardo DiCaprio', 'Los Angeles', '1974-11-11'),
(7, 'Marlon Brando', 'Omaha', '1924-04-03'),
(8, 'Christian Bale', 'Haverfordwest', '1974-01-30'),
(9, 'John Travolta', 'Englewood', '1954-02-18'),
(10, 'Liam Neeson', 'Ballymena', '1952-06-07');

-- Insert data into FilmReviews table
INSERT INTO FilmReviews (User_ID, Film_ID, ReviewScore, ReviewComment) VALUES
(1, 1, 5, 'Amazing show!'),
(2, 2, 3, 'Good show'),
(3, 3, 4, 'Funny and smart'),
(4, 4, 2, 'Not my taste'),
(5, 5, 5, 'A classic!'),
(6, 6, 4, 'Mind-bending!'),
(7, 7, 5, 'Excellent action.'),
(8, 8, 3, 'Very entertaining.'),
(9, 9, 5, 'Very moving.'),
(10, 10, 4, 'Heartwarming story.');

-- Insert data into FavoriteFilms table
INSERT INTO FavoriteFilms (User_ID, Film_ID, FavoriteScore) VALUES
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

-- Insert data into FilmCast table
INSERT INTO FilmCast (Film_ID, Actor_ID, FilmRole) VALUES
(1, 1, 'Eleven'),
(2, 2, 'Walter White'),
(3, 3, 'Joyce Byers'),
(4, 4, 'Jesse Pinkman'),
(5, 5, 'Jim Hopper'),
(6, 6, 'Cobb'),
(7, 7, 'Don Vito Corleone'),
(8, 8, 'Bruce Wayne'),
(9, 9, 'Vincent Vega'),
(10, 10, 'Oskar Schindler'),
(11, 6, 'Jack Dawson'),
(12, 6, 'Calvin Candie'),
(13, 6, 'Hugh Glass'),
(14, 8, 'Patrick Bateman'),
(15, 8, 'Bruce Wayne'),
(16, 8, 'Alfred Borden'),
(17, 7, 'Vito Corleone'),
(18, 7, 'Terry Malloy'),
(19, 7, 'Stanley Kowalski'),
(20, 9, 'John McClane'),
(21, 9, 'John McClane'),
(22, 9, 'Sheriff Bell'),
(23, 10, 'Ras Al Ghul'),
(24, 10, 'Bryan Mills'),
(25, 10, 'Zeus');

-- Insert data into ViewingHistory table
INSERT INTO ViewingHistory (User_ID, Film_ID, ViewingDate) VALUES
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
