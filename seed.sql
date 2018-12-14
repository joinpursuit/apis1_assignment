DROP DATABASE IF EXISTS FBDB;
CREATE DATABASE FBDB;

\c FBDB;

CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  name VARCHAR NOT NULL,
  age INT NOT NULL
);

CREATE TABLE posts (
  id SERIAL PRIMARY KEY,
  poster_id INT REFERENCES users(id),
  body VARCHAR NOT NULL
);

CREATE TABLE likes (
  id SERIAL PRIMARY KEY,
  liker_id INT REFERENCES users(id),
  post_id INT REFERENCES posts(id)

);

CREATE TABLE comments (
  id SERIAL PRIMARY KEY,
  commernter_id INT REFERENCES users(id),
  post_id INT REFERENCES posts(id),
  body VARCHAR NOT NULL
);

CREATE TABLE albums (
  id SERIAL PRIMARY KEY,
  user_id INT REFERENCES user(id)
);

CREATE TABLE pictures (
  id SERIAL PRIMARY KEY,
  album_id INT REFERENCES albums(id),
  url VARCHAR NOT NULL
);

INSERT INTO users (name, age) VALUES ("Victoria Adams", 47), ("Gerson Lopez", 33);
