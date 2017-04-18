## Introduction

This app is the result of the peer graded assignment of Data Products course on Coursera.org .

The assignment requires to create a Shiny application that make uses of it's potentiality of interaction and graphical capabilities.

This file will explain a bit more about the usage of the app and the data used for it.

## Data

Data used has been taken from MTCars datasets of R,
source Henderson and Velleman (1981), Building multiple regression models interactively. Biometrics, 37, 391-411.

It contains 32 observation and 11 variables about different kind of cars and can be used to derive informations about their mileage per gallon against other charachteristics.

##App
The app opens up with a list of input boxes, a slider and an empty plot area.

To use it, you have to select at least one input boxes, that corresponds to the variables available in the data set except the MPG and how many cars you want to show in the plot.

Once the selection has been done, you will have a plot that shows the current MPG value for the cars and the predicted one used a linear regression model with MPG as outcome and the selected variables as predictor/s.

You can freely select and deselect variables or add more cars to the plot.

Each car is represented with 2 symbols on the plot, the red round dot is the original MPG value on the dataset, the green triangle represent the prediction done with the fitted linear model.

