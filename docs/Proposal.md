Proposal
================
By: Alex Pak and Jes Simkin,
2019-01-12

Overview
--------

The “Bechdel Test” is a popular method of movie classification that aims to measure the representation and roles of females in movies. This test was popularized in 1985 by cartoonist Alison Bechdel and is as follows: 

1. The movie must have at least two women
2. They must talk to each other at least once... 
3. About something besides a man

Although these criteria seem ridiculous at first glance, only about [half](https://en.wikipedia.org/wiki/Bechdel_test) of movies actually pass the Bechdel Test. It seems to be Hollywood's belief that movies that do not pass the Bechdel Test have higher viewership and are more financially viable. 

To test this belief, we will create an app that explores movies classified by the Bechdel Test. Our app will allow users to visually explore the metadata of movies that both pass and fail the Bechdel Test, in order to better visualize the Bechdel test and female representation in movie media.

Description of the Data
-----------------------

The dataset behind our app contains movie metadata and Bechdel Test ratings for 206 movies.

Our dataset is a combination of this <a href="http://www2.stat.duke.edu/~mc301/data/movies.html">dataset</a> of randomly selected movies released in the United States between 1972 and 2014, compiled by Dr.Çetinkaya-Rundel and Bechdel Test grades scraped from the <a href="https://bechdeltest.com/">Bechdel Test Movie List database</a> with this <a href="https://github.com/neokt/women-dialogue-box-office/blob/master/02-bechdel-scraping.ipynb">script</a> written by Ting Neo.

In order to explore the representation of women in the US movie industry, we will primarily be looking for trends between a movie’s score (`critics_score`, `audience_score`, and `avg_score` derived by averaging the critics and audience scores), genre, US theatre release year, and it’s Bechdel Test grade.

We’ve also included other variables in our dataset that help identify a movie and provide context that we think might interest the user including title, MPAA rating, first two leading actors from the cast, it’s imdb id, and a url to the movie’s Rotten Tomatoes page.

More info on Rotten Tomatoes scoring can be found <a href="https://www.rottentomatoes.com/about">here</a> and information about the Bechdel Test grades can be found <a href="https://bechdeltest.com/">here</a>.

This dataset was approved by Alejandra (TA).

Usage Scenario & Tasks
----------------------

Erin is interested in exploring the representation of women in media, particularly by examining movies and using the Bechdel Test. They want to examine how movies fare with the Bechdel Test when broken down over time (year of release), by genre, and by popular score on Rotten Tomatoes (average of audience and critic score).

When Erin loads the app, they see an overview figure of 206 movies, illustrating how movies are distributed by time and score, and whether the movie passes the Bechdel Test. This figure allows Erin to see if over time, more and better movies pass the Bechdel Test or not. Erin can choose to filter out movies by their Bechdel Test grade using checkboxes in the sidebar, and by hovering over a data point, Erin can see more information about that movie.

In order to explore other trends, Erin can navigate to other figures by clicking on different tabs along the top of the app. By navigating to the second tab, Erin can see how many movies pass and fail the Bechdel Test over time, with the option of controlling for the range of scores displayed with a slider in the sidebar. When navigating to the third tab, Erin can compare how movies of different genres are distributed by score, and how these sets of movies do on the Bechdel Test. Genres can be selected with checkboxes in the sidebar. By hovering over a data point, Erin can see more information about that movie.

If Erin wants to further examine the data behind a figure, for any figure and corresponding set of chosen filters, Erin can download the data in a csv format for further analysis using each tab’s ‘Download Results’ button. Also, below every figure, Erin can see how many movies have been plotted as filters are changed.

App Description & Sketch
------------------------

Our app will contain 3 tabs, each visualizing a separate property of the movie metadata. The first tab will contain data of movie ratings over time, filtered by the Bechdel Test. To filter the movies by "Pass" and "Fail", a checkbox will be present. When one option is chosen, the points that are not chosen will be greyed out for extra clarity. 

The second tab will contain graphs visualizing total number of movies over time, faceted by the Bechdel Test, with a filter for rating. This will provide insight into if more movies that passed the Bechdel Test were created - or less. 

The third tab will contain graphs separated by genre, to explore how genre affects movies that pass or fail the Bechdel Test as well as their rating. 

![](/src/mockup_page1.PNG)
![](/src/mockup_page2.PNG)
![](/src/mockup_page3.PNG)