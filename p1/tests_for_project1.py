#!/usr/bin/env python
"""Nose2 tests for project1.py, media.py, and fresh_tomatos.py
    This is more to get me used to using nose2 and pylint than useful tests"""

from media import MovieMetadata
from fresh_tomatos import create_movie_tiles_content


def create_movielist():
    """Function for testing lists - populates a list of movies with sample data"""
    movielist = []
    for x in range(5):
        movielist.append(MovieMetadata("Movie Title" + (x+1).__str__(), \
            "Movie comment" + (x+1).__str__(), \
            "http://poster_image_url.png", \
            "http://trailer_youtube.url"))
    return movielist

def test_check_movielist():
    """Tests a list of movies"""
    movielist = create_movielist()
    assert len(movielist) == 5

def test_object_str_output():
    """Tests the string output of the MovieMetadata object"""
    a = MovieMetadata("Movie Title", "Movie comment", "http://box_art.png", "http://youtube.url")
    print "test_object_str_output:\n"
    print "created a"
    print a
    assert a.__str__() == \
        "MovieMetadata object with state: title:Movie Title comment:Movie comment \
        poster_image_url:http://box_art.png trailer_youtube_url:http://youtube.url"

def test_object_repr_output():
    """TODO: Need to figure out how to mock-up some number of digits regex for this test.
        Until then, this is commented out

        Tests the object representation of the MovieMetadata object"""
#   a = MovieMetadata("Movie Title", "Movie comment", http://box_art.png", "https://youtube.url")
#   print "created a"
#   print "%s" % (a.__repr__())
#   assert a.__repr__() == \
        # "MovieMetadata 4325376592 < title:Movie Title comment:Movie comment \
        # poster_image_url:http://box_art.png trailer_youtube_url:http://youtube.url >"
    pass

def test_create_movie_tiles_content():
    """Tests the content creation for the movie tiles"""
    movielist = create_movielist()
    content = create_movie_tiles_content(movielist)
    print "test_create_movie_tiles_content: \n"
    print content
    assert content != ''
