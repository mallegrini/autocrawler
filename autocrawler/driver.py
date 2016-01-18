from selenium import webdriver
from selenium.common.exceptions import TimeoutException
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
from selenium.webdriver.support.ui import Select

class AutocrawlerDriver():

    def start_url_generator(self):
		
		#automate the browser to traverse through the search result
		#cars that fulfill the criteria below will appear in search result
		#the links to those ads on autscout24.de will be saved in an array
		#array with the links will be returned to spider
		
        driver = webdriver.Firefox()
        driver.set_page_load_timeout(600)
        driver.get("http://www.autoscout24.de/")
		
        #select brand of car
        select_brand = Select(driver.find_element_by_xpath('//*[@id="make1"]'))
        select_brand.select_by_visible_text("Volkswagen")

	    #select model of car
        select_model = Select(driver.find_element_by_xpath('//*[@id="model1"]'))
        select_model.select_by_visible_text("Golf (alle)")
		
        #select production year (optional)
        #select_year = Select(driver.find_element_by_xpath('//*[@id="yearfrom"]'))
        #select_year.select_by_visible_text("2013")
		
	    #select mileage (optional)
        #select_mileage = Select(driver.find_element_by_xpath('//*[@id="mileageto"]'))
        #select_mileage.select_by_visible_text("10.000")
		
        #select fuel (optional)
        #select_fuel = Select(driver.find_element_by_xpath('//*[@id="fuel"]'))
        #select_fuel.select_by_visible_text("Benzin")
		
        #submit
        driver.find_element_by_xpath('//*[@id="blockSearchButton"]/input').click()

        driver.implicitly_wait(1)
		
		#show more links per page (80 links per page)
        driver.find_element_by_xpath('//*[@id="resultsPerPageHolder"]/a[4]').click()
		
        driver.implicitly_wait(1)
		
		#placeholder array for links
        list_of_links = []
		
		#placeholder for the number of links saved in array
        number_of_pages = int(driver.find_element_by_xpath('//*[@id="pageCountsText"]').text)
		
		#loop to append links into array from every page in search result
        for x in range(0, number_of_pages):
	
            link_holders = driver.find_elements_by_class_name("noDecoration")
			
			#get links from current result page
            temp_list = []
            for link_holder in link_holders:
                temp_link = link_holder.get_attribute("href")
                if temp_link not in temp_list:
			        temp_list.append(temp_link)
			
			#append links into the placeholder
            list_of_links.extend(temp_list)
            
            print"url scraped = " + str(len(list_of_links))

			#move to the next result page
            if x == 0:
                driver.find_element_by_xpath('//*[@id="pagesBottomHolder"]/a[3]/span').click()
				
            elif x == 1:
                driver.find_element_by_xpath('//*[@id="pagesBottomHolder"]/a[4]/span').click()
					
            else:
                driver.find_element_by_xpath('//*[@id="pagesBottomHolder"]/a[5]/span').click()
		
		#quit driver
        driver.quit()
		
		#placeholder array containing links returned to spider
        return list_of_links
		
