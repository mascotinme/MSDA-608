suppressMessages(library(shiny))
suppressMessages(library(shinydashboard))

options(warn=-1)

suppressMessages(library(knitr))
suppressMessages(library(tidyr))
suppressMessages(library(ggplot2))
suppressMessages(require(dplyr))

suppressMessages(library(graphics))
suppressMessages(library(plotly))
suppressMessages(library(ggthemes))
suppressMessages(library(Amelia))
suppressMessages(library(scales))


setwd("~/GitHub/MSDA_608/WEEK3")
df <- read.csv("cleaned-cdc-mortality-1999-2010-2.csv", sep = ",", header = TRUE)
# # 
# 
# 
yr_2010_df <- filter(df, Year >=2010)
#     
# 
df2 <- yr_2010_df %>%
  group_by(ICD.Chapter, State, Year, Crude.Rate) %>%
  summarize(State_Count = n()) %>%
  mutate(rank = dense_rank(desc(Crude.Rate)))

Name <- names(df2)      

shinyServer(function(input, output, session) {
  
  #add reactive data information. Dataset = built in diamonds data
  dataset <- reactive({
    df2[sample(nrow(df2), input$sampleSize),]
  })
  
  output$myplot <- renderPlotly({
    distType <- input$Question
    x <- input$x
    y <- input$y
    color <- input$color
    
    
    
    
    p <- ggplot(dataset(), aes_string(x = input$x, y = input$y, color = input$color)) + 
      geom_point() + coord_flip()
    
    p + geom_raster(aes(fill = dataset$rank), hjust=0.5,
                    vjust=0.5, interpolate=FALSE)
    
    
    facets <- paste(input$facet_row, '~', input$facet_col)
    if (facets != '. ~ .') p <- p + facet_grid(facets)
    
    ggplotly(p) %>% 
      layout(height = input$plotHeight, autosize=TRUE)
    
  })
  
}



)





















