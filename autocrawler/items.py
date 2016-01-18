# -*- coding: utf-8 -*-

# Define here the models for your scraped items
#
# See documentation in:
# http://doc.scrapy.org/en/latest/topics/items.html

import scrapy


class AutocrawlerItem(scrapy.Item):
    #car description
    marke = scrapy.Field()                              #brand
    modell = scrapy.Field()                             #model
    preis = scrapy.Field()                              #price
    fahrzeugart = scrapy.Field()                        #car type
    kilometer = scrapy.Field()                          #mileage
    erstzulassung_monat = scrapy.Field()                #initial registration month
    erstzulassung_jahr = scrapy.Field()                 #initial registration year
    leistung = scrapy.Field()                           #horsepower
    treibstoff = scrapy.Field()                         #fuel
    mfk_monat = scrapy.Field()                          #inspection month
    mfk_jahr = scrapy.Field()                           #inspection year
    angebotsnummer = scrapy.Field()                     #offer number
    fahrzeughalter = scrapy.Field()                     #number of previous owner(s)
    karosserieform = scrapy.Field()                     #car bodywork
    getriebe = scrapy.Field()                           #gearbox
    antriebsart = scrapy.Field()                        #drivetrain
    gaenge = scrapy.Field()                             #number of gears
    hubraum =  scrapy.Field()                           #displaced volume
    kraftstoffverbrauch = scrapy.Field()                #fuel consumption
    co2_emissionen = scrapy.Field()                     #co2 emission
    co2_effizienzklasse = scrapy.Field()                #co2 efficiency class
    schadstoffklasse = scrapy.Field()                   #exhaust gas class
    tueren = scrapy.Field()                             #number of doors
    sitzplaetze = scrapy.Field()                        #number of seats
    garantie = scrapy.Field()                           #warranty (boolean)
    aussenfarbe = scrapy.Field()                        #paint color
    innenausstattung = scrapy.Field()                   #interior
    
    #car features
    alarmanlage = scrapy.Field()                        #alarm
    tagfahrlicht = scrapy.Field()                       #daylight
    traktionskontrolle = scrapy.Field()                 #traction control
    klimaanlage =  scrapy.Field()                       #air conditioning
    klimaautomatik =  scrapy.Field()                    #automatic air conditioning
    panoramadach = scrapy.Field()                       #panorama roof
    schiebedach = scrapy.Field()                        #slide roof
    einparkhilfe_kamera = scrapy.Field()                #parking assist camera
    einparkhilfe_selbstlenkendes_system = scrapy.Field()#parking assist automatic
    einparkhilfe_sensoren_vorne = scrapy.Field()        #parking assist front sensors
    einparkhilfe_sensoren_hinten = scrapy.Field()       #parking assist rear sensors
    radio = scrapy.Field()                              #radio
    alufelgen = scrapy.Field()                          #aluminium wheels
    sportfahrwerk = scrapy.Field()                      #sporty chassis
    sportpaket = scrapy.Field()                         #sport package
    anhaengerkupplung = scrapy.Field()                  #trailer coupling
    scheckheftgepflegt = scrapy.Field()                 #complete maintenance booklet
    nichtraucherfahrzeug = scrapy.Field()               #non-smoking car
	
	#seller information
    anbieter_typ = scrapy.Field()                       #seller type
    anbieter_name = scrapy.Field()                      #seller name
    anbieter_tel = scrapy.Field()                       #seller telephone number
    anbieter_adresse_strasse = scrapy.Field()           #seller address: street
    anbieter_adresse_land = scrapy.Field()              #seller address: country
    anbieter_adresse_plz = scrapy.Field()               #seller address: zip code  
    anbieter_adresse_ort = scrapy.Field()               #seller address: locality
    anbieter_webseite = scrapy.Field()                  #seller website
    
	#seller raating
    bewertung_durchschnitt = scrapy.Field()             #average rating
    bewertung_gesamteindruck = scrapy.Field()           #rating: overall impression
    bewertung_erreichbarkeit = scrapy.Field()           #rating: reachability
    bewertung_zuverlaessigkeit = scrapy.Field()         #rating: reliability
    bewertung_angebotsbeschreibung = scrapy.Field()     #rating: offer description
    bewertung_kauferlebnis = scrapy.Field()             #rating: shopping experience
    anzahl_bewertungen = scrapy.Field()                 #number of rating(s)
    prozentsatz_weiterempfehlungen = scrapy.Field()     #probability of reccommendation (in percentage)
	
	#dealer services
    dienstleistung_abgastest = scrapy.Field()           #dealer service: exhaust gas test
    dienstleistung_ersatzteilverkauf = scrapy.Field()   #dealer service: spare parts sale
    dienstleistung_service_24h = scrapy.Field()         #dealer service: 24hours service
    dienstleistung_versicherungen = scrapy.Field()      #dealer service: insurance
    dienstleistung_werkstatt = scrapy.Field()           #dealer service: garage
    dienstleistung_finanzservice = scrapy.Field()       #dealer service: loan service
    dienstleistung_zulassungsservice = scrapy.Field()   #dealer service: registration service
	
	#URL
    link = scrapy.Field()
	
    def keys(self):
        return [ 'marke', 'modell', 'preis', 'kilometer', 'erstzulassung_monat', 'erstzulassung_jahr', 'leistung', 'treibstoff', 'mfk_monat', 'mfk_jahr', 'angebotsnummer', 'fahrzeughalter', 'karosserieform', 'getriebe', 'antriebsart', 'gaenge', 'hubraum', 'kraftstoffverbrauch', 'co2_emissionen', 'co2_effizienzklasse', 'schadstoffklasse', 'tueren', 'sitzplaetze', 'garantie', 'aussenfarbe', 'innenausstattung', 'alarmanlage', 'tagfahrlicht', 'traktionskontrolle', 'klimaanlage', 'klimaautomatik', 'panoramadach', 'schiebedach', 'einparkhilfe_kamera', 'einparkhilfe_selbstlenkendes_system', 'einparkhilfe_sensoren_vorne', 'einparkhilfe_sensoren_hinten', 'radio', 'alufelgen', 'sportfahrwerk', 'sportpaket', 'anhaengerkupplung', 'scheckheftgepflegt', 'nichtraucherfahrzeug', 'anbieter_typ', 'anbieter_name','anbieter_tel', 'anbieter_adresse_strasse', 'anbieter_adresse_land', 'anbieter_adresse_plz', 'anbieter_adresse_ort', 'anbieter_webseite', 'bewertung_durchschnitt', 'bewertung_gesamteindruck', 'bewertung_erreichbarkeit', 'bewertung_zuverlaessigkeit', 'bewertung_angebotsbeschreibung', 'bewertung_kauferlebnis', 'anzahl_bewertungen', 'prozentsatz_weiterempfehlungen', 'dienstleistung_abgastest', 'dienstleistung_ersatzteilverkauf', 'dienstleistung_service_24h', 'dienstleistung_versicherungen', 'dienstleistung_werkstatt', 'dienstleistung_finanzservice', 'dienstleistung_zulassungsservice', 'link' ]