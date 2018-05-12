# UI for scatterplot
library(shiny)
library(ggplot2)

# Get a vector of column names (from `mpg`) to use as select inputs
select_values <- colnames(mpg)

# Create a shinyUI with a `fluidPage` layout
ui <- fluidPage(
  titlePanel("Participation 6: MPG Dataset Exploration"),
  sidebarLayout(
    sidebarPanel(
      # A page header
      #h1("Participation 6: MPG Dataset Exploration"),
  
      # Add a select input for the x variable
      selectInput("x_var", "X Variable", choices = select_values),
  
      # Add a select input for the y variable
      selectInput("y_var", "Y Variable", choices = select_values),
  
      # Add a sliderInput to set the size of each point
      sliderInput("size", "Size of point", 1, 10, value = 1, step = 1),
  
      # Add a selectInput that allows you to select a color from a list of choices
      selectInput("color", "Color", choices = c("red", "blue", "yellow"))
    ),
    mainPanel(
      # Plot the output with the name "scatter"
      plotOutput("scatter")
    )
  )
)
shinyUI(ui)