suppressMessages(library(knitr))
suppressMessages(library(tidyr))
suppressMessages(library(ggplot2))
suppressMessages(require(dplyr))
# 
suppressMessages(library(graphics))
suppressMessages(library(plotly))
suppressMessages(library(ggthemes))
suppressMessages(library(Amelia))
suppressMessages(library(scales))
suppressMessages(library(shiny))
suppressMessages(library(shinydashboard))

 options(warn=-1)
setwd("~/GitHub/MSDA_608/WEEK3")
df <- read.csv("cleaned-cdc-mortality-1999-2010-2.csv", sep = ",", header = TRUE)
yr_2010_df <- filter(df, Year >=2010)
# #     
# 
df2 <- yr_2010_df %>%
   group_by(ICD.Chapter, State, Year, Crude.Rate) %>%
   summarize(State_Count = n()) %>%
   mutate(rank = dense_rank(desc(Crude.Rate)))

Name <- names(df2) 

shinyServer(
  pageWithSidebar(
    headerPanel( "IS 608 Knowledge And Visual Analytics - WEEK 3\n|
  \ Data Analytics  \n| Musa Ganiyu"),
    sidebarPanel(
      fileInput("df", "Click Here To Upload The Dataset"),
      h5("max dataset size is 10 MB"),
      radioButtons("sep", "seperator", choices = c(comma=",", Tilde="~", minus="-", Period=".")),
      checkboxInput("header", "Header?"),
      sliderInput('sampleSize', 'Sample Size', min=1, max=nrow(df2), value = 1000, step = 200),
      selectInput("Question", "Please Select Question Number",
                  choices = ("Question_1")),
      
      selectInput('x', 'X', choices = Name, selected = "State"),
      selectInput('y', 'Y', choices = Name, selected = "Crude.Rate"),
      selectInput('color', 'Color', choices = Name, selected = "ICD.Chapter"),
      
      
      selectInput('facet_row', 'Facet Row', c(None = '.', Name), selected = "ICD.Rate"),
      selectInput('facet_col', 'Facet Column', c(None = '.', Name)),
      sliderInput('plotHeight', 'Height of plot (in pixels)', 
                  min = 100, max = 2000, value = 1000)
     
       
    ),
    mainPanel(tableOutput("input_file"),
              tableOutput("df"),
      plotlyOutput('myplot', height = "900px",width = "100%", inline = FALSE)
    )
  )
)







  
  
  
  
  
  
  
  
  
  
  















