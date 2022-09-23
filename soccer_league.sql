DROP DATABASE IF EXISTS soccer_league;

CREATE DATABASE soccer_league;

\c soccer_league;

CREATE TABLE teams(
    id SERIAL PRIMARY KEY,
    team_name TEXT NOT NULL
);

CREATE TABLE goals(
    id SERIAL PRIMARY KEY,
    player_id INT NOT NULL REFERENCES players ON DELETE CASCADE,
    team_id INT NOT NULL REFERENCES teams ON DELETE CASCADE,
    game_id INT NOT NULL REFERENCES games ON DELETE CASCADE
);

CREATE TABLE players(
    id SERIAL PRIMARY KEY,
    player_name TEXT NOT NULL,
    player_team_id INT REFERENCES teams ON DELETE CASCADE
);

CREATE TABLE league(
    id SERIAL PRIMARY KEY,
    city TEXT NOT NULL,
    us_state TEXT,
    country TEXT NOT NULL
);

CREATE TABLE referees(
    id SERIAL PRIMARY KEY,
    ref_name TEXT NOT NULL
);

CREATE TABLE season_start_end(
    id SERIAL PRIMARY KEY,
    season_start DATE,
    season_end DATE
);

CREATE TABLE games(
    id SERIAL PRIMARY KEY,
    home_id INT NOT NULL REFERENCES teams ON DELETE CASCADE,
    away_id INT NOT NULL REFERENCES teams ON DELETE CASCADE,
    home_win BOOLEAN NOT NULL,
    season_id INT NOT NULL REFERENCES season_start_end ON DELETE CASCADE,
    game_date DATE NOT NULL,
    referee_id INT NOT NULL REFERENCES referees ON DELETE CASCADE
);