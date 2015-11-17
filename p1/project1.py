#!/usr/bin/env python
"""This file is the main FSND project source

Example:
    Call the program by::

        $ ./project1.py
    It will launch a browser tab with 6 movie tiles which you can click on to
    get to the movie trailer
"""

from media import MovieMetadata
from fresh_tomatos import open_movies_page

def create_movielist():
    """Pylint complained, so I moved this into its own function

    Example:
        This returns a populated list of Movie_metadata objects::

            create_movielist()
    """
    # Create the list of movies - let's pick 6
    movielist = []
    # title, box_art, url
    movielist.append(MovieMetadata("Toy Story", \
        "I'm from Mattel. Well, I'm not really from Mattel, I'm actually " \
        "from a smaller company that was purchased by Mattel in a leveraged " \
        "buyout.", \
        "http://ia.media-imdb.com/images/M/MV5BMTgwMjI4MzU5N15BMl5BanBnXkFtZ" \
        "TcwMTMyNTk3OA@@._V1_SY317_CR12,0,214,317_AL_.jpg", \
        'https://www.youtube.com/watch?v=KYz2wyBy3kc'))
    movielist.append(MovieMetadata("Avatar", \
        "I was hoping for some kind of tactical plan that didn't involve " \
        "martyrdom", \
        'http://ia.media-imdb.com/images/M/MV5BMTYwOTEwNjAzMl5BMl5BanBnXk' \
        'FtZTcwODc5MTUwMw@@._V1_SY317_CR0,0,214,317_AL_.jpg', \
        'https://www.youtube.com/watch?v=cRdxXPV9GNQ'))
    movielist.append(MovieMetadata("The Princess Bride", \
        "When I was your age, television was called books. And this is a " \
        "special book. It was the book my father used to read to me when I " \
        "was sick, and I used to read it to your father. And today I'm gonna" \
        " read it to you.", \
        'http://ia.media-imdb.com/images/M/MV5BMTkzMDgyNjQwM15BMl5BanBnXkFtZ' \
        'TgwNTg2Mjc1MDE@._V1_SY317_CR0,0,214,317_AL_.jpg', \
        'https://www.youtube.com/watch?v=GNvy61LOqY0'))
    movielist.append(MovieMetadata("Serenity", \
        "Shiny. Let's be bad guys.", \
        'http://ia.media-imdb.com/images/M/MV5BMTI0NTY1MzY4NV5BMl5BanBnXkFtZ' \
        'TcwNTczODAzMQ@@._V1_SY317_CR0,0,214,317_AL_.jpg', \
        'https://www.youtube.com/watch?v=JY3u7bB7dZk'))
    movielist.append(MovieMetadata("The Wizard of Speed and Time", \
        "Miss Belair, if you feel compelled to grab part of my body and " \
        "shake it before you can even be friendly, you've got far worse " \
        "problems than you think I have.", \
        'http://ia.media-imdb.com/images/M/MV5BODc3MzA3MDQyN15BMl5BanBnXkFtZ' \
        'TYwMzE2MTk5._V1_SX214_AL_.jpg', \
        'https://www.youtube.com/watch?v=3ldOTw60Ozg'))
    movielist.append(MovieMetadata("Inside Out", \
        "Take her to the moon for me. Okay?", \
        'http://ia.media-imdb.com/images/M/MV5BOTgxMDQwMDk0OF5BMl5BanBnXkFtZ' \
        'TgwNjU5OTg2NDE@._V1_SX214_AL_.jpg', \
        'https://www.youtube.com/watch?v=yRUAzGQ3nSY'))

    return movielist

# Call the function to open the webpage
open_movies_page(create_movielist())
