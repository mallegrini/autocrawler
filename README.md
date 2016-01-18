# autocrawler
This project contains a python based webcrawler using Scrapy and Selenium which collects data of used cars from autoscout24.de. The collected data was used for a reputation mechanism study title "Reputation in Used Car Market: The Effect of Seller Ratings on Offer Prices on Autoscout24.de" by A. Tobler and K. Siow done at the Department of Sociology, ETH Zürich.

## 1. autocrawler
This folder contains the webcrawler python scripts. The driver.py script runs the [Selenium](http://docs.seleniumhq.org/docs/03_webdriver.jsp) webbrowser automation which submits a search for the cars required for the data collection and iterates the results pages while storing the URLs of the individual car offers into an array. The [Scrapy](http://doc.scrapy.org/en/0.24/index.html) spider "autocrawler_base.py" then opens every URL contained in the array returned by driver.py and stores relevant information of the used cars into an object instance of the "items" class. Finally, autocrawler_base exports the collected data in a specified format (XML, CSV  or JSON) for statistical analysis.

to run the spider with command line (from the autocrawler folder level) and export it into a CSV file named "export.csv":

```
scrapy crawl autocrawler_base -o export.csv
```

## 2. R Script 160110
This folder contains the .R and .Rdata files used for the statistical analysis of collected data. The data of used cars exported from the webcrawler dated 11.05.2015 and 25.10.2015 are available in .csv format. The .R scripts contain the functions used in order to filter the raw data into relevant data frames and to run the proper linear regression models to test the proposed hypothesis.
