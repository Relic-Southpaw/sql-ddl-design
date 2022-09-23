-- from the terminal run:
-- psql < air_traffic.sql

DROP DATABASE IF EXISTS air_traffic;

CREATE DATABASE air_traffic;

\c air_traffic

-- REWRITING THIS TABLE TO BREAK IT DOWN MORE FUNCTIONALLY

  -- CREATE TABLE tickets
  -- (
  --   id SERIAL PRIMARY KEY,
  --   first_name TEXT NOT NULL,
  --   last_name TEXT NOT NULL,
  --   seat TEXT NOT NULL,
  --   departure TIMESTAMP NOT NULL,
  --   arrival TIMESTAMP NOT NULL,
  --   airline TEXT NOT NULL,
  --   from_city TEXT NOT NULL,
  --   from_country TEXT NOT NULL,
  --   to_city TEXT NOT NULL,
  --   to_country TEXT NOT NULL
  -- );

CREATE TABLE airlines(
  id SERIAL PRIMARY KEY,
  airline NAME NOT NULL
);

  CREATE TABLE tickets
  (
    id SERIAL PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    flight_id INT NOT NULL REFERENCES flights ON DELETE CASCADE,
  );

CREATE TABLE airports(
  id SERIAL PRIMARY KEY,
  city_name TEXT NOT NULL,
  country_name TEXT NOT NULL
);

CREATE TABLE flights(
  id SERIAL PRIMARY KEY,
  departure TIMESTAMP NOT NULL,
  arrival TIMESTAMP NOT NULL,
  airline_id INT NOT NULL REFERENCES airlines ON DELETE CASCADE,
  from_airport_id INT NOT NULL REFERENCES airports ON DELETE CASCADE,
  to_airport_id INT NOT NULL REFERENCES airports ON DELETE CASCADE,
  seat TEXT UNIQUE NOT NULL
);

INSERT INTO airlines
  (airline)
VALUES
  ('United'),
  ('British Airways'),
  ('Delta'),
  ('TUI Fly Belgium'),
  ('Air China'),
  ('American Airlines'),
  ('Avianca Brasil');

INSERT INTO airports
(city_name, country_name)
VALUES
  ('Seattle', 'United States'),
  ('Washington DC', 'United States'),
  ('London', 'United Kingdom'),
  ('Tokyo', 'Japan'),
  ('Las Vegas', 'United States'),
  ('Los Angeles', 'United States'),
  ('Mexico City', 'Mexico'),
  ('Casablanca', 'Morocco'),
  ('Paris', 'France'),
  ('Beijing', 'China'),
  ('Dubai', 'UAE'),
  ('Charlotte', 'United States'),
  ('New York', 'United States'),
  ('Chicago', 'United States'),
  ('Cedar Rapids', 'United States'),
  ('New Orleans', 'United States'),
  ('Santiago', 'Chile');

INSERT INTO flights
  (departure, arrival, airline_id, from_airport_id, to_airport_id, seat)
VALUES
  ('2018-04-08 09:00:00', '2018-04-08 12:00:00', 1, 1, 2, '33B'),
  ('2018-12-19 12:45:00', '2018-12-19 16:15:00', 2, 3, 4, '8A'),
  ('2018-01-02 07:00:00', '2018-01-02 08:03:00', 3, 5, 6, '12F'),
  ('2018-04-15 16:50:00', '2018-04-15 21:00:00', 2, 1, 7, '20A'),
  ('2018-08-01 18:30:00', '2018-08-01 21:50:00', 1, 8, 9, '23D'),
  ('2018-10-31 01:15:00', '2018-10-31 12:55:00', 5, 10, 11, '18C'),
  ('2019-02-06 06:00:00', '2019-02-06 07:47:00', 4, 12, 13, '9E'),
  ('2018-12-22 14:42:00', '2018-12-22 15:56:00', 6, 14, 15, '1A'),
  ('2019-02-06 16:28:00', '2019-02-06 19:18:00', 6, 13, 16, '32B'),
  ('2019-01-20 19:30:00', '2019-01-20 22:45:00', 7, 1, 17, '10D');
INSERT INTO tickets
  (first_name, last_name, flight_id)
VALUES
  ('Jennifer', 'Finch', 1),
  ('Thadeus', 'Gathercoal', 2),
  ('Sonja', 'Pauley', '12F', 3),
  ('Jennifer', 'Finch', '20A', 4),
  ('Waneta', 'Skeleton', '23D', 5),
  ('Thadeus', 'Gathercoal', '18C', 6),
  ('Berkie', 'Wycliff', '9E', 7),
  ('Alvin', 'Leathes', '1A', 8),
  ('Berkie', 'Wycliff', '32B', 9),
  ('Cory', 'Squibbes', '10D', 10);