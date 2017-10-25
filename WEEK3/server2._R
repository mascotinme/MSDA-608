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


# setwd("~/GitHub/MSDA_608/WEEK3")
# df <- read.csv("cleaned-cdc-mortality-1999-2010-2.csv", sep = ",", header = TRUE)
# 
# 
# 
# yr_2010_df <- filter(df, Year >=2010)
#     
# df2 <- yr_2010_df %>%
#        group_by(ICD.Chapter, State, Year, Crude.Rate) %>%
#        summarize(State_Count = n()) %>%
#        mutate(rank = dense_rank(desc(Crude.Rate)))
#      



shinyServer(
function(input, output, session){
  output$myplot <- renderPlot({
    distType <- input$Distribution
    size <- input$sampleSize
    
    if(distType == "Normal"){
      randomvec =rnorm(size, mean=as.numeric(input$mean), sd=as.numeric(input$sd))
    }
    
    else {
      randomvec <- rexp(size, rate=1/as.numeric(input$lambda))
    }
    
    hist(randomvec, col="blue")
  })
}
  
  
)
# shinyOptions(function(input, output) {
#   dis <- reactive({
#     df2[, input$df]
#   })
#   
# output$df2 <- renderTable({dis()})
# 
# output$plot <- renderPlotly({
#   with(dis, plotlyOutput(df2, width = "100%", height = "400px", inline = FALSE))
#   })
#  
# 
# 
# output$downloadData <- downloadHandler(
#   filename = function() {
#     paste("cleaned-cdc-mortality-1999-2010-2.csv", "csv", sep=",")
#   },
#   
#   content = function(file){
#     write.csv(dis(), file)
#   }
# )
# 
# output$downloadPlot <- downloadHandler(
#   filename = function() {
#     paste("df2-plot", "png", sep=",")
#   },
#   content = function(file){
#     png(file)
#     with(dis, ggplot(df2, aes(State, Crude.Rate))+
#                   geom_col(aes(colour = ICD.Chapter)) +
#                  labs(title = "Graph Showing The State Against Crude Rate Rank for the 2010") + coord_flip())
#                  
#               # abline(df2$rank, col = "blue")
#                #print(rr))
#     dev.off()
#   
#   }
#  )
# 
# })


# shinyServer(function(input, output) {
#   
#   output$input_file <- renderTable({
#     dataset = input$df
#     if(is.null(dataset)){
#       return()
#     }
#     read.table("C:/Users/mayowa/Downloads/cleaned-cdc-mortality-1999-2010-2.csv", sep = input$sep, header=input$header)
#   }) 
#   
#   output$df <- renderTable({
#     stateFilter <- subset(df, df&State ==input$inState)
#   })
# })
# 

#   output$Plot <- renderPlot({
#     yr_2010_df <- filter(df, Year >=2010)
#     
#     df2 <- yr_2010_df %>%
#       group_by(ICD.Chapter, State, Year, Crude.Rate) %>%
#       summarize(State_Count = n()) %>%
#       mutate(rank = dense_rank(desc(Crude.Rate)))
#     
#     
#     rr <- ggplot(df2, aes(State, Crude.Rate))+
#       geom_col(aes(colour = ICD.Chapter)) +
#       labs(title = "Graph Showing The State Against Crude Rate Rank for the 2010") + coord_flip()
#     ggplotly(rr) 
#    # abline(df2$rank, col = "blue")
#     print(rr)
#   })
  
    
 




# suppressMessages(library(plotly))
# 
# 
# df <- read.csv("https://raw.githubusercontent.com/charleyferrari/CUNY_DATA608/master/lecture3/data/cleaned-cdc-mortality-1999-2010-2.csv", sep = ",", header = TRUE)
# 
# 
# 
# 
# shinyServer(function(input, output){
#   
#   output$histogram <- renderPlot({
#     hist(faithful$eruptions, breaks=input$bins)
#   })
#   
# })
