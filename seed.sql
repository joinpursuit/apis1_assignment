DROP DATABASE IF EXISTS fb_app;
CREATE DATABASE fb_app;

\c fb_app;

CREATE TABLE users(
id SERIAL PRIMARY KEY,
name VARCHAR NOT NULL,
age INT NOT NULL
);

CREATE TABLE posts (
  id SERIAL PRIMARY KEY,
  poster_id INT REFERENCES users(id),
  body TEXT NOT NULL
);

CREATE TABLE likes (
  id SERIAL PRIMARY KEY,
  liker_id INT REFERENCES users(id),
  post_id INT REFERENCES posts(id)
);

CREATE TABLE comments(
  id SERIAL PRIMARY KEY,
  commenter_id INT REFERENCES users(id),
  post_id INT REFERENCES posts(id),
  body TEXT NOT NULL
);

CREATE TABLE albums (
  id SERIAL PRIMARY KEY,
  album_id INT REFERENCES users(id)
);

CREATE TABLE pictures (
  id SERIAL PRIMARY KEY,
  album_id INT REFERENCES albums(id),
  url TEXT NOT NULL
);

INSERT INTO users(name, age)
VALUES ('Channing Tyner', 107);


INSERT INTO users(name, age)
VALUES ('Muna Sharma', 75);


INSERT INTO users(name, age)
VALUES ('Lena Sharma', 47);
