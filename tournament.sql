-- Table definitions for the tournament project. 
-- 
-- Put your SQL 'create table' statements in this file; also 'create view' 
-- statements if you choose to use it. 
-- 
-- You can write comments in this file by starting them with two dashes, like 
-- these lines here. 
\c tournament;

CREATE TABLE players 
             ( 
                          id SERIAL PRIMARY KEY, 
                          NAME TEXT 
             ); 

--create table score (ID serial references players(id), Player text, Opponent 
-- text, Win/Loss text) 
--create table matches (Round int, Match_Number int, 
-- Player1_ID serial references players(ID), 
-- Player1_Name text references players(Name), 
-- Player2_ID serial references players(ID), 
-- Players2_Name text references players(Name), 
-- Winner text, primary key (Round, Match_Number)); 
-- create table matches (Round int, Match_Number int, 
-- Player1_ID serial references players(ID), 
-- Player2_ID serial references players(ID), 
-- Winner serial references players(ID), 
-- primary key (Round, Match_Number));

CREATE TABLE matches 
             ( 
                          match_number SERIAL PRIMARY KEY, 
                          winner INT REFERENCES players(id), 
                          loser  INT REFERENCES players(id) 
             );

CREATE VIEW match_number AS 
            ( 
                      SELECT    players.id, 
                                players.NAME, 
                                Count(matches.winner) AS matchs 
                      FROM      players 
                      LEFT JOIN matches 
                      ON        players.id = matches.winner 
                      OR        players.id = matches.loser 
                      GROUP BY  matches.winner, 
                                matches.loser, 
                                players.id 
                      ORDER BY  matchs 
            );

CREATE VIEW score AS 
            ( 
                      SELECT    players.id, 
                                players.NAME, 
                                Count(matches.winner) AS wins, 
                                Count(matches.winner) AS match_num 
                      FROM      players 
                      LEFT JOIN matches 
                      ON        players.id = matches.winner 
                      GROUP BY  matches.winner, 
                                players.id 
                      ORDER BY  wins 
            );

CREATE VIEW standings AS 
            ( 
                     SELECT   score.id, 
                              score.NAME, 
                              score.wins, 
                              match_number.matchs AS matches 
                     FROM     score 
                     JOIN     match_number 
                     ON       score.id = match_number.id 
                     ORDER BY wins DESC 
            );