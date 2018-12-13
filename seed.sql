DROP DATABASE IF EXISTS facebook_hw;
CREATE DATABASE facebook_hw;

\c facebook_hw;

CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  name VARCHAR NOT NULL,
  age INT NOT NULL
);

CREATE TABLE categories (
  id SERIAL PRIMARY KEY,
  name VARCHAR NOT NULL
);

CREATE TABLE products (
  id SERIAL PRIMARY KEY,
  name VARCHAR NOT NULL,
  price FLOAT NOT NULL,
  category_id INT REFERENCES categories(id)
);

CREATE TABLE orders (
  id SERIAL PRIMARY KEY,
  product_id INT REFERENCES products(id),
  user_id INT REFERENCES users(id)
);

CREATE TABLE reviews (
  id SERIAL PRIMARY KEY,
  product_id INT REFERENCES products(id),
  user_id INT REFERENCES users(id),
  rating INT NOT NULL,
  body TEXT NOT NULL
);

-- INSERT INTO users(name) VALUES ('johnsmith1234',10), ('marymarie2345',20);
--
-- INSERT INTO categories(name) VALUES ('root veggies'), ('tropical fruits'), ('organic'), ('poisoned');
--
-- INSERT INTO products(name, price, category_id) VALUES ('blueberries', 2.5, 3);
