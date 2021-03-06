---
  layout: atsa
---
  
  Project
-------


Summary of Tasks:
  
- Submit a data set;
- Choose a data set for ARIMA modeling from the approved datasets:
    - [Anomaly](https://github.com/maryclare/atsa/blob/master/content/data/Anomaly.RData)
        - Monthly measurements of the average deviation of temperature measurements from meterological stations and the ocean from their 1951-1980 averages. Measured from 1980 into 2018. This data was downloaded from [NASA](https://data.giss.nasa.gov/gistemp/).
    - [Stocks](https://github.com/maryclare/atsa/blob/master/content/data/Stocks.RData)
        - Daily adjusted closing prices of Apple, Adobe, Amazon, Facebook, Google, and the S&P 500 from the beginning of 2017 into 2019. This data was downloaded from [Yahoo Finance](https://finance.yahoo.com). Note that the daily measurements do not include weekends, so a "week" of data corresponds to five consecutive days. We will just treat Friday to Monday as one unit of time apart.
    - [Yields](https://github.com/maryclare/atsa/blob/master/content/data/Yields.RData)
        - Daily three month and ten year treasury yield curve rates. This data was downloaded from the [United States Treasury](https://www.treasury.gov/resource-center/data-chart-center/interest-rates/pages/textview.aspx?data=yield). Note that the daily measurements do not include weekends, so a "week" of data corresponds to five consecutive days. We will just treat Friday to Monday as one unit of time apart.

- Submit first analysis as part of Homework 7
- Choose a data set for state-space modeling from the approved datasets:
    - [Anomaly](https://github.com/maryclare/atsa/blob/master/content/data/Anomaly.RData)
        - Monthly measurements of the average deviation of temperature measurements from meterological stations and the ocean from their 1951-1980 averages. Measured from 1980 into 2018. This data was downloaded from [NASA](https://data.giss.nasa.gov/gistemp/).
    - [Stocks](https://github.com/maryclare/atsa/blob/master/content/data/Stocks.RData)
        - Daily adjusted closing prices of Apple, Adobe, Amazon, Facebook, Google, and the S&P 500 from the beginning of 2017 into 2019. This data was downloaded from [Yahoo Finance](https://finance.yahoo.com). Note that the daily measurements do not include weekends, so a "week" of data corresponds to five consecutive days. We will just treat Friday to Monday as one unit of time apart.
    - [Yields](https://github.com/maryclare/atsa/blob/master/content/data/Yields.RData)
        - Daily three month and ten year treasury yield curve rates. This data was downloaded from the [United States Treasury](https://www.treasury.gov/resource-center/data-chart-center/interest-rates/pages/textview.aspx?data=yield). Note that the daily measurements do not include weekends, so a "week" of data corresponds to five consecutive days. We will just treat Friday to Monday as one unit of time apart.
    - [Electricity](https://github.com/maryclare/atsa/blob/master/content/data/Electricity.RData)
        - Monthly electricity production in Australia measured in million kilowatt hours, from January 1956 to August 1995. This data was downloaded from [Data Market](https://datamarket.com/data/set/22l0/monthly-electricity-production-in-australia-million-kilowatt-hours-jan-1956-aug-1995#!ds=22l0&display=line), and originally collected by the Australian Bureau of Statistics.
    - [Air](https://github.com/maryclare/atsa/blob/master/content/data/Air.RData)
        - Hourly air quality measurements of the true amount of airborne carbon dioxide, an approximate measure of airborne carbon dioxide, the temperature, relative humidity, and humidity for 9357 hours starting on December, 1899. The data was downloaded from the [UCI Machine Learning Repository](http://archive.ics.uci.edu/ml/datasets/air+quality).
    - [Beijing](https://github.com/maryclare/atsa/blob/master/content/data/Beijing.RData)
        - Hourly PM2.5 concentration (a measure of air pollution), dew point, temperature, air pressure, wind speed, hours of snow, and hours of rain in measured at the US Embassy in Beijing, China measured from January 1, 2010 to December 31, 2014. This data was downloaded from the [UCI Machine Learning Respository](https://archive.ics.uci.edu/ml/datasets/Beijing+PM2.5+Data).

- Submit second analysis as part of Homework 8
- Submit final paper on Monday, 5/13/19 by 11:59pm. See below for guidelines.

## Rubric for Final Paper
  
The final project will be:
- 5 pages long including figures and tables, excluding `R` code and references;
- Double spaced, with font size 12 and approximate 1 inch margins;
    - If you are using `R` Markdown and cannot figure out how to achieve double spacing, you can single-space but then make sure that your final draft is no more than 3 pages long;
- Written using the word processing software of your choosing;
- Be accompanied by `R` code that reproduces all results.
  
It will be graded out of 25 points as follows:


- (2 points) Introduction and exploratory analysis of ARIMA data from HW 7
- (7.5 points) First analysis of ARIMA data from HW 7 but with last 10% of observations witheld
    - Repeat the univariate time series analysis analysis requested in HW 7 using just the first time series but with the last 10% of observations withheld, making any changes that you think are needed. Make sure you justify any changes. Examples of (**optional**) changes include:
        - Corrections of mistakes that were identified on HW 7
        - Performing a variance stabilizing transformation
        - Adding one or more covariates
    - Select and fit **one** **VARMA** model that simultaneously models at least two of the time series simultaneously with the last 10% of observations withheld. Select the specific **VARMA** model based on AIC/AICc/SIC, and justify your choice.
- (3 points) Conclusions of analysis of ARIMA data from HW 7
    - Compare forecasts and 95% intervals for the remaining 10% of observations from the first time series, alongside the true values.
    - Indicate which of the four models (three ARIMA models of the form ARIMA(p, d, 0), ARIMA(0, d, q), and ARIMA(p, d q) as discussed in HW 7), based on the kinds of models you fit in HW 8, and one multivariate) you prefer and justify your conclusion.  
- (2 points) Introduction and exploratory analyses of state-space data from HW 8
- (7.5 points) Second analysis, of state-space data from HW 8 but with last 10% of observations witheld
    - Repeat the univariate state-space analysis from HW 8, using just the first time series but with the last 10% of observations withheld, making any changes that you think are needed. Make sure you justify any changes. Examples of (**optional**) changes include:
        - Corrections of mistakes that were identified on HW 8
        - Changing the definition of a season to account for seasonality
        - Performing a variance stabilizing transformation
        - Adding one or more additional covariates
    - Select and fit **one** multivariate state-space model with the last 10% of observations withheld. For your multivariate state-space model, you can make the observation equation multivariate, the state equation multivariate (this is what you have to do you chose the `Electricity` data set, which is univariate), or both the observation and state equations multivariate. Select the specific multivariate state-space model based on AIC/AICc/SIC, and justify your choice.
- (3 points) Conclusions of analysis of state-space data from HW 8
    - Compare forecasts and 95% intervals for the remaining 10% of observations from the first time series, alongside the true values.
    - Indicate which of the two models you prefer (one univariate, based on the kinds of models you fit in HW 8, and one multivariate) and justify your conclusions.

One bonus point will be added if the student submitted a suggested dataset by 12:00pm noon on Sunday, March 31.

Some miscellaneous notes:

  - Introduction and exploratory analysis could include ACF/PACF/smoothed periodogram/subset mean/subset variance plots, and a discussion of any possibly unusual or complicated features of the data, etc.
  - Any time you select a model based on one of several possible tests or one of several possible criteria, justify the test or criteria you use! For instance, if you use augmented Dickey-Fuller comment on why you do that instead of using Dickey-Fuller or Phillips-Perron. Similarly, if you use AICc, explain why you do that instead of using AIC or SIC.  
  
  
## Submitting a Potential Dataset

Submissions submitted by 12:00pm noon on Sunday, March 31 will be considered. It is ok (and encouraged) to submit as a group! For full consideration, the submission should include the data (in whatever format you have it in, e.g. Excel or .csv) and an at most one page description which includes:

- One to five sentences describing the data, specifically:
    - The names of the students in the group;
    - How the data was obtained;
    - What the data are measuring;
    - The number of observations (if the data you're interested in contains multiple time series, just describe the number of observations for a single one)
    - The amount of time between each observed value.
    
- A single time series plot (if the data you're interested in contains multiple time series, just pick one);
- A sample autocorrelation plot;
- A sample partial autocorrelation plot.

All students who submit at least one potential dataset will have a single bonus point added to their final project grade.

Here are some links to some places to look for data, which range from data repositories that contain cleaned datasets that are often used to demonstrate various concepts to places where raw (uncleaned) time series data is available for download:
  
- [UCI Machine Learning Repository](https://archive.ics.uci.edu/ml/datasets.html?format=&task=&att=&area=&numAtt=&numIns=&type=ts&sort=nameUp&view=table)
- [US Department of the Treasury Finance Data Directory](https://www.treasury.gov/resource-center/financial-education/Pages/fdd.aspx)
- [Google Trends](https://trends.google.com/trends/?ctab=0&date=all&geo=all&q=google&sort=0)
- [Time Series Data Library](https://pkg.yangzhuoranyang.com/tsdl/)
- [City of Chicago Data Portal](https://data.cityofchicago.org)
- [US Government Open Data Portal](https://www.data.gov)
- [`babynames` Package for `R`](https://cran.r-project.org/web/packages/babynames/babynames.pdf)
- [ASA Statistics in Sports Section's Recommended Data Resources](https://community.amstat.org/sis/sportsdataresources)
- [`nbastatR` Package for `R`](http://asbcllc.com/nbastatR/)

Before spring break, I will collect potential datasets. Over spring break, I will explore the submitted data and decide which ones seem well suited for the project. 
   
  