-- Create the users table
CREATE TABLE users (
  user_id INT PRIMARY KEY AUTO_INCREMENT,
  username VARCHAR(50) NOT NULL UNIQUE,
  email VARCHAR(100) NOT NULL UNIQUE,
  password_hash VARCHAR(255) NOT NULL,
  registration_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create the authors table
CREATE TABLE authors (
  author_id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(100) NOT NULL,
  email VARCHAR(100) NOT NULL UNIQUE,
  bio TEXT
);

-- Create the videos table
CREATE TABLE videos (
  video_id INT PRIMARY KEY AUTO_INCREMENT,
  title VARCHAR(100) NOT NULL,
  description TEXT,
  duration INT,
  upload_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  file_path VARCHAR(255) NOT NULL,
  author_id INT,
  FOREIGN KEY (author_id) REFERENCES authors(author_id)
  -- One-to-Many relationship between Authors and Videos
  -- Each author can have multiple videos, but each video belongs to only one author
);

-- Create the contributors table
CREATE TABLE contributors (
  contributor_id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(100) NOT NULL,
  email VARCHAR(100) NOT NULL,
  role VARCHAR(50)
);

-- Create the video_contributors table (associative table)
CREATE TABLE video_contributors (
  video_id INT,
  contributor_id INT,
  PRIMARY KEY (video_id, contributor_id),
  FOREIGN KEY (video_id) REFERENCES videos(video_id),
  FOREIGN KEY (contributor_id) REFERENCES contributors(contributor_id)
  -- Many-to-Many relationship between Videos and Contributors
  -- Each video can have multiple contributors, and each contributor can be associated with multiple videos
);

-- Create the comments table
CREATE TABLE comments (
  comment_id INT PRIMARY KEY AUTO_INCREMENT,
  user_id INT,
  video_id INT,
  comment_text TEXT NOT NULL,
  timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (user_id) REFERENCES users(user_id),
  FOREIGN KEY (video_id) REFERENCES videos(video_id)
  -- One-to-Many relationship between Videos and Comments
  -- Each video can have multiple comments, but each comment belongs to only one video
  -- One-to-Many relationship between Users and Comments
  -- Each user can post multiple comments, but each comment is posted by only one user
);

-- Create the reviews table
CREATE TABLE reviews (
  review_id INT PRIMARY KEY AUTO_INCREMENT,
  user_id INT,
  video_id INT,
  rating INT CHECK (rating BETWEEN 1 AND 5),
  review_text TEXT,
  timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (user_id) REFERENCES users(user_id),
  FOREIGN KEY (video_id) REFERENCES videos(video_id)
  -- One-to-Many relationship between Videos and Reviews
  -- Each video can have multiple reviews, but each review belongs to only one video
  -- One-to-Many relationship between Users and Reviews
  -- Each user can post multiple reviews, but each review is posted by only one user
);