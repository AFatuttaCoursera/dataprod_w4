library(shiny)
library(ggplot2)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
    
    output$description <- renderText({ 
        print("Please choose some predictors and how many cars from the dataset to be shown in the plot")
    })
    
   
  output$fitPlot <- renderPlot({
    
      
    
   if (length(input$varSelected) > 0)
   {
      list<-sapply(X = input$varSelected, 
             FUN = function (x) {which(x == names(mtcars))}) 
       
       
      mtcars_temp <- mtcars[, c(1,list)]
      mtcars_temp$name <- rownames(mtcars)
      fit<- lm( mpg ~ . - name , data=mtcars_temp)
      mtcars_temp<-mtcars_temp[1:input$numSel,]
      mtcars_temp$valType <- "Original"
      
      mtcars_plot<-rbind(
          mtcars_temp[,c("mpg","name","valType")],
          cbind(cbind(mpg = predict(fit, mtcars_temp)),name=mtcars_temp$name, valType=rep("Predicted",length(rownames(mtcars_temp))) )
      )
      
      mtcars_plot$valType <- factor(mtcars_plot$valType)
      mtcars_plot$mpg <- as.numeric(mtcars_plot$mpg)
      
      ggplot()+
      geom_point(data=mtcars_plot, ##actual data
                 aes(x = name,
                     y = mpg,
                     colour = valType,
                     shape = valType), 
                 size=3) + 
      labs(colour = "Data origin",shape = "Data origin") +
      xlab("Name") + 
      ylab("MPG") +
      scale_y_continuous( breaks = seq( min(mtcars_plot$mpg) , max(mtcars_plot$mpg), by = 1)
                                 )
      
      
      
   }
      else 
      {
          ggplot()+ ggtitle("No predictor choosen")
      }
       
  })
  
})
