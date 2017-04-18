#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Motor Trend Magazine - MTCars dataset fitting"),
  
  # Sidebar with a checkbox with the list of available variables
  sidebarLayout(
    sidebarPanel(
        checkboxGroupInput("varSelected", "Variables for the fit:",
                           c("Cylinders" = "cyl",
                             "Transmission" = "am",
                             "Gears" = "gear",
                             "Displacement" = "disp",
                             "Gross horsepower" = "hp",
                             "Rear axle ratio" = "drat",
                             "Weight (1000 lbs)" = "wt",
                             "1/4 mile time (sec)" = "qsec",
                             "V/S" = "vs",
                             "Number of carburetors" = "carb"
                           )),
        sliderInput("numSel",value = 1, min=1,max=32, step=1, label = "Select how many cars to show")
    ),
    # Show a plot of the generated distribution
    mainPanel(
        textOutput("description"),
       plotOutput("fitPlot")
    )
  )
))
