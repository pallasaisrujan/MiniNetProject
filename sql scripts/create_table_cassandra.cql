-- Drop the keyspace if it exists
DROP KEYSPACE IF EXISTS mini_net;

-- Create the keyspace
CREATE KEYSPACE mini_net WITH replication = {'class': 'SimpleStrategy', 'replication_factor': '1'};

-- Use the keyspace
USE mini_net;

-- Drop the users table if it exists
DROP TABLE IF EXISTS users;

-- Create the users table
CREATE TABLE users (
    UserID int PRIMARY KEY,
    Username text,
    Email text,
    Password text,
    SubscriptionType text,
    City text,
    Country text,
    Age int
);

-- Insert data into the users table

INSERT INTO users (UserID, Username, Email, Password, SubscriptionType, City, Country, Age)
VALUES (1, 'john_doe', 'john@example.com', 'password1', 'HD', 'New York', 'USA', 28);

INSERT INTO users (UserID, Username, Email, Password, SubscriptionType, City, Country, Age)
VALUES (2, 'alice_smith', 'alice@example.com', 'password2', 'HD', 'Los Angeles', 'USA', 34);

INSERT INTO users (UserID, Username, Email, Password, SubscriptionType, City, Country, Age)
VALUES (3, 'jane_doe', 'jane@example.com', 'password3', 'UHD', 'Chicago', 'USA', 21);


INSERT INTO users (UserID, Username, Email, Password, SubscriptionType, City, Country, Age)
VALUES (4, 'bob_jones', 'bob@example.com', 'password4', 'UHD', 'London', 'UK', 30);

INSERT INTO users (UserID, Username, Email, Password, SubscriptionType, City, Country, Age)
VALUES (5, 'emma_johnson', 'emma@example.com', 'password5', 'HD', 'Manchester', 'UK', 25);

INSERT INTO users (UserID, Username, Email, Password, SubscriptionType, City, Country, Age)
VALUES (6, 'chris_evans', 'chris@example.com', 'password6', 'HD', 'Birmingham', 'UK', 35);


INSERT INTO users (UserID, Username, Email, Password, SubscriptionType, City, Country, Age)
VALUES (7, 'scarlett_johansson', 'scarlett@example.com', 'password7', 'UHD', 'Toronto', 'Canada', 29);

INSERT INTO users (UserID, Username, Email, Password, SubscriptionType, City, Country, Age)
VALUES (8, 'mark_ruffalo', 'mark@example.com', 'password8', 'HD', 'Vancouver', 'Canada', 40);

INSERT INTO users (UserID, Username, Email, Password, SubscriptionType, City, Country, Age)
VALUES (9, 'chris_hemsworth', 'chrish@example.com', 'password9', 'UHD', 'Montreal', 'Canada', 32);


INSERT INTO users (UserID, Username, Email, Password, SubscriptionType, City, Country, Age)
VALUES (10, 'robert_downey', 'robert@example.com', 'password10', 'HD', 'Cape Town', 'South Africa', 48);

INSERT INTO users (UserID, Username, Email, Password, SubscriptionType, City, Country, Age)
VALUES (11, 'john_smith', 'john.smith@example.com', 'password11', 'HD', 'Johannesburg', 'South Africa', 27);

INSERT INTO users (UserID, Username, Email, Password, SubscriptionType, City, Country, Age)
VALUES (12, 'alice_brown', 'alice.brown@example.com', 'password12', 'UHD', 'Durban', 'South Africa', 33);


INSERT INTO users (UserID, Username, Email, Password, SubscriptionType, City, Country, Age)
VALUES (13, 'jane_smith', 'jane.smith@example.com', 'password13', 'HD', 'Sydney', 'Australia', 26);

INSERT INTO users (UserID, Username, Email, Password, SubscriptionType, City, Country, Age)
VALUES (14, 'bob_brown', 'bob.brown@example.com', 'password14', 'UHD', 'Melbourne', 'Australia', 31);

INSERT INTO users (UserID, Username, Email, Password, SubscriptionType, City, Country, Age)
VALUES (15, 'emma_white', 'emma.white@example.com', 'password15', 'HD', 'Brisbane', 'Australia', 22);
