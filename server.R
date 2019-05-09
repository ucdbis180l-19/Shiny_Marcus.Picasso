library(shiny)
library(tidyverse)
library(rsconnect)
deployApp('~/shiny/Shiny_Marcus.Picasso')

plant_worm <- read_tsv("plant_vs_worm.blastout_v2.1.gz",col_names=FALSE)
worm_plant <- read_tsv("worm_vs_plant.blastout_v2.1.gz",col_names=FALSE)

colnames(plant_worm) <- c("query_id",
                          "subject_id",
                          "pct_ident",
                          "len",
                          "mis",
                          "gaps",
                          "qb",
                          "qe",
                          "sb",
                          "se",
                          "E",
                          "Score")

colnames(worm_plant) <- c("query_id",
                          "subject_id",
                          "pct_ident",
                          "len",
                          "mis",
                          "gaps",
                          "qb",
                          "qe",
                          "sb",
                          "se",
                          "E",
                          "Score")

worm_plant <- worm_plant %>% filter(E == 0)
plant_worm <- plant_worm %>% filter(E == 0)

# Define server logic required to draw a boxplot
shinyServer(function(input, output) {
  
  # Expression that generates a boxplot. The expression is
  # wrapped in a call to renderPlot to indicate that:
  #
  #  1) It is "reactive" and therefore should re-execute automatically
  #     when inputs change
  #  2) Its output type is a plot
  
  output$boxPlot <- renderPlot({
    
    # set up the plot
    pl_worm_plant <- ggplot(data= worm_plant,
                 #Use aes_string below so that input$trait is interpreted
                 #correctly.  The other variables need to be quoted 
                 aes_string(x= "pct_ident > 50",
                            y=input$trait
                 )
    )
    pl_worm_plant + geom_boxplot(fill = "red") + ggtitle("Worm blasted to plant")
  })
  output$boxPlot2 <- renderPlot({
    # draw the boxplot for the specified trait
   
    
    pl_plant_worm <- ggplot(data = plant_worm, aes_string(x = "pct_ident > 50",
                                                          y = input$trait))
    pl_plant_worm + geom_boxplot(fill = "green") + ggtitle("Plant blasted to worm")
  })
})
