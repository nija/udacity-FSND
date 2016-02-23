-- Table definitions for the tournament project.
--
-- Put your SQL 'create table' statements in this file; also 'create view'
-- statements if you choose to use it.
--
-- You can write comments in this file by starting them with two dashes, like
-- these lines here.

-- Start with a fresh copy of the data
drop database if exists tournament;
create database tournament;
\connect tournament

-- \l = lists databases
-- \c vagrant = reconnects to the vagrant db
-- \dt = shows the tables/relations
-- to see how many are connected to a db: 
	-- select datname,numbackends from  pg_stat_database where datname='newdb';
-- to list fields in a table (assuming you are connected to the db)
	-- \d+ players

--table Players
--player_id 		player_name	
create table players (
	player_id serial primary key,
	player_name text
	);	


--table matches
--match_id		tournament_id		winner_id		loser_id
create table matches (
	match_id serial primary key,
	winner_id integer,
	loser_id integer
	);
create table matches (
	match_id serial primary key,
	tournament_id integer,
	winner_id integer,
	loser_id integer
	);



select * from players left join matches on matches.winner_id = players.player_id or loser_id = players.player_id;

select winner_id, count(winner_id) as wins, count(loser_id) as losses from matches group by winner_id order by wins desc;

select winner_id, count(winner_id) as wins, count(loser_id) as losses, ((select count(winner_id) from matches) + (select count(loser_id) from matches)) as total from matches group by winner_id order by wins desc;

select winner_id, count(winner_id) as wins from matches group by winner_id
union all
select loser_id, count(loser_id) as losses from matches group by loser_id;
 





-- view num_wins_per_player, query links wins per player
-- TODO: test the query before embedding it in a view
create or replace view num_wins_per_player (player_name, wins) as
	select players.player_id, players.player_name, count(*) as total_matches, (select count(winner_id) from matches group by winner_id) as wins
	from players
	join matches on matches.winner_id = players.player_id
	group by matches.winner_id
	order by wins desc;
select winner_id, count(*) from matches group by winner_id order by count(*) desc;
select players.player_id, players.player_name, 
player1_id.matches, player2_id.matches, winner_id.matches 
from players, matches
	join matches on matches.winner_id = players.player_id
	group by matches.winner_id
	order by wins desc;

select (select player_id, player_name, match_id, player1_id, player2_id, winner_id
from players
left join matches on matches.player1_id = players.player_id
order by player_id),
(select player_id, player_name, match_id, player1_id, player2_id, winner_id
from players
left join matches on matches.player2_id = players.player_id
order by player_id)
where match_id = match_id


select player_id, player_name, match_id, player1_id, player2_id, winner_id, count(distinct winner_id) as wins
from players
left join matches on matches.winner_id = players.player_id
group by players.player_id

create or replace view num_wins_per_player (player_id, wins) as
	select winner_id, count(winner_id) 
	from matches 
	group by winner_id 
	order by count(winner_id) desc;

create or replace view temp_table_for_norm (player_id, player_name, match_id, player1_id, player2_id, winner_id) as


-- Returns a list of tuples, each of which contains (id, name, wins, matches):
--        id: the player's unique id (assigned by the database)
--        name: the player's full name (as registered)
--        wins: the number of matches the player has won
--        matches: the number of matches the player has played
-- TODO: [EC] view num_wins_per_player_per_tournament
--		 query links wins per player per tournament, needs a having tournament_id = ''
-- TODO: test the query before embedding it in a view
--create or replace view num_wins_per_player_per_tournament (player_name, wins) as ...
--


-- Generic forms follow:
CREATE TABLE new_table_name (
	table_column_title TYPE_OF_DATA column_constraints,
	next_column_title TYPE_OF_DATA column_constraints,
	table_constraint
	table_constraint
) INHERITS existing_table_to_inherit_from;


-- Test data population:

drop table if exists players;
drop table if exists matches;

create table players (
	player_id serial primary key,
	player_name text
	);	
create table matches (
	match_id serial primary key,
	player1_id integer,
	player2_id integer,
	winner_id integer 
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
insert into matches(player1_id,player2_id,winner_id) values(1,2,1);
insert into matches(player1_id,player2_id,winner_id) values(2,3,2);
insert into matches(player1_id,player2_id,winner_id) values(3,4,4);
insert into matches(player1_id,player2_id,winner_id) values(4,5,4);
insert into matches(player1_id,player2_id,winner_id) values(5,6,6);
insert into matches(player1_id,player2_id,winner_id) values(6,7,6);
insert into matches(player1_id,player2_id,winner_id) values(7,8,8);
insert into matches(player1_id,player2_id,winner_id) values(8,9,8);
insert into matches(player1_id,player2_id,winner_id) values(9,10,10);
insert into matches(player1_id,player2_id,winner_id) values(1,10,10);

select * from players; select * from matches;



-- Exceeds Expectations:
-- Extra credit option is implemented
-- Views are used
-- table columns have meaningful names, are of the proper data type, and there are no unecessary 
	-- columns

-- Extra Credit Option:
-- Support more than one tournament in the database, so matches do not have to be deleted between 
-- tournaments. This will require distinguishing between “a registered player” and “a player who 
-- has entered in tournament #123”, so it will require changes to the database schema.

