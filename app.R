library(shiny)

ui <- fluidPage(
  
  tags$head(
    tags$style(HTML("
      @import url('https://fonts.googleapis.com/css2?family=Indie+Flower&family=Pacifico&family=Yuji+Syuku&display=swap');
      
      body {
        background-color: #EEF36A;
        color: #3F3047;
        font-family: 'Indie Flower';
        font-size: 20px;
      }
      h2 {
        color: #5171A5;
        font-family: 'Pacifico', sans-serif;
        font-size: 72px;
      }
      h3 {
        color: #3F3047;
        font-family: 'Yuji Syuku', sans-serif;
        font-size: 48px;
      }
      .shiny-input-container {
        color: #474747;
      }"
    )
    )
  ),
  
  titlePanel('MadLibs Play'),
  
  fluidRow(
    column(width = 4,
           textInput('company', 'Name a company that makes a common technology you use (e.g., YouTube)'),
           textInput('slogan', 'Write the motto or slogan of the company (e.g., Broadcast yourself)'),
           textInput('group', 'Name a group of people that has institutional power (plural; e.g., politicians'),
           textInput('function1', 'Name a use of the technology (beginning with a verb that ends in "-ing") '),
           textInput('function2', 'Name a second use of the technology (beginning with a present-tense verb) '),
           textInput('function2', 'Name a third use of the technology (beginning with a present-tense verb) '),
           actionButton('submit', 'Weave the story')
           ),
    column(width = 8,
          tags$h3('Public Service Announcement!'),
          textOutput('madlib')
          )
    ),

)

server <- shinyServer(function(input, output) {
  
  sentence <- eventReactive(input$submit, {
    paste0('After many controversies where citizens have accused us of doublespeak, ',
           input$company,
           ' wants to remind you of our mission: ',
           input$slogan,
           '. Some people say that profits get in the way of our mission to make 
           the world a better place. Many critics have called our product a weapon 
           of oppression. Do not listen to these un-American troublemakers who are 
           only jealous of our immense success! These critics claim that ',
           input$group,
           ' will use our product to harm those under their control by ',
           input$function1,
           '. Some critics even say they feel intimidated by the ability of the technology to ',
           input$function2,
           '. But aren’t ',
           input$group,
           ' also just trying to make the world a better place? Meanwhile, 
           the jealous critics claim that ',
           input$group,
           ' are using the technology to ',
           input$function3,
           ' and that is causing social problems. But come on! Let the free market decide!
           If people did not love ',
           input$company,
           ', then we would not be enjoying such incredible success. 
           Technology is progress, and progress is good!'
    )
  })
  
  output$madlib <- renderText({
    sentence()
  })
})

shinyApp(ui, server)
  