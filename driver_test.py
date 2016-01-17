from driver import AutocrawlerDriver

driver = AutocrawlerDriver()

links = driver.start_url_generator()

print links

print len(links)