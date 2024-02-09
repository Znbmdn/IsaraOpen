#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    https://shiny.posit.co/
#

library(shiny)

# Données de recettes
recettes <- data.frame(
  Plat = c("Spaghetti Bolognese", "Chicken Stir-Fry", "Vegetarian Pizza"),
  Cout = c(10, 15, 8),
  Calories = c(500, 600, 400),
  Ingredients = list(c("pâtes", "viande hachée", "sauce tomate"), 
                     c("poulet", "légumes", "sauce soja"), 
                     c("pâte à pizza", "tomates", "fromage"))
)

# Define UI for application that draws a histogram
ui <- fluidPage(

    # Application title
    titlePanel("Good Food"),

    # Entrées 
    sidebarLayout(
      sidebarPanel(
        selectInput("ingredients", "Ingrédients disponibles",
                    choices = unique(unlist(recettes$Ingredients)),
                    multiple = TRUE),
        actionButton("rechercher", "Rechercher")
      ),
      

        # Show a plot of the generated distribution
        mainPanel(
           plotOutput("recettes_table"),
           textOutput("details_recette")
        )
    )
)

# Definir le serveur
server <- function(input, output) {

  #Filtrer les recettes en fonction des ingrédients sélectionnées
  
  recettes_filtrees <- reactive({
    recettes[unlist(recettes$Ingredients) %in% input$ingredients, ]
  })
  
#Recette selectionnée
    output$details_recettes <- renderPlot({
      req(input$rechercher, !is.null(input$recettes_table_rows_selected))
      
      selected_row <- input$recettes_table_rows_selected
      if (length(selected_row) > 0) {
        recette_selectionnee <- recettes_filtrees()[selected_row, ]
        paste("Coût total en euros : €", recette_selectionnee$Cout, "\n",
              "Nombre de calories estimé : ", recette_selectionnee$Calories, " kcal")
      } else {
        "Sélectionnez une recette pour afficher les détails."
      }
    })
    
}
# Run the application 
shinyApp(ui = ui, server = server)

