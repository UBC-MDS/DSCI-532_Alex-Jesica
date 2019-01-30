Milestone 4: Last Improvement
================

#### What changes did you decide to implement given the time limit, and why do you think this is the best thing to focus on?

Although we had several items on our wishlist to add to our app, we decided to change the colours of our app to a darker theme. The other major addition we were considering would have been hover functionality to the plot in Tab 3; however, this proved difficult to implement given the `ggiraph` package we used. Because of this, we decided changing the theme would be the best direction to head in given the time constraints. This was done for two reasons: 

1. Changing the theme was not an overly time intensive task 
2. Changing the theme is a high-impact improvement

The theme was changed to a darker aesthetic to match the movie topic that we chose. Overall, we believe that a coherent theme and clean design encourages user engagement and heightens first impressions.

#### If you were to make the app again from scratch (or some other app in general), what would you do differently?

There are several things we learned and would do differently after going through this process of app development. The first would be to include systematic testing throughout development. While coding the app, it was difficult to troubleshoot what exactly went wrong with the code when bugs arose. This could have been mitigated or prevented by periodically including "checks" in the code, to ensure that the output of our code was actually what we expected. Next time, we would set aside more time for EDA and data pre-processing near the beginning of app development. This would help make our design and expectations more grounded. Also, we did not take into account testing on multiple browsers until late in development, which was something we should have thought of earlier. 

The last problem relates to the topic itself rather than development: we believe that choosing a larger dataset would have improved the app and its visualizations as a whole. More data would make for better findings, and in turn, make our app better.

#### What were the greatest challenges you faced in creating the final product?

Including hover functionality with jitter plots was functionality we thought would be simple to implement during the initial planning phase. Unfortunately, due to package limitations and UI difficulties, it was much more difficult and time intensive than we planned for. There were also unexpected bugs that occurred after uploading to `shinyapps.io`, such as the fonts used in the graph and legend changing without clear reason. Troubleshooting and fixing these bugs was not straightforward. There was also the shift in mindset when thinking about how to code apps with reactive variables vs. conventional scripts, which took some time to get used to. Lastly, one of the largest problems with the project itself was balancing our aspirations with the given time constraints. At times, it was difficult to prioritize "need to have" and "nice to have" features of the app, which was a problem that we did not expect to be so large at the outset of development. 
