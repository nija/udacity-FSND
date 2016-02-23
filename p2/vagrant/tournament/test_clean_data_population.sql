-- Test data for tournament database
-- test_clean_data_population.sql
\connect vagrant
drop database if exists tournament;
create database tournament;
\connect tournament

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

select * from players;
select * from matches;

-- create or replace view num_wins_per_player (player_id, wins) as
-- 	select winner_id, count(winner_id) 
-- 	from matches 
-- 	group by winner_id 
-- 	order by count(winner_id) desc;