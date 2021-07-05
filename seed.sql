DROP DATABASE IF EXISTS apis1_assignment
CREATE DATABASE apis1_assignment

\c apis1_assignment

DROP TABLE IF EXISTS users
DROP TABLE IF EXISTS posts
DROP TABLE IF EXISTS likes
DROP TABLE IF EXISTS comments
DROP TABLE IF EXISTS albums
DROP TABLE IF EXISTS pictures

CREATE TABLE users(
  id SERIAL PRIMARY KEY,
  name VARCHAR NOT NULL,
  age INT
);

CREATE TABLE posts(
  id SERIAL PRIMARY KEY,
  poster_id INT REFERENCES users(id) ON DELETE CASCADE,
  body VARCHAR NOT NULL
);

CREATE TABLE likes(
  id SERIAL PRIMARY KEY,
  liker_id INT REFERENCES users(id) ON DELETE CASCADE,
  post_id INT REFERENCES posts(id) ON DELETE CASCADE
);

CREATE TABLE comments(
  id SERIAL PRIMARY KEY,
  commenter_id INT REFERENCES users(id) ON DELETE CASCADE,
  post_id INT REFERENCES posts(id) ON DELETE CASCADE,
  body VARCHAR NOT NULL
);

CREATE TABLE albums(
  id SERIAL PRIMARY KEY,
  user_id INT REFERENCES users(id) ON DELETE CASCADE
);

CREATE TABLE pictures(
  id SERIAL PRIMARY KEY,
  album_id INT REFERRENCES albums(id) ON DELETE CASCADE,
  url VARCHAR NOT NULL
);


INSERT INTO users(name, age)
VALUES('Michell', 25), ('James', 12), ('Tommy', 17)

INSERT INTO posts(poster_id, body)
VALUES(1, 'Welcome'), (2, 'To this'), (3, 'Cool thing')

INSERT INTO likes(liker_id, post_id)
VALUES(2, 1), (3, 2), (1, 3)

INSERT INTO comments(commenter_id, post_id, body)
VALUES(3, 1, 'A comment'), (3, 2, 'Another comment'), (1, 3, 'Wow ANOTHER comment?')

INSERT INTO albums(user_id)
VALUES(1), (2), (3)

INSERT INTO pictures(album_id, url)
VALUES(1, 'www.picture1.com'), (2, 'www.picture2.com'), (3, 'www.picture3.com')
