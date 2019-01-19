Purpose and Function
================
By: Alex Pak and Jes Simkin,
2019-01-12

Purpose
--------

The purpose of our app was to explore female representation in movies through the Bechdel Test, and if there are any relationships between the Bechdel Test classification and movie rating.

To help explore our dataset, we divided our app into three main axes, separated by tabs: 
1.	Over time, does the spread of movie ratings that pass or fail the Bechdel Test increase or decrease? 
2.	 Over time, is there a change in the number of movies that pass or fail the Bechdel Test? How do those movies score? 
3.	Does the genre of a movie influence the ratings of movies that pass/fail the Bechdel Test? 

By exploring these three questions, we hope to gain a better understanding of the Bechdel Test. 

The first tab allows for exploration of movie ratings over time. This tab is the first tab that appears when the app is opened and allows for a general overview of the entire dataset. Our initial feeling was that over time, the movies that pass the Bechdel Test would increase in ratings.  By interacting with the filters on the left, we can see if our guess was true. 

![](/src/screen1.PNG)

By checking off the “Pass” box, only the movies that pass the Bechdel Test are highlighted on the graph. Then, if we only consider movies that received a Rotten Tomatoes score above 50, we discover that the movie ratings of watchable movies do not seem to trend upward over time. In fact, it seems to trend slightly downward. 

![](/src/screen2.PNG)

If we were interested in any particular movie, we can mouse over a data point to find out its title and release year. At this point, we can also save the results for further analysis using the “Download Results” button. 

Although the first tab is great at giving a general overview, it covers a lot of data and does not do a good job of diving deep into the trends. If we want to learn more, we can move to the second tab, where a histogram of movies released over time is shown, faceted by Bechdel Test result.  

![](/src/screen3.PNG)

Again, our initial guess was that the number of movies that passed the Bechdel Test would increase over time. Using the slider on the left, we can filter by movies that score above a Rotten Tomatoes rating of 50 and examine the histogram. 

![](/src/screen4.PNG)

From this distribution, it seems like the number of movies that passed the Bechdel Test increased over time. One possible explanation that the overall number of movies released increased over time; however, it seems that the increase in number of movies that pass the Bechdel Test has grown more than the increase in number of movies that fail the Bechdel Test. 

The last tab allows for further exploration by faceting the data by genre. To gain a better understanding of the Bechdel Test, dividing the data by genre allows us to see if certain genres have better female representation than other genres. 

![](/src/screen5.PNG)

For example, by choosing the relevant genres on the left from a dropdown list, a side by side comparison of the Action & Adventure and Drama genres can be created. The resulting graphs shows that despite the drastic difference in genre, the spread of movies that pass or fail the Bechdel Test seems to be even. 
![](/src/screen7.PNG)

At the project outset, the goal we set out to achieve was to gain deeper insight into the Bechdel Test by creating clear visualizations of movie classification and rating over time. We wanted to provide intuitive filters for each visualization such that the user could focus on drawing conclusions from the data, rather than waste time figuring out what the visualizations represented. Throughout app development, the goal has not changed; in fact, the goal became clearer as time went on. After cleaning the data and creating the initial visualizations, we realized that we wanted to accomplish more. With more data, our app could provide an even broader view of movie ratings and the Bechdel Test.  
