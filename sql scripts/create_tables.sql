-- Drop the database if it exists to start fresh
DROP DATABASE IF EXISTS mininet_db;
CREATE DATABASE mininet_db;
USE mininet_db;

-- Create the UserInfo table
CREATE TABLE UserInfo (
    User_ID INT AUTO_INCREMENT PRIMARY KEY,
    UserName VARCHAR(30) NOT NULL,
    UserEmail VARCHAR(50) NOT NULL,
    UserPassword VARCHAR(20) NOT NULL,
    UserSubscriptionType VARCHAR(20) NOT NULL,
    UserCity VARCHAR(30),
    UserCountry VARCHAR(30),
    UserAge INT
);

-- Create the UserSubscriptions table
CREATE TABLE UserSubscriptions (
    Subscription_ID INT AUTO_INCREMENT PRIMARY KEY,
    User_ID INT,
    SubscriptionPlanName VARCHAR(20) NOT NULL,
    SubscriptionPrice DECIMAL(5,2) NOT NULL,
    SubscriptionDuration INT NOT NULL,
    FOREIGN KEY (User_ID) REFERENCES UserInfo(User_ID)
);

-- Create the Films table
CREATE TABLE Films (
    Film_ID INT PRIMARY KEY,
    FilmTitle VARCHAR(100) NOT NULL,
    FilmGenre VARCHAR(30) NOT NULL,
    FilmReleaseDate DATE
);

-- Create the FilmActors table
CREATE TABLE FilmActors (
    Actor_ID INT PRIMARY KEY,
    ActorName VARCHAR(50) NOT NULL,
    ActorCity VARCHAR(30),
    ActorDOB DATE
);

-- Create the FilmReviews table
CREATE TABLE FilmReviews (
    Review_ID INT AUTO_INCREMENT PRIMARY KEY,
    User_ID INT,
    Film_ID INT,
    ReviewScore INT CHECK (ReviewScore BETWEEN 0 AND 5),
    ReviewComment VARCHAR(255),
    FOREIGN KEY (User_ID) REFERENCES UserInfo(User_ID),
    FOREIGN KEY (Film_ID) REFERENCES Films(Film_ID)
);

-- Create the FavoriteFilms table
CREATE TABLE FavoriteFilms (
    Favorite_ID INT AUTO_INCREMENT PRIMARY KEY,
    User_ID INT,
    Film_ID INT,
    FavoriteScore INT CHECK (FavoriteScore BETWEEN 0 AND 5),
    FOREIGN KEY (User_ID) REFERENCES UserInfo(User_ID),
    FOREIGN KEY (Film_ID) REFERENCES Films(Film_ID)
);

-- Create the FilmCast table
CREATE TABLE FilmCast (
    Film_ID INT,
    Actor_ID INT,
    FilmRole VARCHAR(50),
    PRIMARY KEY (Film_ID, Actor_ID),
    FOREIGN KEY (Film_ID) REFERENCES Films(Film_ID),
    FOREIGN KEY (Actor_ID) REFERENCES FilmActors(Actor_ID)
);

-- Create the ViewingHistory table
CREATE TABLE ViewingHistory (
    View_ID INT AUTO_INCREMENT PRIMARY KEY,
    User_ID INT,
    Film_ID INT,
    ViewingDate DATE,
    FOREIGN KEY (User_ID) REFERENCES UserInfo(User_ID),
    FOREIGN KEY (Film_ID) REFERENCES Films(Film_ID)
);
