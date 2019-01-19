Purpose and Function
================
By: Alex Pak and Jes Simkin,
2019-01-12

Purpose
--------

The purpose of our app is to explore the representation of women in movies through the Bechdel Test, and if there are any relationships between the Bechdel Test grade, time, and movie score.

To help explore our dataset, we divided our app into three main questions, separated by tabs:   

1.	Over time, do more and better movies pass the Bechdel Test?  

2.	 Is there a change in the number of movies that pass or fail the Bechdel Test per year? How do those movies score? 

3.	Does the genre of a movie influence whether a movie passes or fails the Bechdel Test? 

Function & Design Choices 
--------

The first tab allows the user to explore all the movies organized by average Rotten Tomatoes score and time. We chose to have this figure as our app's "landing page" as it allows for a general overview of the entire dataset. 

We set up three types of interactive functionality on this tab:

1. Average Rotten Tomatoes Score filter slider
2. Pass or Fail view filters
3. Tooltip with movie title, and release year on hover


![](/src/screen1.PNG)

We wanted to give the user the ability to filter by Average Rotten Tomaotes score range. Perhaps the user is interested in seeing only movies that have high scores and their respective pass/fail gradings. Using a slider input is an inuitive choice for allowing the user to select a score range.

By checking off the “Pass” box, only the movies that pass the Bechdel Test are highlighted on the graph. Our goal with this functionality was to allow the user a more specific view of only the movies that pass, or the movies that fail. We decided to use the adjustment of transparency here so the user can primarily select a focus, yet still see the data as whole and maintain context.

If the user is interested in a particular movie, they can hover over a data point to find out its title and release year. The tooltip hover functionality allows the user to identify each data point as a specific movie, in turn allowing for more context. We decided to display both movie name and title, as these two pieces of information allow the user to uniqely identify the movie.

If we only consider movies that received a Rotten Tomatoes score above 50, we discover that the movie ratings of watchable movies do not seem to trend upward over time. In fact, it seems to trend slightly downward.

Our initial feeling was that over time, the movies that pass the Bechdel Test would increase in ratings. By interacting with the filters on the left, we can see if our guess was true. 
 
![](/src/screen2.PNG)

We chose to add a 'Download Results' button on this tab and all other tabs, to allow the user to save the filtered results for further analysis. This provides our app with a level of transparency and accountibility, and allows the user to explore the data beyond our app. 

If we only consider movies that received a Rotten Tomatoes score above 50, we discover that the movie ratings of watchable movies do not seem to trend upward over time. In fact, it seems to trend slightly downward.

Our initial feeling was that over time, the movies that pass the Bechdel Test would increase in ratings.  By interacting with the filters on the left, we can see if our guess was true. 

Although the first tab is great at giving a general overview, it covers a lot of data and does not do a good job of diving deep into the trends. If we want to learn more, we can move to the second tab, where a histogram of movies released over time is shown, faceted by Bechdel Test results.  

![](/src/screen3.PNG)

This tab allows the user to see via the histogram, how many movies are released per year, and how those movies fare on the Bechdel Test. 

Using the slider on the left, the user can set the score range they'd like to examine further. This allows the user to see if better movies (those that get better scores) or worse movies, pass the Bechdel Test differently year to year. Like in the first tab, the use of a slide input is intuitive for setting a score range.  

Again, our initial guess was that the number of movies that passed the Bechdel Test would increase over time.

![](/src/screen4.PNG)

From this distribution, it seems like the number of movies that passed the Bechdel Test increased over time. One possible explanation that the overall number of movies released increased over time; however, it seems that the increase in number of movies that pass the Bechdel Test has grown more than the increase in number of movies that fail the Bechdel Test. 

The last tab allows for further exploration by faceting the data by genre. To gain a better understanding of the Bechdel Test, dividing the data by genre allows us to see if certain genres have better representation of women, than other genres. 

![](/src/screen5.PNG)

For example, by choosing the relevant genres on the left from an input box with a dropdown list, a grid of comparisons can be created. We wanted to allow the user to select which genres to specifically look at. We selected four genres to be displayed by default to differentiate this view from the previous tab which was a binary view (facetted by pass/fail), and to emphasize the possibility of genre choices. 

The resulting graphs shows that despite the drastic difference in genre, the number of movies that pass or fail the Bechdel Test seems to be generally even. 

The user can also see scoring trends per genre. For example, it appears that 'Action & Adventure' movies that pass the Bechdel Test, aren't scored as high than those that fail. On the other hand, most other genres are score similarily in both pass and fail groups. This raises many questions for the user to explore further on the topic of the representation of women in movies, including for example, the possibility of sexism embedded in average Rotten Tomatoes scores.

![](/src/screen7.png)

At the project outset, the goal we set out to achieve was to gain deeper insight into the Bechdel Test and the representation of women in movies, by creating clear visualizations of movie gradings and rating over time, and by score. We wanted to provide intuitive filters for each visualization such that the user could focus on drawing conclusions from the data, rather than waste time figuring out what the visualizations represented. Throughout app development, the goal has not changed; in fact, the goal became clearer as time went on. After cleaning the data and creating the initial visualizations, we realized that we wanted to accomplish more. With more data, our app could provide an even broader view of movie ratings and the Bechdel Test.  
