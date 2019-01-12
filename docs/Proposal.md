Proposal
================
Alex Pak and Jes Simkin
2019-01-13

Overview
--------

Description of the Data
-----------------------

The dataset behind our app contains movie metadata and Bechdel Test ratings for 206 movies.

Our dataset is a combination of this <a href="http://www2.stat.duke.edu/~mc301/data/movies.html">dataset</a> of randomly selected movies released in the United States between 1972 and 2014, compiled by Dr.Çetinkaya-Rundel and Bechdel Test grades scraped from the <a href="https://bechdeltest.com/">Bechdel Test Movie List database</a> with this <a href="https://github.com/neokt/women-dialogue-box-office/blob/master/02-bechdel-scraping.ipynb">script</a> written by Ting Neo.

In order to explore the representation of women in the US movie industry, we will primarily be looking for trends between a movie’s score (`critics_score`, `audience_score`, and `avg_score` derived by averaging the critics and audience scores), genre, US theatre release year, and it’s Bechdel Test grade.

We’ve also included other variables in our dataset that help identify a movie and provide context that we think might interest the user including title, MPAA rating, first two leading actors from the cast, it’s imdb id, and a url to the movie’s Rotten Tomatoes page.

More info on Rotten Tomatoes scoring can be found <a href="https://www.rottentomatoes.com/about">here</a> and information about the Bechdel Test grades can be found <a href="https://bechdeltest.com/">here</a>.

This dataset was approved by Alejandra (TA).

Usage scenario & tasks
----------------------

Erin is interested in exploring the representation of women in media, particularly by examining movies and using the Bechdel Test. They want to examine how movies fare with the Bechdel Test when broken down over time (year of release), by genre, and by popular score on Rotten Tomatoes (average of audience and critic score).

When Erin loads the app, they see an overview figure of 206 movies, illustrating how movies are distributed by time and score, and whether the movie passes the Bechdel Test. This figure allows Erin to see if over time, more and better movies pass the Bechdel Test or not. Erin can choose to filter out movies by their Bechdel Test grade using checkboxes in the sidebar, and by hovering over a data point, Erin can see more information about that movie.

In order to explore other trends, Erin can navigate to other figures by clicking on different tabs along the top of the app.

By navigating to the second tab, Erin can see how many movies pass and fail the Bechdel Test over time, with the option of controlling for the range of scores displayed with a slider in the sidebar.

When navigating to the third tab, Erin can compare how movies of different genres are distributed by score, and how these sets of movies do on the Bechdel Test. Genres can be selected with checkboxes in the sidebar. By hovering over a data point, Erin can see more information about that movie.

If Erin wants to further examine the data behind a figure, for any figure and corresponding set of chosen filters, Erin can download the data in a csv format for further analysis using each tab’s ‘Download Results’ button. Also, below every figure, Erin can see how many movies have been plotted as filters are changed.

App Description & sketch
------------------------
