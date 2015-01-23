shinyUI(pageWithSidebar(
    headerPanel("Mile Per Gallon Vehicle Comparison App"),
    sidebarPanel(
        textInput(inputId="miles", label = "Miles driven per year:", value="12000"),
        textInput(inputId="gascost", label = "Cost per gallon of gas:", value="2.50"),
        sliderInput(inputId="year", label = "Vehicle Year:", value = 2000, min = 2000, max = 2016),
        selectInput(inputId="type", label = "Vehicle Type:", 
                    choices = list("Car" = "Car", "Van" = "Van", "Minivan" = "Minivan", 
                                   "Wagon" = "Wagon", "Truck" = "Truck", "Special Purpose" = "Special Purpose", 
                                   "SUV" = "SUV"), 
                    selected = "Car"),
        sliderInput(inputId="cyl", label = "Cylinders:", value = 4, min = 2, max = 16),
        selectInput(inputId="drive", label = "Drive Type:", 
                    choices = list("Front" = "Front", "Rear" = "Rear", "Four/All" = "Four/All"), 
                    selected = "Front"),
        selectInput(inputId="trans", label = "Transmission Type:", 
                    choices = list("Auto" = "Auto", "Manual" = "Manual"), 
                    selected = "Auto"),
        submitButton('Submit')
    ),
    mainPanel(
        p('Estimated MPG:'),
        verbatimTextOutput('ESTMPG'),
        ('Estimated Annual Fuel Cost:'),
        verbatimTextOutput('FuelCost'),
        p('Use the options at the left to select parameters that match the type of vehicles you wish to review. Enter your average miles driven each year and the estimated price of a gallon of gas. After pressing the submit button the application will calculate an average mile per gallon for that vehicle type and a related estimated cost of driving that vehicle for one year. The app is designed to help assess the usage cost of each type of vehicle. Buyers can leverage this tool to compare general vehicle attributes and make a decsion on vehicle type, new vs used, engine size, etc that best fits their needs. Data used in this analysis is the vehicles.csv data file from fueleconomy.gov. The years 2000 - 2016 where used to create a linear regression model for estimating average miles per gallon. Data download link: http://www.fueleconomy.gov/feg/download.shtml. Note: If an NA response is received it is because that particular selection of vehicle type, drive type, and transmission type did not have enough entries to calculate a MPG estimate.')
    )
))