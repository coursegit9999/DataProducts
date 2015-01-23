library("dplyr")

vehicles <- read.csv("vehicles.csv")

vmpg <- filter(vehicles, year >= 2000)
vmpg <- select(vmpg, year, VClass, cylinders, drive, trany, UCity, UHighway)

vmpg$Year <- vmpg$year
vmpg$Cylinders <- vmpg$cylinders

vmpg$Type <- "Car"
vmpg$Type <- ifelse(grepl("vans",tolower(vmpg$VClass), fixed=TRUE), "Van", vmpg$Type )
vmpg$Type <- ifelse(grepl("minivan",tolower(vmpg$VClass), fixed=TRUE), "MiniVan", vmpg$Type )
vmpg$Type <- ifelse(grepl("wagon",tolower(vmpg$VClass), fixed=TRUE), "Wagon", vmpg$Type )
vmpg$Type <- ifelse(grepl("truck",tolower(vmpg$VClass), fixed=TRUE), "Truck", vmpg$Type )
vmpg$Type <- ifelse(grepl("special",tolower(vmpg$VClass), fixed=TRUE), "Special Purpose", vmpg$Type )
vmpg$Type <- ifelse(grepl("sport",tolower(vmpg$VClass), fixed=TRUE), "SUV", vmpg$Type )
vmpg$Type <- as.factor(vmpg$Type)

vmpg$Drive <- "Front"
vmpg$Drive <- ifelse(grepl("rear",tolower(vmpg$drive), fixed=TRUE), "Rear", vmpg$Drive )
vmpg$Drive <- ifelse(grepl("4",tolower(vmpg$drive), fixed=TRUE), "Four/All", vmpg$Drive )
vmpg$Drive <- ifelse(grepl("all",tolower(vmpg$drive), fixed=TRUE), "Four/All", vmpg$Drive )
vmpg$Drive <- as.factor(vmpg$Drive)

vmpg$Transmission <- "Auto"
vmpg$Transmission <- ifelse(grepl("manual",tolower(vmpg$trany), fixed=TRUE), "Manual", vmpg$Transmission )
vmpg$Transmission <- as.factor(vmpg$Transmission)

vmpg$AvgMPG <- (vmpg$UCity + vmpg$UHighway)/2

vmpg <- select(vmpg, Year, Type, Cylinders, Drive, Transmission, AvgMPG)
fit <- lm(AvgMPG ~ ., data=vmpg)

calcMPG <- function( vtmp, year, type, cyl, drive, trans) {
    vtmp[1,1] <- year
    vtmp[1,2] <- type
    vtmp[1,3] <- cyl
    vtmp[1,4] <- drive
    vtmp[1,5] <- trans
    vtmp[1,6] <- NA           
    tmp <- predict(fit,vtmp[1,])[[1]]
    tmp
}

calcCost <- function( miles, gas, mpg) {
    tmp <- (miles / mpg)*gas
    tmp
} 


shinyServer(
    function(input, output) {

        miles <- reactive({ as.numeric(input$miles) })
        gascost <- reactive({ as.numeric(input$gascost) })
        
        avgmpg <- reactive({
            vtmp <- vmpg[0,]    
            year <- as.numeric(input$year) 
            type <- input$type
            cyl <- as.numeric(input$cyl) 
            drive <- input$drive
            trans <- input$trans
            calcMPG( vtmp, year, type, cyl, drive, trans )
        })
            
        output$ESTMPG <- renderPrint({
                input$Submit == 1
                avgmpg()
            })
        
        output$FuelCost <- renderPrint({
                input$Submit == 1
                calcCost( miles(), gascost(), avgmpg() )
            })     
    }
)