DROP DATABASE IF EXISTS
CREATE DATABASE

\c

CREATE TABLE users(
  id INT PRIMARY KEY,
  name VARCHAR NOT NULL,
  age INT NOT NULL
)

CREATE TABLE posts (
  id
  poster_id
  body
)

CREATE TABLE likes (
  id
  liker_id
  post_id
)

CREATE TABLE comments (
  id
  commenter_id
  post_id
  body
)

CREATE TABLE albums (
  id
  user_id
)

CREATE TABLE pictures(
  id
  album_id
  url
)
