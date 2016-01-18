# -*- coding: utf-8 -*-

# Define here the models for your scraped items
#
# See documentation in:
# http://doc.scrapy.org/en/latest/topics/items.html

import scrapy


class AutocrawlerItem(scrapy.Item):
    #autobeschreibung
    marke = scrapy.Field()
    modell = scrapy.Field()
    preis = scrapy.Field()
    fahrzeugart = scrapy.Field()
    kilometer = scrapy.Field()
    erstzulassung_monat = scrapy.Field()
    erstzulassung_jahr = scrapy.Field()
    leistung = scrapy.Field()
    treibstoff = scrapy.Field()
    mfk_monat = scrapy.Field()
    mfk_jahr = scrapy.Field()
    angebotsnummer = scrapy.Field()
    fahrzeughalter = scrapy.Field()
    karosserieform = scrapy.Field()
    getriebe = scrapy.Field()
    antriebsart = scrapy.Field()
    gaenge = scrapy.Field()
    hubraum =  scrapy.Field()
    kraftstoffverbrauch = scrapy.Field()
    co2_emissionen = scrapy.Field()
    co2_effizienzklasse = scrapy.Field()
    schadstoffklasse = scrapy.Field()
    tueren = scrapy.Field()
    sitzplaetze = scrapy.Field()
    garantie = scrapy.Field()
    aussenfarbe = scrapy.Field()
    innenausstattung = scrapy.Field()
    
    #ausstattung
    alarmanlage = scrapy.Field()
    tagfahrlicht = scrapy.Field()
    traktionskontrolle = scrapy.Field()
    klimaanlage =  scrapy.Field()
    klimaautomatik =  scrapy.Field()
    panoramadach = scrapy.Field()
    schiebedach = scrapy.Field()
    einparkhilfe_kamera = scrapy.Field()
    einparkhilfe_selbstlenkendes_system = scrapy.Field()
    einparkhilfe_sensoren_vorne = scrapy.Field()
    einparkhilfe_sensoren_hinten = scrapy.Field()
    radio = scrapy.Field()
    alufelgen = scrapy.Field()
    sportfahrwerk = scrapy.Field()
    sportpaket = scrapy.Field()
    anhaengerkupplung = scrapy.Field()
    scheckheftgepflegt = scrapy.Field()
    nichtraucherfahrzeug = scrapy.Field()
	
	#anbieter info
    anbieter_typ = scrapy.Field()
    anbieter_name = scrapy.Field()
    anbieter_tel = scrapy.Field()
    anbieter_adresse_strasse = scrapy.Field()
    anbieter_adresse_land = scrapy.Field()
    anbieter_adresse_plz = scrapy.Field()
    anbieter_adresse_ort = scrapy.Field()
    anbieter_webseite = scrapy.Field()
    
	#bewertung des anbieters
    bewertung_durchschnitt = scrapy.Field()
    bewertung_gesamteindruck = scrapy.Field()
    bewertung_erreichbarkeit = scrapy.Field()
    bewertung_zuverlaessigkeit = scrapy.Field()
    bewertung_angebotsbeschreibung = scrapy.Field()
    bewertung_kauferlebnis = scrapy.Field()
    anzahl_bewertungen = scrapy.Field()
    prozentsatz_weiterempfehlungen = scrapy.Field()
	
	#dienstleistungen des anbieters
    dienstleistung_abgastest = scrapy.Field()
    dienstleistung_ersatzteilverkauf = scrapy.Field()
    dienstleistung_service_24h = scrapy.Field()
    dienstleistung_versicherungen = scrapy.Field()
    dienstleistung_werkstatt = scrapy.Field()
    dienstleistung_finanzservice = scrapy.Field()
    dienstleistung_zulassungsservice = scrapy.Field()
	
	#link zum angebot
    link = scrapy.Field()
	
    def keys(self):
        return [ 'marke', 'modell', 'preis', 'kilometer', 'erstzulassung_monat', 'erstzulassung_jahr', 'leistung', 'treibstoff', 'mfk_monat', 'mfk_jahr', 'angebotsnummer', 'fahrzeughalter', 'karosserieform', 'getriebe', 'antriebsart', 'gaenge', 'hubraum', 'kraftstoffverbrauch', 'co2_emissionen', 'co2_effizienzklasse', 'schadstoffklasse', 'tueren', 'sitzplaetze', 'garantie', 'aussenfarbe', 'innenausstattung', 'alarmanlage', 'tagfahrlicht', 'traktionskontrolle', 'klimaanlage', 'klimaautomatik', 'panoramadach', 'schiebedach', 'einparkhilfe_kamera', 'einparkhilfe_selbstlenkendes_system', 'einparkhilfe_sensoren_vorne', 'einparkhilfe_sensoren_hinten', 'radio', 'alufelgen', 'sportfahrwerk', 'sportpaket', 'anhaengerkupplung', 'scheckheftgepflegt', 'nichtraucherfahrzeug', 'anbieter_typ', 'anbieter_name','anbieter_tel', 'anbieter_adresse_strasse', 'anbieter_adresse_land', 'anbieter_adresse_plz', 'anbieter_adresse_ort', 'anbieter_webseite', 'bewertung_durchschnitt', 'bewertung_gesamteindruck', 'bewertung_erreichbarkeit', 'bewertung_zuverlaessigkeit', 'bewertung_angebotsbeschreibung', 'bewertung_kauferlebnis', 'anzahl_bewertungen', 'prozentsatz_weiterempfehlungen', 'dienstleistung_abgastest', 'dienstleistung_ersatzteilverkauf', 'dienstleistung_service_24h', 'dienstleistung_versicherungen', 'dienstleistung_werkstatt', 'dienstleistung_finanzservice', 'dienstleistung_zulassungsservice', 'link' ]
	
    

