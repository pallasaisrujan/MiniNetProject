-- Drop existing tables to avoid conflicts
DROP TABLE IF EXISTS WatchHistory;
DROP TABLE IF EXISTS MovieActor;
DROP TABLE IF EXISTS FavoriteMovie;
DROP TABLE IF EXISTS Review;
DROP TABLE IF EXISTS Actor;
DROP TABLE IF EXISTS Movie;
DROP TABLE IF EXISTS Subscription;
DROP TABLE IF EXISTS User;

-- Create the User table
CREATE TABLE User (
    UserID INT AUTO_INCREMENT PRIMARY KEY,
    Username VARCHAR(30) NOT NULL,
    Email VARCHAR(50) NOT NULL,
    Password VARCHAR(20) NOT NULL,
    SubscriptionType VARCHAR(20) NOT NULL,
    City VARCHAR(30),
    Country VARCHAR(30),
    Age INT
);

-- Create the Subscription table
CREATE TABLE Subscription (
    SubscriptionID INT AUTO_INCREMENT PRIMARY KEY,
    UserID INT,
    PlanName VARCHAR(20) NOT NULL,
    Price DECIMAL(5,2) NOT NULL,
    Duration INT NOT NULL,
    FOREIGN KEY (UserID) REFERENCES User(UserID)
);

-- Create the Movie table
CREATE TABLE Movie (
    MovieID INT PRIMARY KEY,
    Title VARCHAR(100) NOT NULL,
    Genre VARCHAR(30) NOT NULL,
    ReleaseDate DATE
);

-- Create the Actor table
CREATE TABLE Actor (
    ActorID INT PRIMARY KEY,
    Name VARCHAR(50) NOT NULL,
    City VARCHAR(30),
    DateOfBirth DATE
);

-- Create the Review table
CREATE TABLE Review (
    ReviewID INT AUTO_INCREMENT PRIMARY KEY,
    UserID INT,
    MovieID INT,
    Score INT CHECK (Score BETWEEN 0 AND 5),
    Comment VARCHAR(255),
    FOREIGN KEY (UserID) REFERENCES User(UserID),
    FOREIGN KEY (MovieID) REFERENCES Movie(MovieID)
);

-- Create the FavoriteMovie table
CREATE TABLE FavoriteMovie (
    FavoriteID INT AUTO_INCREMENT PRIMARY KEY,
    UserID INT,
    MovieID INT,
    Score INT CHECK (Score BETWEEN 0 AND 5),
    FOREIGN KEY (UserID) REFERENCES User(UserID),
    FOREIGN KEY (MovieID) REFERENCES Movie(MovieID)
);

-- Create the MovieActor table
CREATE TABLE MovieActor (
    MovieID INT,
    ActorID INT,
    Role VARCHAR(50),
    PRIMARY KEY (MovieID, ActorID),
    FOREIGN KEY (MovieID) REFERENCES Movie(MovieID),
    FOREIGN KEY (ActorID) REFERENCES Actor(ActorID)
);

-- Create the WatchHistory table
CREATE TABLE WatchHistory (
    WatchID INT AUTO_INCREMENT PRIMARY KEY,
    UserID INT,
    MovieID INT,
    WatchDate DATE,
    FOREIGN KEY (UserID) REFERENCES User(UserID),
    FOREIGN KEY (MovieID) REFERENCES Movie(MovieID)
);