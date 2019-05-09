library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage( #create the overall page
  
  # Application title
  titlePanel("How do Alignment Properties affect E-value?",
"A. thaliana (Plant) versus C. elegans (Worm) Proteomes"),
  
  # Some helpful information
  helpText("This application creates multiple boxplots to show how alignment properties can influence E-value.",
           "We are interested in explaining how an E-value of 0 can be obtained even in alignments", 
           "where there is less than 50% identity between sequences",
           
           "Our hypothesis is that E-Values of 0 from sequences with less than %50 identity are relatively longer", 
           "sequences than those who are greater than %50 identity.",
           "As you can see from the boxplots of alignments whom recorded an E-value of 0, those that have less than", 
           "50% identity have greater sequence length."),
  
  # Sidebar with a radio box to input which trait will be plotted
  sidebarLayout(
    sidebarPanel(
      radioButtons("trait", #the input variable that the value will go into
                   "Choose a trait to display:",
                   c("gaps",
                     "len",
                     "Score"
                    )
      )),
    
    # Show a plot of the generated distribution
    mainPanel(plotOutput("boxPlot"), plotOutput("boxPlot2")
    )
  )
))
