---
title       : Data Products Project
subtitle    : Miles Per Gallon Vehicle Comparison
author      : William Lazorik
job         : 
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : []            # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
knit        : slidify::knit2slides
---

## MPG Comparison - Summary

1. This data product will help individuals understand how their vehicle selections and related fuel efficiency affect their overall costs.
2. How much savings does miles per gallon efficiency offer?
3. What is the best vehicle value for me?
4. How do several basic vehicle characteristics affect MPG?

--- .class #id 

## MPG Comparison - Dataset Overview

1. Leverages the vehicles.csv file from FuelEconomy.gov
2. Contains fuel economy data on vehicles from 1984-2016
3. Only data from 2000-2016 leveraged to eliminate the influence of older vehicles
4. Download link: http://www.fueleconomy.gov/feg/download.shtml

--- .class #id 

## MPG Comparison - Data Processing

1. Filter out older data from 1984 - 1999
2. Narrow the features selected for model creation to year, vehicle type, cylinders, drive type, and transmission type.
3. Combined City and Highway MPG estimates to obtain an Average MPG. Generated a linear model for estimating miles per gallon based on the above five features
4. Combined original factor levels for vehicle type (34), drive (8), and transmission (46) to create a smaller subset of options and make the final product more user friendly 
5. Original Factor Example for Drive Type:

```r
vehicles <- read.csv("D:/R/RClass/DataProducts/ShinyTest1/vehicles.csv")
unique(vehicles$drive)
```

```
## [1] Rear-Wheel Drive           Front-Wheel Drive         
## [3] 4-Wheel or All-Wheel Drive                           
## [5] 2-Wheel Drive              All-Wheel Drive           
## [7] 4-Wheel Drive              Part-time 4-Wheel Drive   
## 8 Levels:  2-Wheel Drive 4-Wheel Drive ... Rear-Wheel Drive
```

--- .class #id 

## MPG Comparison - Linear Model Results

```
Coefficients:       Estimate   Std. Error  t value   Pr(>|t|) 
(Intercept)         -7.811e+02  1.330e+01  -58.708   <2e-16 ***
Year                 4.100e-01  6.618e-03   61.947   <2e-16 ***
TypeMiniVan         -5.331e+00  2.206e-01  -24.165   <2e-16 ***
TypeSpecial Purpose -6.057e+00  5.181e-01  -11.691   <2e-16 ***
TypeSUV             -3.783e+00  7.689e-02  -49.195   <2e-16 ***
TypeTruck           -4.736e+00  1.028e-01  -46.080   <2e-16 ***
TypeVan             -6.221e+00  1.806e-01  -34.434   <2e-16 ***
TypeWagon           -1.291e+00  1.267e-01  -10.194   <2e-16 ***
Cylinders           -2.277e+00  2.011e-02 -113.194   <2e-16 ***
DriveFront           4.037e+00  8.556e-02   47.181   <2e-16 ***
DriveRear            7.491e-01  7.720e-02    9.703   <2e-16 ***
TransmissionManual  -1.719e-01  7.151e-02   -2.404   0.0162 *  
Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
Residual standard error: 3.889 on 17644 degrees of freedom
  (65 observations deleted due to missingness)
Multiple R-squared:  0.7234,    Adjusted R-squared:  0.7233 
F-statistic:  4195 on 11 and 17644 DF,  p-value: < 2.2e-16
```

--- .class #id 

## MPG Comparison - Use It Today!

1. Not a direct vehicle to vehicle comparison
2. Helps buyers assess what car is best for them!
3. Gain general knowledge on which vehicle features impact MPG
4. What are your suggestions for new capabilities to add to this exciting data product?
5. Try it Now! https://wlazorik.shinyapps.io/ShinyTest1/
