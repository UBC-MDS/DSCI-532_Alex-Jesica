library(shiny)
library(tidyverse)
library(ggiraph)
library(htmltools)

#loading data
data <- read.csv("https://raw.githubusercontent.com/jessimk/DSCI-532_Alex-Jesica/master/data/movies_rt_bechdel.csv")



#setting hover css options
tooltip_css <- "font-style:italic;opacity:0.6;color:white;padding:6px;border-radius:5px;"


ui <- 
  fluidPage(

    
    titlePanel("Exploring the Bechdel Test Through Movies 🎥"),
    
    tabsetPanel(
      
      #First Tab & Plot        
      tabPanel("Plot 1",
               sidebarLayout(
                 sidebarPanel(
                   h4(textOutput("q1")),
                   br(),
                   sliderInput("scoreInput1", 
                               "Average Rotten Tomatoes Score:",
                               min = 0, max = 100, value = c(0, 100)),
                   br(),
                   h5(textOutput("summaryText1.1")),
                   br(),
                   h5(textOutput("summaryText1.2")),
                   br(),
                   checkboxGroupInput("pfCheckBox", "Filter by Bechdel Test:",
                                      c("Pass" = "boxPass",
                                        "Fail" = "boxFail")),
                   
                   downloadButton("download1", "Download Results")),
                 
                 mainPanel(
                   ggiraphOutput("plot1")))),
      
      
      #Second Tab & Plot    
      tabPanel("Plot 2",
               sidebarLayout(
                 sidebarPanel(
                   h4(textOutput("q2")),
                   br(),
                   sliderInput("scoreInput2",
                               "Average Rotten Tomatoes Score:",
                               min = 0, max = 100, value = c(0,100)),
                   downloadButton("download2", "Download Results")),
                 
                 mainPanel(
                   plotOutput("plot2")))),
      
      #Third Tab & Plot  
      tabPanel("Plot 3",
               sidebarLayout(
                 sidebarPanel(
                   h4(textOutput("q3")),
                   br(),
                   uiOutput("typeSelectOutput"),
                   downloadButton("download3", "Download Results")),
                 
                 mainPanel(
                   plotOutput("plot3"))))
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
        xlab("US Theatre Release Year")+
        ylab("Average Rotten Tomatoes Score")+
        labs(colour="Bechdel Test Grade")+
        theme(
          text = element_text(family = "")
        )

      
      p1 <- p1 + geom_point_interactive(aes(tooltip = htmlEscape(paste0(m_title, ", ", thtr_rel_year), TRUE)))
      
      p1 <- girafe(code = print(p1))
      
      girafe_options(p1, opts_tooltip(css = tooltip_css, use_fill=TRUE))
      
    } else if (length(input$pfCheckBox) == 1 & input$pfCheckBox == "boxPass"){
      p2 <- filtered_data1() %>%
        ggplot(aes(thtr_rel_year, avg_score, colour=bechdel, alpha = bechdel)) +
        geom_point() +
        ylim(0,100) +
        scale_alpha_discrete(range=c(0.10, 1)) + 
        xlab("US Theatre Release Year")+
        ylab("Average Rotten Tomatoes Score")+
        labs(colour="Bechdel Test Grade")+
        guides(alpha=FALSE)+
        theme(
          text = element_text(family = "")
        )

      
      p2 <- p2 + geom_point_interactive(aes(tooltip = htmlEscape(paste0(m_title, ", ", thtr_rel_year), TRUE)))
      
      p2 <- girafe(code = print(p2))
      
      girafe_options(p2, opts_tooltip(css = tooltip_css, use_fill=TRUE))
      
    } else {
      p3 <- filtered_data1() %>%
        ggplot(aes(thtr_rel_year, avg_score, colour=bechdel, alpha = bechdel)) +
        geom_point() +
        ylim(0,100) +
        scale_alpha_discrete(range=c(1, 0.10)) + 
        xlab("US Theatre Release Year")+
        ylab("Average Rotten Tomatoes Score") +
        labs(colour="Bechdel Test Grade")+
        guides(alpha=FALSE)+
        theme(
          text = element_text(family = )
        )

      
      p3 <- p3 + geom_point_interactive(aes(tooltip = htmlEscape(paste0(m_title, ", ", thtr_rel_year), TRUE)))
      
      p3 <- girafe(code = print(p3))
      
      girafe_options(p3, opts_tooltip(css = tooltip_css, use_fill=TRUE))
      
    }
    
  })
  
  output$q1 <- renderText({
    "Over time, do more and better movies pass the Bechdel Test?"
  })
  
  output$q2 <- renderText({
    "How many movies pass the Bechdel Test per year? Are they any good?"
  })
  
  output$q3 <- renderText({
    "In terms of passing the Bechdel Test, does genre matter?"
  })
  
  output$summaryText1.1 <- renderText({
    movies1 <- nrow(filtered_data1())
    
    if (is.null(movies1)) {
      movies1 <- 0
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
    
    if (is.null(movies1)) {
      movies1 <- 0
    }
    paste0(movies1_pass,
           " pass the Bechdel Test and ",
           movies1_fail,
           " fail.")
  })
  
  #Plot 2
  filtered_data2 <- reactive({ data %>%
      filter(avg_score > input$scoreInput2[1], avg_score < input$scoreInput2[2])})
  
  output$plot2 <- renderPlot({
    
    filtered_data2() %>%
      ggplot(aes(thtr_rel_year, colour=bechdel)) +
      geom_histogram(bins=10) +
      facet_grid(~bechdel) +
      ylim(0,25) +
      xlab("US Theatre Release Year")+
      ylab("Count") +
      labs(colour="Bechdel Test Grade")
      
  })
  
  #Plot 3
  filtered_data3 <- reactive({ data %>%
      filter(genre %in% input$typeInput) })
  
  output$plot3 <- renderPlot({
    
    if (is.null(input$typeInput)) {
      return(NULL)
    }
    
    else {
      filtered_data3() %>%
      ggplot(aes(bechdel, avg_score, colour=bechdel)) +
      geom_jitter() +
      facet_wrap(~genre, ncol = 2) +
      ylim(0,100)+
      xlab("Bechdel Test Grade")+
      ylab("Average Rotten Tomatoes Score") +
      labs(colour="Bechdel Test Grade")
  
    }
    })
  
  output$typeSelectOutput <- renderUI({
    
    selectInput("typeInput", "Product type",
                sort(unique(data$genre)),
                multiple = TRUE,
                selected = c("Drama", "Comedy", "Action & Adventure", "Mystery & Suspense"))})
  
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
