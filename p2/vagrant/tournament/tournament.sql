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
--match_id		player1_id		player2_id		winner_id		(tournament_id)
create table matches (
	match_id serial primary key,
	player1_id integer,
	player2_id integer,
	winner_id integer 
	);

-- view num_wins_per_player, query links wins per player
-- TODO: test the query before embedding it in a view
create or replace view num_wins_per_player (player_name, wins) as
	select players.player_name,count(*) as wins
	from players
	join matches on matches.winner_id = players.player_id
	group by players.player_id;
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

