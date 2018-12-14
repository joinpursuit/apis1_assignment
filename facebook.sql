DROP DATABASE IF EXISTS facebook;
CREATE DATABASE facebook;

\c facebook;

CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  name VARCHAR NOT NULL,
  age INT
);

CREATE TABLE posts (
  id SERIAL PRIMARY KEY,
  poster_id INT REFERENCES users(id),
  body VARCHAR NOT NULL
);

CREATE TABLE likes (
  id SERIAL PRIMARY KEY,
  liker_id INT REFERENCES users(id),
  posts_id INT REFERENCES posts(id)
);

CREATE TABLE comments (
  id SERIAL PRIMARY KEY,
  commenter_id INT REFERENCES users(id),
  posts_id INT REFERENCES posts(id),
  body VARCHAR NOT NULL
);

CREATE TABLE albums (
  id SERIAL PRIMARY KEY,
  user_id INT REFERENCES users(id),
);

CREATE TABLE pictures (
  id SERIAL PRIMARY KEY,
  album_id INT REFERENCES albums(id),
  url VARCHAR NOT NULL
);

INSERT INTO users(name, age) VALUES ('Jonelle Bain', 39), ('Zyon Maganga', 3), ('Irie Maganga', 1);

INSERT INTO posts(id, post) VALUES (1, 'Today is a great day!'), (2, 'We learned SQL!'), (3, 'I feel hungry!');
