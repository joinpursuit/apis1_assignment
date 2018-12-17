DROP DATABASE IF EXISTS bandleader;
CREATE DATABASE bandleader;

\c bandleader

DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS posts;
DROP TABLE IF EXISTS likes;
DROP TABLE IF EXISTS comments;
DROP TABLE IF EXISTS albums;
DROP TABLE IF EXISTS pictures;

CREATE TABLE users(
  id SERIAL PRIMARY KEY,
  username VARCHAR NOT NULL,
  instrument VARCHAR NOT NULL
);

CREATE TABLE posts(
  id SERIAL PRIMARY KEY,
  poster_id INT REFERENCES users(id) ON DELETE CASCADE,
  body VARCHAR NOT NULL,
);

CREATE TABLE likes(
  id SERIAL PRIMARY KEY,
  liker_id INT REFERENCES users(id) ON DELETE CASCADE,
  post_id INT REFERENCES posts(id) ON DELETE CASCADE
);

CREATE TABLE comments(
  id SERIAL PRIMARY KEY,
  commenter_id INT REFERENCES users(id) ON DELETE CASCADE,
  body VARCHAR NOT NULL,
  poster_id INT REFERENCES posts(id) ON DELETE CASCADE
);

CREATE TABLE albums(
  id SERIAL PRIMARY KEY,
  user_id INT REFERENCES users(id) ON DELETE CASCADE
);

CREATE TABLE pictures(
  id SERIAL PRIMARY KEY,
  img_url VARCHAR NOT NULL,
  album_id INT REFERENCES albums(id) ON DELETE CASCADE
);

INSERT INTO users(username,instrument)
VALUES ('Corey','guitar'), ('Reed','trumpet');
INSERT INTO comments(commenter_id, body, poster_id)
VALUES (1, 'what a great post, reed!', 2);
