#
# Database access functions for the web forum.
#
'''Module that handles connecting to the database and returning results'''
import time
import psycopg2
import datetime


## Database connection
db_conn = psycopg2.connect("dbname=forum")

## Get posts from database.
def GetAllPosts():
    '''Get all the posts from the database, sorted with the newest first.

    Returns:
      A list of dictionaries, where each dictionary has a 'content' key
      pointing to the post content, and 'time' key pointing to the time
      it was posted.
    '''
    db_cursor = db_conn.cursor()
    db_cursor.execute("select content, time from public.posts order by time;")
    results_dict=[]
    posts = db_cursor.fetchall()
 #   results_dict = [{'content': str(row[1]), 'time': str(row[0])} for row in posts]
    for row in posts:
          results_dict.append({'content': str(row[1]), 'time': str(row[0])})
    return results_dict

## Add a post to the database.
def AddPost(content):
    '''Add a new post to the database.

    Args:
      content: The text content of the new post.
    '''
    #t = time.strftime('%c', time.localtime())
    #DB_conn.append(t, content)
    db_cursor = db_conn.cursor()
    db_cursor.execute("insert into posts(content) values(%s);", [content])
    db_conn.commit()
