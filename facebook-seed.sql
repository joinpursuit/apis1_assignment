DROP DATABASE IF EXISTS face_book;
CREATE DATABASE face_book;

\c face_book;

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
  comment_id INT REFERENCES users(id),
  post_id INT REFERENCES posts(id),
  body VARCHAR NOT NULL
);

CREATE TABLE albums (
  id SERIAL PRIMARY KEY,
  user_id INT REFERENCES users(id)
);

CREATE TABLE pictures (
  id SERIAL PRIMARY KEY,
  album_id INT REFERENCES albums(id),
  url VARCHAR NOT NULL
);

INSERT INTO users (name, age) VALUES ('Victoria Adams', 47), ('Gerson Lopez', 33), ('Deyvi O', 100);

INSERT INTO posts (poster_id, body) VALUES (1, 'Hi, I''m not a pursuit staff'), (3, 'I am definitely a pusuit student');

INSERT INTO likes (liker_id, post_id) VALUES (2, 2), (3, 2);

INSERT INTO comments (comment_id, post_id, body) VALUES (3, 2, 'Yes I liked my own post');

INSERT INTO albums (user_id) VALUES (3);

INSERT INTO pictures (album_id, url) VALUES (1, 'https://proxy.duckduckgo.com/iu/?u=http%3A%2F%2Fi.imgur.com%2Fq1B12ii.png&f=1')
