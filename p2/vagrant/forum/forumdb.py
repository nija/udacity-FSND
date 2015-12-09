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
    #posts = [{'content': str(row[1]), 'time': str(row[0])} for row in DB_conn]
    #posts.sort(key=lambda row: row['time'], reverse=True)
    print "Creating a cursor"
    db_cursor = db_conn.cursor()
    print "cursor created %s" % db_cursor
    print "Reading in values"
    db_cursor.execute("select content, time from posts order by time;")
    print "values read from db"
    posts = db_cursor.fetchall()
    results_dict=[]
    for post in posts:
      results_dict.append([('content', str(post[0]), ('time', datetime(post[1])))])
    #print "posts are %s" % posts
    #print posts

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
