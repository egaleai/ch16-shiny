### Exercise 3 ###

library(shiny)
library(ggplot2)
# Create a shiny server that creates a scatterplot. 
server <- function(input, output) {
  

# It should take as an input the x_var, y_var, color, and size
# Save the result of `renderPlot` to output$scatter
  output$scatter <- renderPlot({
    # Store x and y values to plot
    x_values <- mpg[[input$x_var]]
    y_values <- mpg[[input$y_var]]

    # Store the title of the graph in a variable
    title_graph <- paste0("MPG Dataset: ", input$x_var, "v.s. ", input$y_var)
    
    # Create ggplot scatter
    scatterplot <- ggplot(mpg) +
        geom_point(mapping = aes(x = x_values, y = y_values),
                   color = input$color, size = input$size) +
        labs(title = title_graph, x = input$x_var, y = input$y_var)
    scatterplot
    })
}
shinyServer(server)
