library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage( #create the overall page
  
  # Application title
  titlePanel("How do Alignment Properties affect E-value?",
"A. thaliana (Plant) versus C. elegans (Worm) Proteomes"),
  
  # Some helpful information
  helpText("This application creates multiple boxplots to show how alignment properties can influence E-value.",
           "We are interested in testing the hypothesis that an E-value of 0 can be obtained even in alignments", 
           "where there is less than 50% identity between sequences"),
  
  # Sidebar with a radio box to input which trait will be plotted
  sidebarLayout(
    sidebarPanel(
      radioButtons("trait", #the input variable that the value will go into
                   "Choose a trait to display:",
                   c("gaps",
                     "len",
                     "E",
                     "Score")
      )),
    
    # Show a plot of the generated distribution
    mainPanel(plotOutput("boxPlot")
    )
  )
))