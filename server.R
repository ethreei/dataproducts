library(shiny)

wilkscore <- function(w,s,d,l) {
    plt <- (s + d + l)/2.20462
    w <- w / 2.20462
    coef <- 500 / (-216.0475144 + 16.2606339 * w - 0.002388645 * w^2 - 0.00113732 * w^3 + 0.00000701863 * w^4 - 0.000000001291 * w^5)
    ws <<- plt * coef
    ws
}

shinyServer(
    function(input, output) {
        output$wilk <- renderPrint({wilkscore(input$weight,input$squat,input$bench,input$deadlift)})
        output$newplot <- renderPlot({
            plot((ws + input$weight - input$weight + input$squat - input$squat + input$bench - input$bench + input$deadlift - input$deadlift), xlab = "", ylab = "Wilk Score", ylim=c(0,750), xaxt='n', cex=5)
            abline(h=100, lwd=1, lty=3)
            abline(h=200, lwd=1, lty=3)
            abline(h=300, lwd=1, lty=3)
            abline(h=400, lwd=1, lty=3)
            abline(h=500, lwd=1, lty=3)
            abline(h=700, lwd=1, lty=3)
            text(x=1.2,y=120,labels = "100 Beginner (<1 Year)")
            text(x=1.2,y=220,labels = "200 Intermediate  (1 Year)")
            text(x=1.2,y=320,labels = "300 Advanced (3 Years)")
            text(x=1.2,y=420,labels = "400 Competitive (5 Years)")
            text(x=1.2,y=520,labels = "500 Olympian (??)")
            text(x=1.2,y=720,labels = "700 Alien (!?!) ")
            
        })
    }
)