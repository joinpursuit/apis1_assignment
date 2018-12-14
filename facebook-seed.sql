DROP DATABASE IF EXISTS facebook_database;
CREATE DATABASE facebook_database;

\c facebook_database;

CREATE TABLE users (
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

CREATE TABLE comments (
    id SERIAL PRIMARY KEY,
    commentor_id INT REFERENCES users(id),
    post_id INT REFERENCES posts(id),
    body TEXT NOT NULL
);

CREATE TABLE albums (
    id SERIAL PRIMARY KEY,
    user_id INT REFERENCES users(id)
);

CREATE TABLE PICTURES (
    id SERIAL PRIMARY KEY,
    album_id INT REFERENCES albums(id),
    url VARCHAR NOT NULL
);

INSERT INTO users (name, age) VALUES ('Victoria Adams', 47), ('Gerson Lopez', 33);

INSERT INTO posts (poster_id, body) VALUES ('1', 'hello world!'), ('2', 'goodbye world!');