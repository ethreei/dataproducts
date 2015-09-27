shinyUI(pageWithSidebar(
    headerPanel("Wilks Calculator"),
    sidebarPanel(
        p('This is a strength calculator that takes your weight into account and how much you lift in three different categories.'),
        p('This is a standardized measurement for lifters around the world to see if you are stronger than others independant of the differences of weight.'),
        p('The result will be a number and a plot will show you relatively how good that is compared to other standards.'),
        numericInput('weight', 'Enter your weight (lbs)', 150, min=0,max=400,step=1),
        numericInput('squat', 'Enter your squat (lbs)', 100, min=0,max=1000,step=10),
        numericInput('bench', 'Enter your bench (lbs)', 100, min=0,max=1000,step=10),
        numericInput('deadlift', 'Enter your deadlift (lbs)', 100, min=0,max=1000,step=10)
    ),
    mainPanel(
        h3('Your wilk score:'),
        verbatimTextOutput("wilk"),
        plotOutput('newplot')
    )
))