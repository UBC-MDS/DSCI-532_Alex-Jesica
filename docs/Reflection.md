Milestone 3: Reflection
================

#### Reflection on the usefulness of the feedback we received.

The feedback session was a valuable opportunity to see our app in action and receive valuable information. Our app will most certainly be better because of the generous feedback we received from our peers. Overall, our peers found that our app was straightforward to use and that the topic was enjoyable. However, they also found that we could improve on its level of clarity. 

This was further solidified by our experience being a "fly-on-the-wall". When going through our peers' apps without guidance, we noticed that having a clear outline and goal to an app made it much easier to understand the visualizations that the app was trying to achieve. 

Knowing this, we both felt and heard from our peers that more information was needed about the Bechdel Test as well as our data. This made a lot of sense to us-- our app was lacking context surrounding our visuals and filtering decisions. In turn, we'll be addressing this topic in our next round of updates. 

In terms of adding more information, one thing that we'll be keeping on the wishlist is adding more movie metadata to the hover boxes. We had some technical trouble with adding line breaks in the hover boxes, and given our time constraints this is more of a 'nice to have', rather than a structural piece we need.

Most peers suggested changing tab names, increasing plot sizes as well as changing the second plot to a side-by-side bar plot for eaiser comparisons. The side-by-side histograms were just not doing our comparison justice. Others also suggested changes to the text on our graphs and adding different colours. These changes all made a lot of sense to us and we'll be including them in our upcoming updates. The only thing we'll be adding the wishlist from the suggestions above is using a `ggtheme`. We'd like to explore adding a dark theme to emulate a cinema experience, but due to time constraints, we'll leave this on the wishlist for now and in lieu, we'll stick with an `RColorBrewer` palette.

One suggestion that came up a a few times was to make our 'Download Results' button download filtered data. This is what our download button was intended to do-- so we'll be double checking that our button functions properly (downloading filtered results).

Many peers mentioned enjoying the hover interactivity on the first plot in addition to the pass/fail filtering. We also heard that our peers wanted hover interactivity on the third plot, and some suggested moving away from the facetting setup and perhaps to a striplot. We've moved away from facetting and over to a stripplot which we think does a better job of showcasing genres. However, while we agree that adding interactivity to the third plot would be awesome-- unfortunately, it's something we won't be able to change at the moment. We used the `ggiraph` package for hover interactivity but the package doesn't support jitter/strip plots. We considered changing the plot to a boxplot but thought that it might not match the user profile from our usage case, as boxplots aren't the most accessible plots in terms of interpretability.

Another suggestion that we won't be addressing right away due to time constraints is moving away from the tab setup to single scrollable page. This lined up with one of our early design ideas but we ended up going with tabs because we thought it would be easier to navigate different plots with different options if they were separated by tabs. We're still intruiged by this design suggestion so we'll throw it on the wishlist for now. As a result, this was probably the least helpful in terms of feedback that we received as completely changing the layout is a big step in terms of code and time.

#### Reflection on how our project has changed since Milestone 2.

Our project hasn't changed too much since the previous milestone. The most significant design improvements are adding more context throughout our app, and making changes to the plot types for plot 2 and plot 3.

Our third plot took the most time to update. This was due to the structural changes we decided would be better for the information presented (facetting -&gt; stripplot), in addition to our interactive plotting package of choice (`ggiraph`) and the lack of compatibility there. It's possible that we can still make the hovering work on plot 3 in terms of code, though the time constraints on this project likely won't allow for it.
