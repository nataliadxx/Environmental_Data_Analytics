library(shiny)
library(ggplot2)
library(colourpicker)


# ui
ui <- navbarPage('probability distributions', id = 'nav', # specifies panels at the top
                 # normal distribution - this tab is working properly
                 tabPanel('normal',
                          headerPanel(withMathJax('$$f(x) = \\frac{1}{\\sigma\\sqrt{2\\pi}} e^\\frac{-(x-\\mu)^{2}}{2\\sigma^2}$$')),
                          sidebarLayout(
                            sidebarPanel(
                              sliderInput('nn',
                                          'sample size',
                                          min = 0,
                                          max = 500,
                                          value = 100),
                              sliderInput('mu', 
                                          withMathJax('$$\\mu$$'),
                                          min = -5,
                                          max = 5,
                                          value = 0,
                                          step = 0.1),
                              sliderInput('sigma', 
                                          withMathJax('$$\\sigma$$'),
                                          min = 0.01,
                                          max = 10,
                                          value = 5,
                                          step = 0.1),
                              checkboxInput('nhist', label = 'histogram', value = TRUE), 
                              checkboxInput('ndens', label = 'density', value = TRUE),
                              colourInput('ncol', label = 'select a color', value = '#FF6666')
                            ),
                            mainPanel(
                              tabsetPanel(position = 'below',
                                          tabPanel('distribution', plotOutput('ndist')),
                                          tabPanel('plot', plotOutput('nplot')),
                                          tabPanel('test', verbatimTextOutput('ntest')))
                            )
                          )
                 ),
                 # poisson distribution
                 tabPanel('poisson',
                          headerPanel(withMathJax('$$P(x, \\lambda) = \\frac{e^{-\\lambda}\\lambda^x}{x!}$$')),
                          sidebarLayout(
                            sidebarPanel(
                              sliderInput('pn',
                                          'sample size'),
                              sliderInput('lambda',
                                          '$$\\lambda$$'),
                              checkboxInput('phist', label = 'histogram', value = TRUE), 
                              checkboxInput('pdens', label = 'density', value = TRUE),
                              colourInput('pcol', label = 'select a color')
                            ),
                            mainPanel(
                              tabsetPanel(position = 'below',
                                          tabPanel('distribution', plotOutput('pdist')),
                                          tabPanel('plot', plotOutput('pplot')),
                                          tabPanel('test', verbatimTextOutput('ptest')))
                            )
                          )
                 ),
                 # binomial distribution
                 tabPanel('binomial',
                          headerPanel(withMathJax('$$P(x, p, n) = \\binom{n}{k}p^x(1-p)^{(n-x)}$$')),
                          sidebarLayout(
                            sidebarPanel(
                              sliderInput('bn',
                                          'sample size',
                                          min = 0,
                                          max = 500,
                                          value = 100),
                              sliderInput('bsize',
                                          'number of trials',
                                          min = 0,
                                          max = 20,
                                          value = 10),
                              sliderInput('bprob',
                                          'probability'),
                              checkboxInput('bhist', label = 'histogram', value = TRUE), 
                              checkboxInput('bdens', label = 'density', value = TRUE),
                              colourInput('bcol', label = 'select a color', value = '#FF6666')
                            ),
                            mainPanel(
                              tabsetPanel(position = 'below',
                                          tabPanel('distribution', plotOutput('bdist')),
                                          tabPanel('plot', plotOutput('bplot')),
                                          tabPanel('test', verbatimTextOutput('btest')))
                            )
                          )
                 ),
                 # gamma distribution
                 tabPanel('gamma',
                          headerPanel(withMathJax()),
                          sidebarLayout(
                            sidebarPanel(
                              sliderInput('gn',
                                          'sample size',
                                          min = 0,
                                          max = 500,
                                          value = 100),
                              sliderInput('gshape',
                                          'shape parameter',
                                          min = 0,
                                          max = 10,
                                          value = 1,
                                          step = 0.1),
                              sliderInput('grate',
                                          'rate parameter',
                                          min = 0,
                                          max = 10,
                                          value = 1,
                                          step = 0.1),
                              checkboxInput('ghist', label = 'histogram'), 
                              checkboxInput('gdens', label = 'density'),
                              colourInput('gcol', label = 'select a color', value = '#FF6666')
                            ),
                            mainPanel(
                              tabsetPanel(position = 'below',
                                          tabPanel('distribution', plotOutput('gdist')),
                                          tabPanel('plot', plotOutput('gplot')),
                                          tabPanel('test', verbatimTextOutput('gtest')))
                            )
                          )
                 )
)


# server
server <- function(input, output) {
  
  # normal distribution 
    # distribution plot
  output$ndist <- renderPlot({ 
    
    n <- input$nn
    if(n < 25){
      bins <- 10
    } else if(n < 50){
      bins <- 20
    } else if(n <= 500){
      bins <- 30
    }
    
    set.seed(1001) 
    
    x <- rnorm(input$nn, input$mu, input$sigma) 
    
    p <- ggplot() + scale_x_continuous(limits = c(-20, 20))
    if(input$nhist) p <- p + geom_histogram(aes(x, y = ..density..), bins = bins, colour = 'black', fill = 'white') 
    if(input$ndens) p <- p + geom_density(aes(x), alpha = 0.2, fill = input$ncol) 
    p + theme_minimal()
  })
    # qq plot
  
  output$nplot <- renderPlot({
    set.seed(1001) 
    
    x <- rnorm(input$nn, input$mu, input$sigma) 
    
    qqnorm(x); qqline(x)
  })
    # shapiro wilks test
  
  output$ntest <- renderPrint({
    set.seed(1001) 
    
    x <- rnorm(input$nn, input$mu, input$sigma)
    
    test <- shapiro.test(x)
    test
  })
  
  # poisson distribution
    # distribution plot
  
  output$pdist <- renderPlot({
    
    n <- input$pn
    if(n < 25){
      bins <- 10
    } else if(n < 50){
      bins <- 20
    } else if(n <= 500){
      bins <- 30
    }
    
    set.seed(1001)
    
    x <- rpois(input$pn, input$lambda) 
    
    p <- ggplot() + scale_x_continuous(limits = c(0, 20))

    p + theme_minimal()
  })
    # qq plot
  
  output$pplot <- renderPlot({
    set.seed(1001)
    
    x <- rpois(input$pn, input$lambda) 
    
    qqnorm(x); qqline(x)
  })
    # shapiro wilks test
  
  output$ptest <- renderPrint({
    set.seed(1001) 
    
    x <- rpois(input$pn, input$lambda)
    
    test <- shapiro.test(x)
    test
  })
  
  # binomial distribution
    # distribution plot
  
  output$bdist <- renderPlot({
    
    n <- input$bn
    if(n < 25){
      bins <- 10
    } else if(n < 50){
      bins <- 20
    } else if(n <= 500){
      bins <- 30
    }
    
    set.seed(1001) 
    
    x <- rbinom(input$bn, input$bsize, input$bprob)
    
    p <- ggplot() 
    if(input$bhist) p <- p + geom_histogram(aes(x, y = ..density..), bins = bins, colour = 'black', fill = 'white')
    if(input$bdens) p <- p + geom_density(aes(x), alpha = 0.2, fill = input$bcol)
    p + theme_minimal()
  })
  
    # qq plot
  output$bplot <- renderPlot({
    set.seed(1001) 
    
    x <- rbinom(input$bn, input$bsize, input$bprob) 
    
    qqnorm(x); qqline(x)
  }
  
    # shapiro wilks test
  
  output$btest <- renderPrint({
    set.seed(1001) 
    
    x <- rbinom(input$bn, input$bsize, input$bprob) 
    
    test <- shapiro.test(x)
    test
  })
  
  
  # gamma distribution
    # distribution plot
  
  output$gdist <- renderPlot({ 
    
    n <- input$gn
    if(n < 25){
      bins <- 10
    } else if(n < 50){
      bins <- 20
    } else if(n <= 500){
      bins <- 30
    }
    
    set.seed(1001) 
    
    x <- rgamma() 
    
    p <- ggplot() + scale_x_continuous(limits = c(0, 20))
    if(input$ghist) p <- p + geom_histogram(aes(x, y = ..density..), bins = bins, colour = 'black', fill = 'white') # add hist if checked
    if(input$gdens) p <- p + geom_density(aes(x), alpha = 0.2, fill = input$gcol) # add density if checked
    p + theme_minimal()
  })
    # qq plot
  
  output$gplot <- renderPlot({
    set.seed(1001)
    
    x <- rgamma() 
    
    qqnorm(x); qqline(x)
  })
    # shapiro wilks test
  
  output$gtest <- renderPrint({
    set.seed(1001) 
    
    x <- rgamma()
    
    test <- shapiro.test(x)
    test
  })
  
}

# run application
shinyApp(ui = ui, server = server)

