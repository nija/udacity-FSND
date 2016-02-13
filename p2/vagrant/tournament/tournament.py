#!/usr/bin/env python
# 
# tournament.py -- implementation of a Swiss-system tournament
#

import psycopg2

# To connect:
## Database connection
#db_conn = psycopg2.connect("dbname=forum")
#db_cursor = db_conn.cursor()
#    db_cursor.execute("select content, time from public.posts order by time;")
#    results_dict=[]
#    posts = db_cursor.fetchall()
#    for row in posts:
#          results_dict.append({'content': str(bleach.clean(row[1])), 'time': str(row[0])})
#    return results_dict
def connect():
    """Connect to the PostgreSQL database.  Returns a database connection."""
    return psycopg2.connect("dbname=tournament")

#db_cursor.execute("insert into posts(content) values(%s);", [cleaned_content])
    
def deleteMatches():
    """Remove all the match records from the database."""
    db_conn = connect()
    db_cursor = db_conn.cursor()
    db_cursor.execute("delete from matches;")
    db_conn.commit()
    db_conn.close()

def deletePlayers():
    """Remove all the player records from the database."""
    db_conn = connect()
    db_cursor = db_conn.cursor()
    db_cursor.execute("delete from players;")
    db_conn.commit()
    db_conn.close()

def countPlayers():
    """Returns the number of players currently registered."""
    db_conn = connect()
    db_cursor = db_conn.cursor()
    db_cursor.execute("select count(player_id) from players;")
    # fetchall returns a dict containing a tuples
    results = db_cursor.fetchall()
    #print "Results: " , repr(results), " ", dir(results)
    player_count = results.pop()[0]
    #print "player_count: ", player_count, " ", player_count.__class__, " ", dir(player_count)
    db_conn.commit()
    db_conn.close()
    return player_count

def registerPlayer(name):
    """Adds a player to the tournament database.
  
    The database assigns a unique serial id number for the player.  (This
    should be handled by your SQL database schema, not in your Python code.)
  
    Args:
      name: the player's full name (need not be unique).
    """
    db_conn = connect()
    db_cursor = db_conn.cursor()
    db_cursor.execute("insert into players(player_name) values('%s')" % name)
    db_cursor.execute("select * from players;")
    results = db_cursor.fetchall()
    db_conn.commit()
    db_conn.close()
    print results


def playerStandings():
    """Returns a list of the players and their win records, sorted by wins.

    The first entry in the list should be the player in first place, or a player
    tied for first place if there is currently a tie.

    Returns:
      A list of tuples, each of which contains (id, name, wins, matches):
        id: the player's unique id (assigned by the database)
        name: the player's full name (as registered)
        wins: the number of matches the player has won
        matches: the number of matches the player has played
    """


def reportMatch(winner, loser):
    """Records the outcome of a single match between two players.

    Args:
      winner:  the id number of the player who won
      loser:  the id number of the player who lost
    """
    """Always places the id of the lower player first for better data organization"""
 
def swissPairings():
    """Returns a list of pairs of players for the next round of a match.
  
    Assuming that there are an even number of players registered, each player
    appears exactly once in the pairings.  Each player is paired with another
    player with an equal or nearly-equal win record, that is, a player adjacent
    to him or her in the standings.
  
    Returns:
      A list of tuples, each of which contains (id1, name1, id2, name2)
        id1: the first player's unique id
        name1: the first player's name
        id2: the second player's unique id
        name2: the second player's name
    """


