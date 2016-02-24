-- Test data for tournament database
-- test_clean_data_population.sql

-- drop and recreate the database
\connect vagrant
drop database if exists tournament;
create database tournament;
\connect tournament

-- drop and recreate the tables
drop table if exists matches;
drop table if exists players;

create table players (
	player_id serial primary key,
	player_name text
	);

create table matches (
	match_id serial primary key,
	winner_id integer,
	loser_id integer
	);

-- Create or replace the normalized view
-- This view works as follows: 
-- get each player's wins: "select player_id, player_name, count(winner_id) as wins..."
-- get each player's losses: "select player_id, player_name, count(loser_id) as losses..."
-- make sure we aren't passing null values, and 
-- smush everything together: "select coalesce(a.player_id, b.player_id) as player_id, coalesce(a.player_name, b.player_name) as player_name, coalesce(wins, 0) as wins, coalesce(losses, 0) as losses... full join"
-- Thank you, coalesce function!
create or replace view normalized_wins_and_losses (player_id, player_name, wins, losses) as 
select coalesce(a.player_id, b.player_id) as player_id, coalesce(a.player_name, b.player_name) as player_name, coalesce(wins, 0) as wins, coalesce(losses, 0) as losses from (
   select player_id, player_name, count(winner_id) as wins
   from matches
   full join players on matches.winner_id=players.player_id
   group by player_id
) as a
full join (
      select player_id, player_name, count(loser_id) as losses
      from matches
      full join players on matches.loser_id=players.player_id
      group by player_id, player_name
      ) as b
on a.player_id = b.player_id;

-- Toss in test data for both tables
delete from players;
insert into players(player_name) values('player1');
insert into players(player_name) values('player2');
insert into players(player_name) values('player3');
insert into players(player_name) values('player4');
insert into players(player_name) values('player5');
insert into players(player_name) values('player6');
insert into players(player_name) values('player7');
insert into players(player_name) values('player8');
insert into players(player_name) values('player9');
insert into players(player_name) values('player10');
insert into players(player_name) values('player11');


delete from matches;
insert into matches(winner_id,loser_id) values(2,1);
insert into matches(winner_id,loser_id) values(3,2);
insert into matches(winner_id,loser_id) values(4,10);
insert into matches(winner_id,loser_id) values(5,4);
insert into matches(winner_id,loser_id) values(6,5);
insert into matches(winner_id,loser_id) values(7,6);
insert into matches(winner_id,loser_id) values(8,7);
insert into matches(winner_id,loser_id) values(9,8);
insert into matches(winner_id,loser_id) values(10,2);
insert into matches(winner_id,loser_id) values(10,1);

-- insert into matches(tournament_id,winner_id,loser_id) values(1,2,1);
-- insert into matches(tournament_id,winner_id,loser_id) values(2,3,2);
-- insert into matches(tournament_id,winner_id,loser_id) values(3,4,4);
-- insert into matches(tournament_id,winner_id,loser_id) values(4,5,4);
-- insert into matches(tournament_id,winner_id,loser_id) values(5,6,6);
-- insert into matches(tournament_id,winner_id,loser_id) values(6,7,6);
-- insert into matches(tournament_id,winner_id,loser_id) values(7,8,8);
-- insert into matches(tournament_id,winner_id,loser_id) values(8,9,8);
-- insert into matches(tournament_id,winner_id,loser_id) values(9,10,10);
-- insert into matches(tournament_id,winner_id,loser_id) values(1,10,10);

-- Verification
select * from players;
select * from matches;
select * from normalized_wins_and_losses;


