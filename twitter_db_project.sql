-- initlize the database

CREATE DATABASE TwitterDB;

USE TwitterDB;

-- create the users table

CREATE TABLE users (
	user_id				INT			PRIMARY KEY 		AUTO_INCREMENT,
	username			VARCHAR(45)		NOT NULL		UNIQUE,
	email				VARCHAR(45)		NOT NULL,
    	password_hash			BINARY(64)		NOT NULL,
    	created_at			DATETIME		NOT NULL		DEFAULT CURRENT_TIMESTAMP
   );


-- create the user profiles table

CREATE TABLE profiles (
	profile_id			INT 			PRIMARY KEY 		AUTO_INCREMENT,
	user_id				INT			NOT NULL		UNIQUE,
	screen_name			VARCHAR(45)		NOT NULL,
    	profile_picture			BINARY,
	bio				VARCHAR(100),
    	total_following			INT 			NOT NULL 		DEFAULT 0,
   	total_followers			INT 			NOT NULL 		DEFAULT 0,
    
    	FOREIGN KEY (user_id) REFERENCES users(user_id)
   );


-- create the tweets table

CREATE TABLE tweets (
	tweet_id			INT 			PRIMARY KEY 		AUTO_INCREMENT,
	user_id				INT			NOT NULL,
	tweet_content			VARCHAR(255)		NOT NULL,
    	created_at			DATETIME		NOT NULL		DEFAULT CURRENT_TIMESTAMP,
    
    	FOREIGN KEY (user_id) REFERENCES users(user_id)
   );


/* create the table that stores 
	the users and likes relation */
    
CREATE TABLE tweets_likes (
	tweet_id			INT 			NOT NULL,
	user_id				INT			NOT NULL,

	PRIMARY KEY (tweet_id, user_id),
	FOREIGN KEY (tweet_id) REFERENCES tweets(tweet_id),
	FOREIGN KEY (user_id) REFERENCES users(user_id)
);
   
/* create the table that stores 
	the following relation */
    
CREATE TABLE users_followers (
	user_id				INT			NOT NULL,
	follower_id			INT 			NOT NULL,

	PRIMARY KEY (user_id, follower_id),
	FOREIGN KEY (user_id) REFERENCES users(user_id),
	FOREIGN KEY (follower_id) REFERENCES users(user_id)
);


/* a stored procedure that takes in new user info
	and creates a new user and profile record */

DELIMITER //
CREATE PROCEDURE create_account(
	username 			VARCHAR(45),
    	email				VARCHAR(45),
    	password			VARCHAR(45),
    	profile_name			VARCHAR(45),
    	profile_picture			BINARY, 
    	bio				VARCHAR(100)
    )
    
BEGIN 
	DECLARE new_user_id INT;
    
	INSERT INTO users (username, email, password_hash, created_at)
    	VALUES (username, email, MD5(password), curdate());
	
    	SET new_user_id = LAST_INSERT_ID();
    
    	INSERT INTO profiles (user_id, screen_name, profile_picture, bio)
    	VALUES (new_user_id, profile_name, profile_picture, bio);
END;


/* create new users */

CALL create_account('ahmed52387492', 'ahmed@email.com', 'PASSWORD123', 'Ahmad', '0', 'entrepreneur, loves football');
CALL create_account('dania_kitty', 'dania@email.com', 'verryStrongpass1234', 'Dania', '0', 'i <3 cats');
CALL create_account('khalid_a', 'khalid@email.com', 'mypasswordispassword', 'KHALID', '0', 'passionate twitter expert');
CALL create_account('its_shahad', 'shahad@email.com', '1234567', 'SH', '0', 'gamer');
CALL create_account('abdullah123', 'abdullah@email.com', 'qwerty1234', 'Abdullah', '0', 'ceo of everything');


/* insert tweets for users */ 

INSERT INTO tweets (user_id, tweet_content)
VALUES (1, "Lorem ipsum dolor sit amet, consectetur adipiscing elit."),
(1, "Donec gravida justo vitae erat euismod, sit amet maximus felis euismod."),
(2, "Vestibulum eget turpis elementum, placerat sapien ac, tempus metus."),
(2, "Aliquam sagittis purus id orci fringilla suscipit."),
(3, "In commodo mi nec magna condimentum, id mattis augue suscipit."),
(4, "Fusce sed ligula ac enim vehicula laoreet."),
(5, "Ut sit amet nisi ut mi tincidunt eleifend ac et est."),
(5, "Vestibulum in nisl id eros interdum feugiat vel quis sapien.");

/* add likes to some tweets */

INSERT INTO tweets_likes (tweet_id, user_id)
VALUES (15, 2), (16, 5), (17, 4),
(17, 1), (15, 5), (16, 3);

/* view results */

SELECT * FROM users;
SELECT * FROM profiles;
SELECT * FROM tweets;
SELECT * FROM tweets_likes;


/* a stored procedure that takes in two usernames
	and make them follow each other */
   
DELIMITER //
CREATE PROCEDURE user_follow(
	follower_user		VARCHAR(45),
    	followed_user		VARCHAR(45)
    )
    
BEGIN 
	DECLARE follower_user_id INT;
    	DECLARE followed_user_id INT;
    
    /* retrive the ids of the usernames and 
    store them in the declared variables */
    
    SELECT user_id INTO follower_user_id FROM users WHERE username = follower_user;
    SELECT user_id INTO followed_user_id FROM users WHERE username = followed_user;

    INSERT INTO users_followers (user_id, follower_id)
    VALUES (followed_user_id, follower_user_id);
	
    /* increment the follower count on 
		the followed user profile */
        
    UPDATE profiles 
    SET total_followers = total_followers + 1
    WHERE user_id = followed_user_id;
    
     /* increment the following count on 
		the follower user profile */
        
    UPDATE profiles 
    SET total_following = total_following + 1
    WHERE user_id = follower_user_id;
    
END;


CALL user_follow('khalid_a', 'its_shahad');
CALL user_follow('dania_kitty', 'its_shahad');
CALL user_follow('ahmed52387492', 'abdullah123');


SELECT * FROM users_followers ;
SELECT * FROM profiles;


/* a query that retrives the number of tweets
	for the user "khalid_a" */

 SELECT COUNT(*) AS " Number of tweets"
 FROM users
 INNER JOIN tweets ON tweets.user_id = users.user_id
 WHERE username = "khalid_a";
   
