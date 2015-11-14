#!/usr/bin/env python
"""This file defines media classes"""

class MovieMetadata(object):
    """This class defines a movie metadata object
        Example:
            movie = MovieMetadata("Movie Title", \
            "comment about the movie", \
            'http://poster_image.url', \
            'https://trailer_youtube.url')

            print movie
        This will print out as:
        MovieMetadata object with state: title:Movie Title poster_image_url:http://poster_image.url trailer_youtube_url:https://trailer_youtube.url
    """
    def __init__(self, title, comment, poster_image_url, trailer_youtube_url):
        self.title = title
        self.comment = comment
        self.poster_image_url = poster_image_url
        self.trailer_youtube_url = trailer_youtube_url

    # Object representation
    def __repr__(self):
        return "%s %s < title:%s comment:%s poster_image_url:%s trailer_youtube_url:%s >" % \
           (self.__class__.__name__, id(self), \
            self.title, self.comment, self.poster_image_url, \
            self.trailer_youtube_url)

    # String representation
    def __str__(self):
        return "%s object with state: title:%s comment:%s poster_image_url:%s trailer_youtube_url:%s" % \
            (self.__class__.__name__, \
             self.title, self.comment, self.poster_image_url, \
             self.trailer_youtube_url)
