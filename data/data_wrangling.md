Data Wrangling
================

``` r
#Loading data scraped from bechdeltest.com located in the "bechdel_db_scraped.csv" file.


# Scraped using this script by Ting Neo,

#https://github.com/neokt/women-dialogue-box-office/blob/master/02-bechdel-scraping.ipynb

bechdel <- read_csv("bechdel_db_scraped.csv")
```

    ## Warning: Missing column names filled in: 'X1' [1]

    ## Parsed with column specification:
    ## cols(
    ##   X1 = col_integer(),
    ##   imdb_id = col_character(),
    ##   title = col_character(),
    ##   year = col_integer(),
    ##   bechdel = col_character()
    ## )

``` r
bechdel <- bechdel %>% 
  select(t = title, bechdel, year, imdb_id)

#The combination of release_year and title is a unique identifier.
#A test case here to examin is the movies title Hairspray but released in different years.


#creating a uniqe id for joining downstream
bechdel<- unite(bechdel, id, c(year, t), sep="_", remove=FALSE)

#loading in movies dataset compiled by compiled by Dr.Çetinkaya-Rundel 

#http://www2.stat.duke.edu/~mc301/data/movies.html

load(url("http://www2.stat.duke.edu/~mc301/data/movies.Rdata"))

rotten <- movies
#creating a uniqe id for joining 
rotten<- unite(rotten, id, c(thtr_rel_year, title), sep="_", remove=FALSE)

#joining our two datasets
bechdel_data <- distinct(inner_join(rotten, bechdel, by="id"))

#narrowing down genre categories and selecting columns for the app
bechdel_data <- bechdel_data %>% 
  rename(m_title = title) %>% 
  mutate(genre = replace(genre, genre == "Animation" | 
           genre == "Science Fiction & Fantasy" | 
           genre == "Other" | genre == "Documentary" | 
           genre == "Art House & International" | 
           genre == "Musical & Performing Arts", "Other"),
         avg_score = (critics_score + audience_score) / 2) %>% 
  select(m_title, thtr_rel_year, bechdel, 
         genre, avg_score, critics_score, 
         audience_score, rt_url, mpaa_rating, actor1, 
         actor2, top200_box, imdb_id)
  


#writing a csv
write_csv(bechdel_data, "movies_rt_bechdel.csv")
```
