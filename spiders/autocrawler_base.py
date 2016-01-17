# -*- coding: utf-8 -*-
import scrapy
import string
from selenium import webdriver
from selenium.common.exceptions import TimeoutException
from selenium.webdriver.support.ui import WebDriverWait

from autocrawler.items import AutocrawlerItem

from autocrawler.driver import AutocrawlerDriver

class AutocrawlerBaseSpider(scrapy.Spider):

	#collect car data from advertisements on autoscout24.de
	
    name = "autocrawler_base"
    allowed_domains = ["autoscout24.de"]
    driver = AutocrawlerDriver()
    start_urls = driver.start_url_generator()
	
			
    def parse(self, response):
        item = AutocrawlerItem()
        
        def only_digits(list):
		#returns only digits from a string
            all = string.maketrans('','')
            nodigs = all.translate(all, string.digits)
            return str(list).translate(all, nodigs)
			
        def get_string_from_list(mystr, mylist):
		#returns string from a list that contains a substring
            for val in mylist:
                if mystr in val:
                    return val
                else:
                    continue
					
        def get_index_from_list(mystr, mylist):
		#get the index of a string in a list that contain a substring
            for val in mylist:
                if mystr in val:
                    return mylist.index(val)
                else:
                    continue
            
        #link
        item['link'] = response.url
		
		#brand and model
        titel_string = str(response.xpath('//h1[@class="fontHeadline"]/text()').extract()).split()
        item['marke'] = (titel_string[0])[3:]
        item['modell'] = str(response.xpath('//h1[@class="fontHeadline"]/text()').extract())
        
        #price in Euro
        preis_string = response.xpath('//div[@class="fontHeadlineLCorporate"][1]/text()').extract()
        item['preis'] = only_digits(preis_string)[2:]
		
		#cartype
        item['fahrzeugart'] = response.xpath('//div[@class="nowrap"]/text()').extract()[0].strip()
		
        #list with mileage, initial registration date, horsepower, fuel and car licensing test date (mfk)
		#dates are only available in month and year
        liste_oben = response.xpath('//div[@class="marginLeftM"]/div/text()').extract()
		
        #mileage
        kilometer_string = get_string_from_list('km', liste_oben)
        kilometer_digits = only_digits(kilometer_string)
        if len(kilometer_digits) != 0:
            item['kilometer'] = kilometer_digits
        else:
            item['kilometer'] = 'NA'

		#initial registration date
        erstzulassung_string = get_string_from_list('EZ', liste_oben)
        erstzulassung_digits = only_digits(erstzulassung_string)
        if len(erstzulassung_digits) != 0:
            item['erstzulassung_monat'] = erstzulassung_digits[0:2]
            item['erstzulassung_jahr'] = erstzulassung_digits[2:6]
        else:
            item['erstzulassung_monat'] = 'NA'
            item['erstzulassung_jahr'] = 'NA'
		
		#horsepower in kW
        leistung_string = get_string_from_list('kW', liste_oben)
        item['leistung'] = leistung_string.split()[0]
		
        #fuel
        item['treibstoff'] = response.xpath('//div[@class="nowrap"]/text()').extract()[1].strip()
		
		#car licensing test date (mfk)
        mfk_string = get_string_from_list('HU/AU', liste_oben)
        mfk_digits = only_digits(mfk_string)
        if len(mfk_digits) != 0:
            item['mfk_monat'] = mfk_digits[0:2]
            item['mfk_jahr'] = mfk_digits[2:6]
        else:
            item['mfk_monat'] = 'NA'
            item['mfk_jahr'] = 'NA'
		
		#offer number
        item['angebotsnummer'] = ((response.url).split('/')[-1])[0:9]
		
		#seller type
        anbieter_typ = response.xpath('//div[@class="gridSpan3 gridInner fontHeadline marginTopBlockM"]/h2/text()').extract()[0].strip()
        item['anbieter_typ'] = anbieter_typ
		

        #list containing additional information
        liste_label = response.xpath('//div[@data-test="additionaldata-content"]/div[@class="gridWidth2 labelWithBreaks gridInner"]/text()').extract()
        
        try:
            kraftstoffverbrauch_index = liste_label.index(u'Kraftstoffverbrauch*:')
            del liste_label[kraftstoffverbrauch_index]
            kraftstoff_index = liste_label.index(u'Kraftstoff:')
            del liste_label[kraftstoff_index]
        except:
		    pass
        
        liste_property = response.xpath('//div[@data-test="additionaldata-content"]/div[@class="gridWidth3 propertyWithBreaks"]/text()[normalize-space()]').extract()
        
        #number of previous car owner
        try :
            fahrzeughalter_index = liste_label.index(u'Fahrzeughalter:')
            if fahrzeughalter_index is not None:
                fahrzeughalter_string = liste_property[fahrzeughalter_index]
                fahrzeughalter_digits = fahrzeughalter_string.strip()
                if len(fahrzeughalter_digits) != 0:
                    item['fahrzeughalter'] = fahrzeughalter_digits
                else:
                    item['fahrzeughalter'] = 'NA'
        except :
            item['fahrzeughalter'] = 'NA'
        
        if item['erstzulassung_monat'] == 'NA' and item['erstzulassung_jahr'] == 'NA' and item['mfk_monat'] == 'NA' and item['mfk_jahr'] == 'NA':
                    item['fahrzeughalter'] = '0'

		#vehicle body form
        try:
            karosserieform_index = liste_label.index(u'Karosserieform:')
            if karosserieform_index is not None:
                karosserieform_string = (liste_property[karosserieform_index]).strip()
                if len(karosserieform_string) != 0:
                    item['karosserieform'] = karosserieform_string
                else: item['karosserieform'] = 'NA'
        except:
            item['karosserieform'] = 'NA'
                    

		#gearbox
        try:
            getriebe_index = liste_label.index(u'Getriebe:')
            if getriebe_index is not None:
                getriebe_string = (liste_property[getriebe_index]).strip()
                if len(getriebe_string) != 0:
                    item['getriebe'] = getriebe_string
                else:
                    item['getriebe'] = 'NA'
        except:
            item['getriebe'] = 'NA'
		
		#mode of driving
        try :
            antriebsart_index = liste_label.index(u'Antriebsart:')
            if antriebsart_index is not None:
                antriebsart_string = (liste_property[antriebsart_index]).strip()
                if len(antriebsart_string) != 0:
                    item['antriebsart'] = antriebsart_string
                else:
                    item['antriebsart'] = 'NA'
        except :
            item['antriebsart'] = 'NA'
		
        #number of gears
        try :
            gaenge_index = liste_label.index(u'Gänge:')
            if gaenge_index is not None:
                gaenge_string = (liste_property[gaenge_index]).strip()
                if len(gaenge_string) != 0:
                    item['gaenge'] = gaenge_string
                else:
                    item['gaenge'] = 'NA'
        except :
            item['gaenge'] = 'NA'
		
		#engine size in cm3
        try :
            hubraum_index = liste_label.index(u'Hubraum:')
            if hubraum_index is not None:
                hubraum_string = (liste_property[hubraum_index]).split()[0]
                if len(hubraum_string) != 0:
                    item['hubraum'] = hubraum_string
                else:
                    item['hubraum'] = 'NA'
        except :
            item['hubraum'] = 'NA'
		
		#fuel consumption in dl per 100 km
        kraftstoffverbrauch_string = response.xpath('//*[@id="consMixedRow"]/text()').extract()
        kraftstoffverbrauch_digits = only_digits(kraftstoffverbrauch_string)[0:2]
        if len(kraftstoffverbrauch_digits) != 0:
            item['kraftstoffverbrauch'] = kraftstoffverbrauch_digits
        else:
            item['kraftstoffverbrauch'] = 'NA'
		
		#co2 emission in g per km
        try :
            co2_emissionen_index = liste_label.index(u'CO2-Emissionen*:')
            if co2_emissionen_index is not None:
                co2_emissionen_string = only_digits((liste_property[co2_emissionen_index]).strip())
                if len(co2_emissionen_string) != 0:
                    item['co2_emissionen'] = co2_emissionen_string
                else:
                    item['co2_emissionen'] = 'NA'
        except :
            item['co2_emissionen'] = 'NA'
		
		#co2 efficiency class
        try :
            co2_effizienzklasse_index = liste_label.index(u'CO2-Effizienzklasse:')
            if co2_effizienzklasse_index is not None:
                co2_effizienzklasse_string = (liste_property[co2_effizienzklasse_index]).strip()
                if len(co2_effizienzklasse_string) != 0:
                    item['co2_effizienzklasse'] = co2_effizienzklasse_string
                else:
                    item['co2_effizienzklasse'] = 'NA'
        except :
            item['co2_effizienzklasse'] = 'NA'
        
		#emission class
        try :
            schadstoffklasse_index = liste_label.index(u'Schadstoffklasse:')
            if schadstoffklasse_index is not None:
                schadstoffklasse_string = (liste_property[schadstoffklasse_index]).strip()
                if len(schadstoffklasse_string) != 0:
                    item['schadstoffklasse'] = schadstoffklasse_string
                else:
                    item['schadstoffklasse'] = 'NA'
        except :
            item['schadstoffklasse'] = 'NA'
		
		#number of doors
        try :
            tueren_index = liste_label.index(u'Türen:')
            if tueren_index is not None:
                tueren_string = (liste_property[tueren_index]).strip()
                if len(tueren_string) != 0:
                    item['tueren'] = tueren_string
                else:
                    item['tueren'] = 'NA'
        except :
            item['tueren'] = 'NA'
		
		#number of seats
        try :
            sitzplaetze_index = liste_label.index(u'Sitzplätze:')
            if sitzplaetze_index is not None:
                sitzplaetze_string = (liste_property[sitzplaetze_index]).strip()
                if len(sitzplaetze_string) != 0:
                    item['sitzplaetze'] = sitzplaetze_string
                else:
                    item['sitzplaetze'] = 'NA'
        except :
            item['sitzplaetze'] = 'NA'
		
		#warranty
        if response.xpath('//div[@class="iconHookSilentS"]'):
            item['garantie'] = '1'
        else:
            item['garantie'] = '0'
		
		#exterior color
        try :
            aussenfarbe_index = liste_label.index(u'Außenfarbe:')
            if aussenfarbe_index is not None:
                aussenfarbe_string = (liste_property[aussenfarbe_index]).strip()
                if len(aussenfarbe_string) != 0:
                    item['aussenfarbe'] = aussenfarbe_string
                else:
                    item['aussenfarbe'] = 'NA'
        except :
            item['aussenfarbe'] = 'NA'
		
		#interior
        try :
            innenausstattung_index = liste_label.index(u'Innenausstattung:')
            if innenausstattung_index is not None:
                innenausstattung_string = (liste_property[innenausstattung_index]).strip()
                if len(innenausstattung_string) != 0:
                    item['innenausstattung'] = innenausstattung_string
                else:
                    item['innenausstattung'] = 'NA'
        except :
            item['innenausstattung'] = 'NA'
		
		#car features
		#ausstattung_list is a list that contains that features possessed by a car from the current advertisements
		#if a feature is present in the list, the item will be 1 and 0 otherwise
		
        ausstattung_list = response.xpath('//div[@data-test="equipment-content"]/div/p/text()').extract()
		
		#alarm system
        if 'Alarmanlage' in ausstattung_list:
            item['alarmanlage'] = '1'
        else:
            item['alarmanlage'] = '0'
		
		#daytime running light
        if 'Tagfahrlicht' in ausstattung_list:
            item['tagfahrlicht'] = '1'
        else:
            item['tagfahrlicht'] = '0'
		
		#traction control
        if 'Traktionskontrolle' in ausstattung_list:
            item['traktionskontrolle'] = '1'
        else:
            item['traktionskontrolle'] = '0'
		
		#air conditioning unit
        if 'Klimaanlage' in ausstattung_list:
            item['klimaanlage'] = '1'
        else:
            item['klimaanlage'] = '0'
		
		#automatic air conditioning
        if 'Klimaautomatik' in ausstattung_list:
            item['klimaautomatik'] = '1'
        else:
            item['klimaautomatik'] = '0'
		
		#panoramic roof
        if 'Panoramadach' in ausstattung_list:
            item['panoramadach'] = '1'
        else:
            item['panoramadach'] = '0'
		
		#sunroof
        if 'Schiebedach' in ausstattung_list:
            item['schiebedach'] = '1'
        else:
            item['schiebedach'] = '0'
		
		#parking assistance system: camera
        if 'Einparkhilfe Kamera' in ausstattung_list:
            item['einparkhilfe_kamera'] = '1'
        else:
            item['einparkhilfe_kamera'] = '0'
		
		#parking assistance system: self-guiding system
        if 'Einparkhile selbstlenkendes System' in ausstattung_list:
            item['einparkhilfe_selbstlenkendes_system'] = '1'
        else:
            item['einparkhilfe_selbstlenkendes_system'] = '0'
		
		#parking assistance system: front sensors
        if 'Einparkhile Sensoren vorne' in ausstattung_list:
            item['einparkhilfe_sensoren_vorne'] = '1'
        else:
            item['einparkhilfe_sensoren_vorne'] = '0'
		
		#parking assistance system: rear sensors
        if 'Einparkhile Sensoren hinten' in ausstattung_list:
            item['einparkhilfe_sensoren_hinten'] = '1'
        else:
            item['einparkhilfe_sensoren_hinten'] = '0'
		
		#radio
        if 'Radio' in ausstattung_list:
            item['radio'] = '1'
        else:
            item['radio'] = '0'
		
		#alloy wheels
        if 'Alufelgen' in ausstattung_list:
            item['alufelgen'] = '1'
        else:
            item['alufelgen'] = '0'
		
		#sport suspension
        if 'Sportfahrwerk' in ausstattung_list:
            item['sportfahrwerk'] = '1'
        else:
            item['sportfahrwerk'] = '0'
		
		#tuning kit
        if 'Sportpaket' in ausstattung_list:
            item['sportpaket'] = '1'
        else:
            item['sportpaket'] = '0'
		
		#trailer coupling
        if u'Anhängerkupplung' in ausstattung_list:
            item['anhaengerkupplung'] = '1'
        else:
            item['anhaengerkupplung'] = '0'
		
		#full service history
        if 'Scheckheftgepflegt' in ausstattung_list:
            item['scheckheftgepflegt'] = '1'
        else:
            item['scheckheftgepflegt'] = '0'
		
		#non-smoking vehicle
        if 'Nichtraucherfahrzeug' in ausstattung_list:
            item['nichtraucherfahrzeug'] = '1'
        else:
            item['nichtraucherfahrzeug'] = '0'
            
        #filling the "rating" items
		#firstly, if the seller type is a private seller, items will be filled with NAs
		#these information are not available on the autoscout24.com platform for private seller
		#else, if the seller type is a dealer, then scrapy will open links to pages that will provide the dealer information and ratings
		
		#filling NAs if seller type is private seller
        if anbieter_typ == u'Privater Anbieter':
			item['anbieter_name'] = 'NA'
			item['anbieter_tel'] = 'NA'
			item['anbieter_adresse_strasse'] = 'NA'
			item['anbieter_adresse_land'] = 'NA'
			item['anbieter_adresse_plz'] = 'NA'
			item['anbieter_adresse_ort'] = 'NA'
			item['anbieter_webseite'] = 'NA'
			
			item['bewertung_durchschnitt'] = 'NA'
			item['bewertung_gesamteindruck'] = 'NA'
			item['bewertung_erreichbarkeit'] = 'NA'
			item['bewertung_zuverlaessigkeit'] = 'NA'
			item['bewertung_angebotsbeschreibung'] = 'NA'
			item['bewertung_kauferlebnis'] = 'NA'
			item['anzahl_bewertungen'] = 'NA'
			item['prozentsatz_weiterempfehlungen'] = 'NA'
			
			item['dienstleistung_abgastest'] = 'NA'
			item['dienstleistung_ersatzteilverkauf'] = 'NA'
			item['dienstleistung_finanzservice'] = 'NA'
			item['dienstleistung_service_24h'] = 'NA'
			item['dienstleistung_versicherungen'] = 'NA'
			item['dienstleistung_werkstatt'] = 'NA'
			item['dienstleistung_zulassungsservice'] = 'NA'
			
		#open link that contains further dealer information
        else:
            try:
                anbieter_url = response.xpath('//div[@data-test="sellerCompany"]/a/@href').extract()[0]
                anbieter_request = scrapy.Request(anbieter_url, callback=self.parse_anbieter, dont_filter=True)
                anbieter_request.meta['item'] = item
                return anbieter_request
            except:
                return item

        return item
		
    def parse_anbieter(self, response):
		
		#obtain further dealer information from the dealer page on autoscout24
		
		def only_digits(list):
			all = string.maketrans('','')
			nodigs = all.translate(all, string.digits)
			return str(list).translate(all, nodigs)
		
		item = response.meta['item']
		
		#name
		anbieter_name_text = response.xpath('//h2[@itemprop="name"]/text()').extract()[0].strip()
		item['anbieter_name'] = anbieter_name_text
		
		#telephone number
		anbieter_tel_text = only_digits(response.xpath('//div[@itemprop="telephone"]/text()').extract()[0])
		item['anbieter_tel'] = anbieter_tel_text
		
		#address (street)
		adresse_strasse = response.xpath('//div[@itemprop="streetAddress"]/text()').extract()[0].strip()
		item['anbieter_adresse_strasse'] = adresse_strasse
		
		#address (country)
		adresse_land = response.xpath('//span[@itemprop="addressCountry"]/text()').extract()[0][0]
		item['anbieter_adresse_land'] = adresse_land
		
		#address (zip)
		adresse_plz = response.xpath('//span[@itemprop="postalCode"]/text()').extract()[0]
		item['anbieter_adresse_plz'] = adresse_plz
		
		#address (locality)
		adresse_ort = response.xpath('//span[@itemprop="addressLocality"]/text()').extract()[0]
		item['anbieter_adresse_ort'] = adresse_ort
		
		#website link
		item['anbieter_webseite'] = response.xpath('//a[@rel="nofollow"]/@href').extract()[0]
		
		#services offered by dealer
		#dienstleistung_list is a list that contains that services offered by a dealer
		#if a service is present in the list, the item will be 1 and 0 otherwise
		dienstleistung_list = response.xpath('//label/text()').extract()
		
		#exhaust emission test
		if 'Abgastest' in dienstleistung_list:
			item['dienstleistung_abgastest'] = '1'
		else:
			item['dienstleistung_abgastest'] = '0'
		
		#sales of spare parts
		if 'Ersatzteilverkauf' in dienstleistung_list:
			item['dienstleistung_ersatzteilverkauf'] = '1'
		else:
			item['dienstleistung_ersatzteilverkauf'] = '0'
		
		#24h service
		if 'Service 24h' in dienstleistung_list:
			item['dienstleistung_service_24h'] = '1'
		else:
			item['dienstleistung_service_24h'] = '0'
		
		#insurance
		if 'Versicherungen' in dienstleistung_list:
			item['dienstleistung_versicherungen'] = '1'
		else:
			item['dienstleistung_versicherungen'] = '0'
		
		#garage
		if 'Werkstatt' in dienstleistung_list:
			item['dienstleistung_werkstatt'] = '1'
		else:
			item['dienstleistung_werkstatt'] = '0'
		
		#financial service
		if 'Finanzservice' in dienstleistung_list:
			item['dienstleistung_finanzservice'] = '1'
		else:
			item['dienstleistung_finanzservice'] = '0'
		
		#registration service
		if 'Zulassungsservice' in dienstleistung_list:
			item['dienstleistung_zulassungsservice'] = '1'
		else:
			item['dienstleistung_zulassungsservice'] = '0'
		
		#open link that contains dealer ratings
		try:
			anbieter_name_in_url = response.url.split('/')[-1]
			bewertung_url = "http://haendler.autoscout24.de/ratingsinfo/data/" + anbieter_name_in_url + "/l/10"
			bewertung_request = scrapy.Request(bewertung_url, callback=self.parse_bewertung, dont_filter=True)
			bewertung_request.meta['item'] = item
			return bewertung_request
		except:
			return item
			
		return item
		
    def parse_bewertung(self, response):
	
	#obtain dealer ratings
    
        def only_digits(list):
            all = string.maketrans('','')
            nodigs = all.translate(all, string.digits)
            return str(list).translate(all, nodigs)
        
        bewertung_text = response.xpath('//text()').extract()[0]
           
        item = response.meta['item']
		
        dealer_ratings_active = bewertung_text.split('"DealerRatingsActive":', 1)[-1]
		
		#if dealer masks its rating, the item will be filled with "Bewertung Ausgeblendet"
        if dealer_ratings_active[0:5] == 'false':
            item['anzahl_bewertungen'] = "Bewertung Ausgeblendet"
            item['bewertung_durchschnitt'] = "Bewertung Ausgeblendet"
            item['bewertung_gesamteindruck'] = "Bewertung Ausgeblendet"
            item['bewertung_erreichbarkeit'] = "Bewertung Ausgeblendet"
            item['bewertung_zuverlaessigkeit'] = "Bewertung Ausgeblendet"
            item['bewertung_angebotsbeschreibung'] = "Bewertung Ausgeblendet"
            item['bewertung_kauferlebnis'] = "Bewertung Ausgeblendet"
            item['prozentsatz_weiterempfehlungen'] = "Bewertung Ausgeblendet"
		
		#save ratings in items
        else:
			
			#number of ratings
            anzahl_bewertungen_text = bewertung_text.split('"NumberOfReviews":', 1)[-1]
            item['anzahl_bewertungen'] = only_digits(anzahl_bewertungen_text[0:5])
			
			#average rating
            durchschnitt_text = anzahl_bewertungen_text.split('"DealerRatingAvg":', 1)[-1]
            item['bewertung_durchschnitt'] = (durchschnitt_text[0:4]).strip(',')
            
			#overall impression rating
            gesamteindruck_text = durchschnitt_text.split('"Grade":', 1)[-1]
            item['bewertung_gesamteindruck'] = (gesamteindruck_text[0:4]).strip(',')
            
			#accessibility rating
            erreichbarkeit_text = gesamteindruck_text.split('"Grade":', 1)[-1]
            item['bewertung_erreichbarkeit'] = (erreichbarkeit_text[0:4]).strip(',')
            
			#reliability rating
            zuverlaessigkeit_text = erreichbarkeit_text.split('"Grade":', 1)[-1]
            item['bewertung_zuverlaessigkeit'] = (zuverlaessigkeit_text[0:4]).strip(',')
            
			#offer description rating
            angebotsbeschreibung_text = zuverlaessigkeit_text.split('"Grade":', 1)[-1]
            item['bewertung_angebotsbeschreibung'] = (angebotsbeschreibung_text[0:4]).strip(',')
            
			#shopping experience rating
            kauferlebnis_text = angebotsbeschreibung_text.split('"Grade":', 1)[-1]
            item['bewertung_kauferlebnis'] = (kauferlebnis_text[0:4]).strip(',')
			
			#reccommendation tendency
            prozentsatz_weiterempfehlungen_text = kauferlebnis_text.split('"RecommendationPercentage":', 1)[-1]
            item['prozentsatz_weiterempfehlungen'] = only_digits(prozentsatz_weiterempfehlungen_text[0:5])
            
        return item