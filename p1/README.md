README

This app has been tested with python 2.7.9

This module contains 3 useful files, and one file for nose2 tests.

project1.py -- main app file that loads the other two. It creates a list of objects and displays them in a browser
media.py -- the data "models", currently only a MovieMetadata class. This does nothing on its own
fresh_tomatos.py -- the view and presentation functions. This does nothing on its own

To run the app, any one of the below will work:
	$ python project1.py
	$ chmod +x project1.py && ./project1.py

The page that launches in your browser will be a page of clickable movie tiles. When clicked, a movie tile will show a pretty popup that plays the movie trailer. Enjoy! 