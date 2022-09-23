-- from the terminal run:
-- psql < music.sql

DROP DATABASE IF EXISTS music;

CREATE DATABASE music;

\c music

-- CREATE TABLE songs
-- (
--   id SERIAL PRIMARY KEY,
--   title TEXT NOT NULL,
--   duration_in_seconds INTEGER NOT NULL,
--   release_date DATE NOT NULL,
--   artists TEXT[] NOT NULL,
--   album TEXT NOT NULL,
--   producers TEXT[] NOT NULL
-- );

-- INSERT INTO songs
--   (title, duration_in_seconds, release_date, artists, album, producers)
-- VALUES
--   ('MMMBop', 238, '04-15-1997', '{"Hanson"}', 'Middle of Nowhere', '{"Dust Brothers", "Stephen Lironi"}'),
--   ('Bohemian Rhapsody', 355, '10-31-1975', '{"Queen"}', 'A Night at the Opera', '{"Roy Thomas Baker"}'),
--   ('One Sweet Day', 282, '11-14-1995', '{"Mariah Cary", "Boyz II Men"}', 'Daydream', '{"Walter Afanasieff"}'),
--   ('Shallow', 216, '09-27-2018', '{"Lady Gaga", "Bradley Cooper"}', 'A Star Is Born', '{"Benjamin Rice"}'),
--   ('How You Remind Me', 223, '08-21-2001', '{"Nickelback"}', 'Silver Side Up', '{"Rick Parashar"}'),
--   ('New York State of Mind', 276, '10-20-2009', '{"Jay Z", "Alicia Keys"}', 'The Blueprint 3', '{"Al Shux"}'),
--   ('Dark Horse', 215, '12-17-2013', '{"Katy Perry", "Juicy J"}', 'Prism', '{"Max Martin", "Cirkut"}'),
--   ('Moves Like Jagger', 201, '06-21-2011', '{"Maroon 5", "Christina Aguilera"}', 'Hands All Over', '{"Shellback", "Benny Blanco"}'),
--   ('Complicated', 244, '05-14-2002', '{"Avril Lavigne"}', 'Let Go', '{"The Matrix"}'),
--   ('Say My Name', 240, '11-07-1999', '{"Destiny''s Child"}', 'The Writing''s on the Wall', '{"Darkchild"}');

CREATE TABLE artists(
  id SERIAL PRIMARY KEY,
  artist_name TEXT NOT NULL,
  artist_two TEXT,
  artist_three TEXT
);

CREATE TABLE producers(
  id SERIAL PRIMARY KEY,
  producer_name TEXT NOT NULL,
  producer_two TEXT,
  producer_three TEXT
);

CREATE TABLE albums(
  id SERIAL PRIMARY KEY,
  album TEXT NOT NULL,
  artist_id INT REFERENCES artists ON DELETE CASCADE,
  producer_id INT REFERENCES producers ON DELETE CASCADE
);

CREATE TABLE songs(
  id SERIAL PRIMARY KEY,
  title TEXT NOT NULL,
  duration_in_seconds INTEGER NOT NULL,
  release_date DATE NOT NULL,
  artist_id INT REFERENCES artists ON DELETE CASCADE,
  album_id INT REFERENCES albums ON DELETE CASCADE,
  producer_id INT REFERENCES producers ON DELETE CASCADE
);

INSERT INTO artists
  (artist_name, artist_two, artist_three)
VALUES
  ('Hanson'),
  ('Queen'),
  ('Mariah Cary', 'Boyz II Men'),
  ('Lady Gaga', 'Bradley Cooper'),
  ('Nickelback'),
  ('Jay Z', 'Alicia Keys'),
  ('Katy Perry', 'Juicy J'),
  ('Maroon 5', 'Christina Aguilera'),
  ('Avril Lavigne'),
  ('Destiny''s Child');

INSERT INTO producers
  (producer_name, producer_two, producer_three)
VALUES
  ('Dust Brothers', 'Stephen Lironi'),
  ('Roy Thomas Baker'),
  ('Walter Afanasieff'),
  ('Benjamin Rice'),
  ('Rick Parashar'),
  ('Al Shux'),
  ('Max Martin', 'Cirkut'),
  ('Shellback', 'Benny Blanco'),
  ('The Matrix'),
  ('Darkchild');

INSERT INTO albums
  (album, artist_id, producer_id)
VALUES
  ('Middle of Nowhere',1,1),
  ('A Night at the Opera',2,2),
  ('Daydream',3,3),
  ('A Star Is Born',4,4),
  ('Silver Side Up',5,5),
  ('The Blueprint 3',6,6),
  ('Prism',7,7),
  ('Hands All Over',8,8),
  ('Let Go',9,9),
  ('The Writing''s on the Wall',10,10);

INSERT INTO songs
  (title, duration_in_seconds, release_date, artist_id, album_id, producer_id)
VALUES
  ('MMMBop', 238, '04-15-1997', 1, 1, 1),
  ('Bohemian Rhapsody', 355, '10-31-1975', 2, 2, 2),
  ('One Sweet Day', 282, '11-14-1995', 3, 3, 3),
  ('Shallow', 216, '09-27-2018', 4, 4, 4),
  ('How You Remind Me', 223, '08-21-2001', 5, 5, 5),
  ('New York State of Mind', 276, '10-20-2009', 6, 6, 6),
  ('Dark Horse', 276, '10-20-2009', 7, 7, 7),
  ('Moves Like Jagger', 8, 8, 8),
  ('Complicated', 9, 9, 9),
  ('Say My Name', 10, 10, 10);