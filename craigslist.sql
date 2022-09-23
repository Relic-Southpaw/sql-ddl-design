DROP DATABASE IF EXISTS craigslist;

CREATE DATABASE craigslist;

\c craigslist;

CREATE TABLE posts(
    id SERIAL PRIMARY KEY,
    title TEXT NOT NULL,
    user INT REFERENCES users ON DELETE CASCADE NOT NULL,
    category INT REFERENCES categories ON DELETE CASCADE NOT NULL
    post_location_id INT REFERENCES post_location ON DELETE CASCADE NOT NULL,
    post_region_id INT REFERENCES region ON DELETE CASCADE NOT NULL
);

CREATE TABLE users(
    id SERIAL PRIMARY KEY,
    username UNIQUE TEXT NOT NULL
    preferred_region INT REFERENCES region ON DELETE CASCADE NOT NULL
);

CREATE TABLE post_location(
    id SERIAL PRIMARY KEY,
    city TEXT NOT NULL,
    us_state TEXT,
    country TEXT NOT NULL
);

CREATE TABLE region( 
    id SERIAL PRIMARY KEY,
    region TEXT NOT NULL,
    continent TEXT NOT NULL
);

CREATE TABLE categories(
    id SERIAL PRIMARY KEY,
    category TEXT NOT NULL
);