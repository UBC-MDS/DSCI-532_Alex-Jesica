library(shiny)
library(tidyverse)
library(ggiraph)
library(htmltools)
library(reshape2)
library(RColorBrewer)

#loading data
data <- read.csv("https://raw.githubusercontent.com/jessimk/DSCI-532_Alex-Jesica/master/data/movies_rt_bechdel.csv")

#setting hover css options
tooltip_css <- "font-style:italic;opacity:0.6;color:white;padding:6px;border-radius:5px;"


ui <- 
  fluidPage(
    
    tags$head(
      tags$style(type="text/css", "text {font-family: sans-serif}")
    ),
    
    titlePanel("Exploring the Bechdel Test & Movies 🎥"),
    
    tabsetPanel(
      
      #First Tab & Plot        
      tabPanel("Grades by Rotten Tomatoes Scores Over Time",
               
               br(),
               
               ggiraphOutput("plot1"),
               
               wellPanel(
                 fluidRow(
                   column(4,
                     sliderInput("scoreInput1", 
                                 "Average Rotten Tomatoes Score:",
                                 min = 0, max = 100, value = c(0, 100)),
                     h4(textOutput("summaryText1.1")),
                     h5(textOutput("summaryText1.2")),
                     br()
                     ),
                   column(3,
                          checkboxGroupInput("pfCheckBox", "Filter by Bechdel Test:",
                                             c("Pass" = "boxPass",
                                               "Fail" = "boxFail")),
                          downloadButton("download1", "Download Results")
                   ),
                   
                   column(5,
                     span("The Bechdel Test is a way to measure the representation of women in media. Learn more about the Bechdel Test and how movies are graded ", a(href = "https://bechdeltest.com/", "here.")),
                     br(),br(), 
                     span("We have averaged Rotten Tomatoes audience and critic scores. Learn more about Rotten Tomatoes scores", a(href = "https://www.rottentomatoes.com/about", "here.")),
                     br(),br(),
                     span("Data sources:", 
                          tags$a("Movies Dataset by Dr. Çetinkaya-Rundel",
                                 href = "http://www2.stat.duke.edu/~mc301/data/movies.html"),
                          " and the ",
                          tags$a("Bechdel Test Movie List",
                                 href = "https://bechdeltest.com/")
                          ),
                     br(),
                     span("App by", a(href = "https://github.com/UBC-MDS/DSCI-532_Alex-Jesica_Bechdel-Test", "Alex Pak and Jes Simkin")),
                     br(),
                     span("Code", a(href = "https://github.com/UBC-MDS/DSCI-532_Alex-Jesica_Bechdel-Test", "on GitHub 🍿"))
                   ))
                 
                 )),
      
      
      #Second Tab & Plot    
      tabPanel("Grades by Release Year",
               plotOutput("plot2"), 
               
               wellPanel(
                 fluidRow(
                   column(4, sliderInput("scoreInput2",
                            "Average Rotten Tomatoes Score:",
                            min = 0, max = 100, value = c(0,100))
                          ), 
                   column(4,
                          span("In this histogram we can explore how movies pass or fail the Bechdel Test over time."),
                          br(), br(),
                          downloadButton("download2", "Download Results")
                          ),
                   column(4,
                          span("Data sources:", 
                               tags$a("Movies Dataset by Dr. Çetinkaya-Rundel",
                                      href = "http://www2.stat.duke.edu/~mc301/data/movies.html"),
                               " and the ",
                               tags$a("Bechdel Test Movie List",
                                      href = "https://bechdeltest.com/")
                          ),
                          br(), br(),
                          span("Created by", a(href = "https://github.com/UBC-MDS/DSCI-532_Alex-Jesica_Bechdel-Test", "Alex Pak and Jes Simkin")),
                          br(),
                          span("Code", a(href = "https://github.com/UBC-MDS/DSCI-532_Alex-Jesica_Bechdel-Test", "on GitHub 🍿"))
                          ))
               )),
      
      #Third Tab & Plot  
      tabPanel("Grades by Genre",
               br(),
               
               plotOutput("plot3"),
               
               wellPanel(fluidRow(
                 
                 column(4, 
                        uiOutput("typeSelectOutput")
                        ),
                 column(3, 
                         checkboxGroupInput("pfCheckBox2", "Filter by Bechdel Test:",
                                            c("Pass" = "boxPass2",
                                              "Fail" = "boxFail2")),
                        downloadButton("download3", "Download Results")
                         ), 
                 column(5,
                        span("In this categorical plot, we can visually compare movie genres and how they fare on the Bechdel Test."),
                        br(), br(),
                        span("Data sources:", 
                             tags$a("Movies Dataset by Dr. Çetinkaya-Rundel",
                                    href = "http://www2.stat.duke.edu/~mc301/data/movies.html"),
                             " and the ",
                             tags$a("Bechdel Test Movie List",
                                    href = "https://bechdeltest.com/")
                        ),
                        br(), br(),
                        span("Created by", a(href = "https://github.com/UBC-MDS/DSCI-532_Alex-Jesica_Bechdel-Test", "Alex Pak and Jes Simkin")),
                        br(),
                        span("Code", a(href = "https://github.com/UBC-MDS/DSCI-532_Alex-Jesica_Bechdel-Test", "on GitHub 🍿"))
                 )
               )))
    ))

# Define server logic required to draw a histogram
server <- function(input, output) {
  
  observe(print(data))
  
  #Plot 1   
  filtered_data1 <- reactive({
    data %>%
      filter(avg_score > input$scoreInput1[1],
             avg_score < input$scoreInput1[2])
  })
  
  output$plot1 <- renderggiraph({
    if (is.null(input$pfCheckBox) | length(input$pfCheckBox) == 2){
      p1 <- filtered_data1() %>%
        ggplot(aes(thtr_rel_year, avg_score, colour=bechdel)) +
        geom_point() +
        ylim(0,100) +
        ggtitle("Over time, do more and better movies pass the Bechdel Test?")+
        xlab("US Theatre Release Year")+
        ylab("Average Rotten Tomatoes Score")+
        labs(colour="Bechdel Test \n Grade")+
        scale_color_manual(values = rev(brewer.pal(n=3, "Set2")))+
        theme(
          text = element_text(family = ""),
          plot.title = element_text(hjust = 0.5, face = 'bold', size = 13) 
        )
      
      
      p1 <- p1 + geom_point_interactive(aes(tooltip = htmlEscape(paste0(m_title, ", ", thtr_rel_year), TRUE)))
      
      p1 <- girafe(code = print(p1), width_svg = 8)
      
      
      girafe_options(p1, opts_tooltip(css = tooltip_css, use_fill=TRUE))
      
    } else if (length(input$pfCheckBox) == 1 & input$pfCheckBox == "boxPass"){
      p2 <- filtered_data1() %>%
        ggplot(aes(thtr_rel_year, avg_score, colour=bechdel, alpha = bechdel)) +
        geom_point() +
        ylim(0,100) +
        scale_alpha_discrete(range=c(0.10, 1)) +
        ggtitle("Over time, do more and better movies pass the Bechdel Test?")+
        xlab("US Theatre Release Year")+
        ylab("Average Rotten Tomatoes Score")+
        labs(colour="Bechdel Test \n Grade")+
        guides(alpha=FALSE)+
        scale_color_manual(values = rev(brewer.pal(n=3, "Set2")))+
        theme(
          text = element_text(family = ""),
          plot.title = element_text(hjust = 0.5, face = 'bold', size = 13))
      
      p2 <- p2 + geom_point_interactive(aes(tooltip = htmlEscape(paste0(m_title, ", ", thtr_rel_year), TRUE)))
      
      p2 <- girafe(code = print(p2), width_svg = 8)
      
      girafe_options(p2, opts_tooltip(css = tooltip_css, use_fill=TRUE))
      
    } else {
      p3 <- filtered_data1() %>%
        ggplot(aes(thtr_rel_year, avg_score, colour=bechdel, alpha = bechdel)) +
        geom_point() +
        ylim(0,100) +
        scale_alpha_discrete(range=c(1, 0.10)) + 
        ggtitle("Over time, do more and better movies pass the Bechdel Test?")+
        xlab("US Theatre Release Year")+
        ylab("Average Rotten Tomatoes Score") +
        labs(colour="Bechdel Test \n Grade")+
        scale_color_manual(values = rev(brewer.pal(n=3, "Set2")))+
        guides(alpha=FALSE)+
        theme(
          text = element_text(family = ""),
          plot.title = element_text(hjust = 0.5, face = 'bold', size = 13))
      
      p3 <- p3 + geom_point_interactive(aes(tooltip = htmlEscape(paste0(m_title, ", ", thtr_rel_year), TRUE)))
      
      p3 <- girafe(code = print(p3), width_svg = 8)
      
      girafe_options(p3, opts_tooltip(css = tooltip_css, use_fill=TRUE))
      
    }
    
  })
  
  output$q2 <- renderText({
    "How many movies pass the Bechdel Test per year? Are they any good?"
  })

  
  output$summaryText1.1 <- renderText({
    movies1 <- nrow(filtered_data1())
    
    if (is.null(movies1)) {
      movies1 <- 0
      movies1PercentPass <- 0
      movies1PercentFail <- 0
    }
    paste0("We found ", movies1, " movies.")
  })
  
  output$summaryText1.2 <- renderText({
    movies1 <- nrow(filtered_data1())
    
    movies1_pass <- filtered_data1() %>% 
      filter(bechdel == "PASS") %>% 
      nrow()
    
    movies1_fail <- filtered_data1() %>% 
      filter(bechdel == "FAIL") %>% 
      nrow()
    
    movies1PercentPass <- round((movies1_pass/movies1) * 100, 2)
    movies1PercentFail <- round((movies1_fail/movies1) * 100, 2)
    
    
    if (is.null(movies1)) {
      movies1 <- 0
    }
    paste0(movies1PercentPass, "% (",movies1_pass, " movies)",
           " pass and ", 
           movies1PercentFail, "% (", movies1_fail, " movies)",
           " fail.")
  })
  
  #Plot 2
  filtered_data2 <- reactive({ data %>%
      filter(avg_score > input$scoreInput2[1], avg_score < input$scoreInput2[2]) %>%
      select(thtr_rel_year, bechdel)})
  
  output$plot2 <- renderPlot({
    
    melt(filtered_data2()) %>%
      ggplot(aes(value, fill=bechdel)) +
      geom_histogram(bins=10, position = 'dodge') +
      ggtitle("How Many Movies Pass the Bechdel Test per Year?")+
      ylim(0,25) +
      xlab("US Theatre Release Year")+
      ylab("Count") +
      labs(fill="Bechdel Test \n Grade")+
      scale_fill_manual(values = rev(brewer.pal(n=3, "Set2"))) + 
      theme(
        text = element_text(family = ""),
        plot.title = element_text(hjust = 0.5, face = 'bold', size = 17),
        axis.text = element_text(size = 14),
        axis.title = element_text(size = 14),
        legend.text = element_text(size = 12),
        legend.title = element_text(size = 14)) 
  })
  
  #Plot 3
  output$typeSelectOutput <- renderUI({
    
    selectInput("typeInput", "Genre",
                sort(unique(data$genre)),
                multiple = TRUE,
                selected = c("Drama", "Comedy", "Action & Adventure", "Mystery & Suspense"))})
  
  filtered_data3 <- reactive({ data %>%
      filter(genre %in% input$typeInput) })
  
  output$plot3 <- renderPlot({
    
    if (is.null(input$pfCheckBox2) | length(input$pfCheckBox2) == 2){
      
      filtered_data3() %>%
        ggplot(aes(genre, avg_score, colour=bechdel)) +
        geom_jitter(position=position_jitterdodge(seed = 100) ) +
        
        ylim(0,100) +
        xlab("Genre")+
        ylab("Average Rotten Tomatoes Score") +
        labs(colour="Bechdel Test \nGrade") + 
        ggtitle("In terms of passing the Bechdel Test, does genre matter?")+
        scale_color_manual(values = rev(brewer.pal(n=3, "Set2")))+
        theme(
          text = element_text(family = ""),
          plot.title = element_text(hjust = 0.5, face = 'bold', size = 17),
          axis.text = element_text(size = 14),
          axis.title = element_text(size = 14),
          legend.text = element_text(size = 12),
          legend.title = element_text(size = 14)) 
      
      
      
    } else if (length(input$pfCheckBox2) == 1 & input$pfCheckBox2 == "boxPass2"){
      
      filtered_data3() %>%
        ggplot(aes(genre, avg_score, colour=bechdel, alpha = bechdel)) +
        geom_jitter(position=position_jitterdodge(seed = 100) ) +
        
        scale_alpha_discrete(range=c(0.10, 1)) +
        ylim(0,100) +
        xlab("Genre")+
        ylab("Average Rotten Tomatoes Score") +
        labs(colour="Bechdel Test \nGrade") +
        scale_color_manual(values = rev(brewer.pal(n=3, "Set2")))+
        guides(alpha=FALSE) +
        ggtitle("In terms of passing the Bechdel Test, does genre matter?")+
        theme(
          text = element_text(family = ""),
          plot.title = element_text(hjust = 0.5, face = 'bold', size = 17),
          axis.text = element_text(size = 14),
          axis.title = element_text(size = 14),
          legend.text = element_text(size = 12),
          legend.title = element_text(size = 14)) 
      
      
    } else {
      
      filtered_data3() %>%
        ggplot(aes(genre, avg_score, colour=bechdel, alpha = bechdel)) +
        geom_jitter(position=position_jitterdodge(seed = 100) ) +
        
        scale_alpha_discrete(range=c(1, 0.10)) +
        ylim(0,100) +
        xlab("Genre")+
        ylab("Average Rotten Tomatoes Score") +
        labs(colour="Bechdel Test \nGrade") +
        scale_color_manual(values = rev(brewer.pal(n=3, "Set2")))+
        guides(alpha=FALSE) +
        theme(
          text = element_text(family = ""),
          plot.title = element_text(hjust = 0.5, face = 'bold', size = 17),
          axis.text = element_text(size = 14),
          axis.title = element_text(size = 14),
          legend.text = element_text(size = 12),
          legend.title = element_text(size = 14)) 
          
          
        }
  })
  
  #Downoad Button for Tab 1
  output$download1 <- downloadHandler(
    filename = function() {
      paste("bechdel-test-movies", Sys.Date(), ".csv", sep = "")
    },
    content = function(file) {
      write.csv(filtered_data1(), file, row.names = FALSE)})
  
  #Downoad Button for Tab 2
  output$download2 <- downloadHandler(
    filename = function() {
      paste("bechdel-test-movies", Sys.Date(), ".csv", sep = "")
    },
    content = function(file) {
      write.csv(filtered_data2(), file, row.names = FALSE)})
  
  #Downoad Button for Tab 3
  output$download3 <- downloadHandler(
    filename = function() {
      paste("bechdel-test-movies", Sys.Date(), ".csv", sep = "")
    },
    content = function(file) {
      write.csv(filtered_data3(), file, row.names = FALSE)})
  
}

# Run the application 
shinyApp(ui = ui, server = server)