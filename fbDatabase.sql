DROP DATABASE IF EXISTS facebook
CREATE DATABASE Facebook

\c apis1_assignment;


CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  name VARCHAR NOT NULL,
  age INT NOT NULL
);

CREATE TABLE posts (
  id SERIAL PRIMARY KEY,
  poster_id INT REFERENCES users(id),
  body TEXT NOT NULL);

CREATE TABLE likes (
  id SERIAL PRIMARY KEY,
  liker_id INT REFERENCES users(id),
  poster_id INT REFERENCES posts(id)
);

CREATE TABLE comments (
  id SERIAL PRIMARY KEY,
  commenter_id INT REFERENCES users(id),
  post_id INT REFERENCES posts(id),
  body TEXT NOT NULL
);

CREATE TABLE albums (
  id SERIAL PRIMARY KEY,
  user_id INT REFERENCES users(id)
);

CREATE TABLE pictures (
  id SERIAL PRIMARY KEY,
  album_id INT REFERENCES album(id),
  url VARCHAR NOT NULL
);

INSERT INTO users (name, age) VALUES
  ("Victoria Adams", 47), ("Gerson Lopez", 33);

INSERT INTO posts (poster_id, body) VALUES
  (1, 'Hicka bicka boo'), (2, 'Hoo-sha');

INSERT INTO likes (user_id, post_id) VALUES
  (1, 1), (2, 2);

INSERT INTO comments (commenter_id, post_id, body) VALUES
  (1, 1, 'Random comment 1.'), (2, 2, 'Random comment 2.');

INSERT INTO albums (user_id) VALUES
  (1), (2);

INSERT INTO pictures (album_id, url) VALUES
  (1, 'http://apicture.com'), (2, 'http://apictureagain.com');
