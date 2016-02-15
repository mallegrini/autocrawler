classification_october <- function(d) {
  
  # define numeric columns in the dataframe
  d <- transform(d, preis = as.numeric(as.character(preis)))
  d <- transform(d, kilometer = as.numeric(as.character(kilometer)))
  d <- transform(d, erstzulassung_monat = as.numeric(as.character(erstzulassung_monat)))
  d <- transform(d, erstzulassung_jahr = as.numeric(as.character(erstzulassung_jahr)))
  d <- transform(d, leistung = as.numeric(as.character(leistung)))
  d <- transform(d, mfk_monat = as.numeric(as.character(mfk_monat)))
  d <- transform(d, mfk_jahr = as.numeric(as.character(mfk_jahr)))
  d <- transform(d, bewertung_durchschnitt = as.numeric(as.character(bewertung_durchschnitt)))
  d <- transform(d, bewertung_gesamteindruck = as.numeric(as.character(bewertung_gesamteindruck)))
  d <- transform(d, bewertung_erreichbarkeit = as.numeric(as.character(bewertung_erreichbarkeit)))
  d <- transform(d, bewertung_zuverlaessigkeit = as.numeric(as.character(bewertung_zuverlaessigkeit)))
  d <- transform(d, bewertung_angebotsbeschreibung = as.numeric(as.character(bewertung_angebotsbeschreibung)))
  d <- transform(d, bewertung_kauferlebnis = as.numeric(as.character(bewertung_kauferlebnis)))
  d <- transform(d, anzahl_bewertungen = as.numeric(as.character(anzahl_bewertungen)))
  d <- transform(d, prozentsatz_weiterempfehlungen = as.numeric(as.character(prozentsatz_weiterempfehlungen)))
  d <- transform(d, fahrzeughalter = as.numeric(as.character(fahrzeughalter)))
  d <- transform(d, gaenge = as.numeric(as.character(gaenge)))
  d <- transform(d, hubraum = as.numeric(as.character(hubraum)))
  d <- transform(d, kraftstoffverbrauch = as.numeric(as.character(kraftstoffverbrauch)))
  d <- transform(d, co2_emissionen = as.numeric(as.character(co2_emissionen)))
  d <- transform(d, tueren = as.numeric(as.character(tueren)))
  d <- transform(d, sitzplaetze = as.numeric(as.character(sitzplaetze)))

  #Variablen werden von factor zu logical (true,false) umgewandelt
  d$alarmanlage <- factor(d$alarmanlage)
  levels(d$alarmanlage)=c("F","T")
  d <- transform(d, alarmanlage = as.logical(alarmanlage))
  d$tagfahrlicht <- factor(d$tagfahrlicht)
  levels(d$tagfahrlicht)=c("F","T")
  d <- transform(d, tagfahrlicht = as.logical(tagfahrlicht))
  d$traktionskontrolle <- factor(d$traktionskontrolle)
  levels(d$traktionskontrolle)=c("F","T")
  d <- transform(d, traktionskontrolle = as.logical(traktionskontrolle))
  d$klimaanlage <- factor(d$klimaanlage)
  levels(d$klimaanlage)=c("F","T")
  d <- transform(d, klimaanlage = as.logical(klimaanlage))
  d$klimaautomatik <- factor(d$klimaautomatik)
  levels(d$klimaautomatik)=c("F","T")
  d <- transform(d, klimaautomatik = as.logical(klimaautomatik))
  d$panoramadach <- factor(d$panoramadach)
  levels(d$panoramadach)=c("F","T")
  d <- transform(d, panoramadach = as.logical(panoramadach))
  d$schiebedach <- factor(d$schiebedach)
  levels(d$schiebedach)=c("F","T")
  d <- transform(d, schiebedach = as.logical(schiebedach))
  d$einparkhilfe_kamera <- factor(d$einparkhilfe_kamera)
  levels(d$einparkhilfe_kamera)=c("F","T")
  d <- transform(d, einparkhilfe_kamera = as.logical(einparkhilfe_kamera))
  d$einparkhilfe_selbstlenkendes_system <- factor(d$einparkhilfe_selbstlenkendes_system)
  levels(d$einparkhilfe_selbstlenkendes_system)=c("F","T")
  d <- transform(d, einparkhilfe_selbstlenkendes_system = as.logical(einparkhilfe_selbstlenkendes_system))
  d$einparkhilfe_sensoren_vorne <- factor(d$einparkhilfe_sensoren_vorne)
  levels(d$einparkhilfe_sensoren_vorne)=c("F","T")
  d <- transform(d, einparkhilfe_sensoren_vorne = as.logical(einparkhilfe_sensoren_vorne))
  d$einparkhilfe_sensoren_hinten <- factor(d$einparkhilfe_sensoren_hinten)
  levels(d$einparkhilfe_sensoren_hinten)=c("F","T")
  d <- transform(d, einparkhilfe_sensoren_hinten = as.logical(einparkhilfe_sensoren_hinten))
  d$radio <- factor(d$radio)
  levels(d$radio)=c("F","T")
  d <- transform(d, radio = as.logical(radio))
  d$alufelgen <- factor(d$alufelgen)
  levels(d$alufelgen)=c("F","T")
  d <- transform(d, alufelgen = as.logical(alufelgen))
  d$sportfahrwerk <- factor(d$sportfahrwerk)
  levels(d$sportfahrwerk)=c("F","T")
  d <- transform(d, sportfahrwerk = as.logical(sportfahrwerk))
  d$sportpaket <- factor(d$sportpaket)
  levels(d$sportpaket)=c("F","T")
  d <- transform(d, sportpaket = as.logical(sportpaket))
  d$anhaengerkupplung <- factor(d$anhaengerkupplung)
  levels(d$anhaengerkupplung)=c("F","T")
  d <- transform(d, anhaengerkupplung = as.logical(anhaengerkupplung))
  d$scheckheftgepflegt <- factor(d$scheckheftgepflegt)
  levels(d$scheckheftgepflegt)=c("F","T")
  d <- transform(d, scheckheftgepflegt = as.logical(scheckheftgepflegt))
  d$nichtraucherfahrzeug <- factor(d$nichtraucherfahrzeug)
  levels(d$nichtraucherfahrzeug)=c("F","T")
  d <- transform(d, nichtraucherfahrzeug = as.logical(nichtraucherfahrzeug))
  d$garantie <- factor(d$garantie)
  levels(d$garantie)=c("F","T")
  d <- transform(d, garantie = as.logical(garantie))
  d$dienstleistung_abgastest <- factor(d$dienstleistung_abgastest)
  levels(d$dienstleistung_abgastest)=c("F","T")
  d <- transform(d, dienstleistung_abgastest = as.logical(dienstleistung_abgastest))
  d$dienstleistung_ersatzteilverkauf <- factor(d$dienstleistung_ersatzteilverkauf)
  levels(d$dienstleistung_ersatzteilverkauf)=c("F","T")
  d <- transform(d, dienstleistung_ersatzteilverkauf = as.logical(dienstleistung_ersatzteilverkauf))
  d$dienstleistung_service_24h <- factor(d$dienstleistung_service_24h)
  levels(d$dienstleistung_service_24h)=c("F","T")
  d <- transform(d, dienstleistung_service_24h = as.logical(dienstleistung_service_24h))
  d$dienstleistung_versicherungen <- factor(d$dienstleistung_versicherungen)
  levels(d$dienstleistung_versicherungen)=c("F","T")
  d <- transform(d, dienstleistung_versicherungen = as.logical(dienstleistung_versicherungen))
  d$dienstleistung_werkstatt <- factor(d$dienstleistung_werkstatt)
  levels(d$dienstleistung_werkstatt)=c("F","T")
  d <- transform(d, dienstleistung_werkstatt = as.logical(dienstleistung_werkstatt))
  d$dienstleistung_finanzservice <- factor(d$dienstleistung_finanzservice)
  levels(d$dienstleistung_finanzservice)=c("F","T")
  d <- transform(d, dienstleistung_finanzservice = as.logical(dienstleistung_finanzservice))
  d$dienstleistung_zulassungsservice <- factor(d$dienstleistung_zulassungsservice)
  levels(d$dienstleistung_zulassungsservice)=c("F","T")
  d <- transform(d, dienstleistung_zulassungsservice = as.logical(dienstleistung_zulassungsservice))
  
  d$kilometer <- d$kilometer/10000
  
  d <- d[c(19,51,11,28,64,22,59,54,45,8,37,48,57,49,9,58,34,47,55,42,69,17,36,31,43,26,
           61,27,2,3,44,53,13,29,46,33,67,30,10,15,40,25,62,20,32,35,66,6,16,21,52,14,
           63,4,5,41,56,38,60,18,7,68,23,1,39,65,24,12,50)]
  
  return(d)
}

classification_may <- function(d) {
  
  # define numeric columns in the dataframe
  d <- transform(d, preis = as.numeric(as.character(preis)))
  d <- transform(d, kilometer = as.numeric(as.character(kilometer)))
  d <- transform(d, erstzulassung_monat = as.numeric(as.character(erstzulassung_monat)))
  d <- transform(d, erstzulassung_jahr = as.numeric(as.character(erstzulassung_jahr)))
  d <- transform(d, leistung = as.numeric(as.character(leistung)))
  d <- transform(d, mfk_monat = as.numeric(as.character(mfk_monat)))
  d <- transform(d, mfk_jahr = as.numeric(as.character(mfk_jahr)))
  d <- transform(d, fahrzeughalter = as.numeric(as.character(fahrzeughalter)))
  d <- transform(d, gaenge = as.numeric(as.character(gaenge)))
  d <- transform(d, hubraum = as.numeric(as.character(hubraum)))
  d <- transform(d, kraftstoffverbrauch = as.numeric(as.character(kraftstoffverbrauch)))
  d <- transform(d, co2_emissionen = as.numeric(as.character(co2_emissionen)))
  d <- transform(d, tueren = as.numeric(as.character(tueren)))
  d <- transform(d, sitzplaetze = as.numeric(as.character(sitzplaetze)))
  
  #Variablen werden von factor zu logical (true,false) umgewandelt
  d$alarmanlage <- factor(d$alarmanlage)
  levels(d$alarmanlage)=c("F","T")
  d <- transform(d, alarmanlage = as.logical(alarmanlage))
  d$tagfahrlicht <- factor(d$tagfahrlicht)
  levels(d$tagfahrlicht)=c("F","T")
  d <- transform(d, tagfahrlicht = as.logical(tagfahrlicht))
  d$traktionskontrolle <- factor(d$traktionskontrolle)
  levels(d$traktionskontrolle)=c("F","T")
  d <- transform(d, traktionskontrolle = as.logical(traktionskontrolle))
  d$klimaanlage <- factor(d$klimaanlage)
  levels(d$klimaanlage)=c("F","T")
  d <- transform(d, klimaanlage = as.logical(klimaanlage))
  d$klimaautomatik <- factor(d$klimaautomatik)
  levels(d$klimaautomatik)=c("F","T")
  d <- transform(d, klimaautomatik = as.logical(klimaautomatik))
  d$panoramadach <- factor(d$panoramadach)
  levels(d$panoramadach)=c("F","T")
  d <- transform(d, panoramadach = as.logical(panoramadach))
  d$schiebedach <- factor(d$schiebedach)
  levels(d$schiebedach)=c("F","T")
  d <- transform(d, schiebedach = as.logical(schiebedach))
  d$einparkhilfe_kamera <- factor(d$einparkhilfe_kamera)
  levels(d$einparkhilfe_kamera)=c("F","T")
  d <- transform(d, einparkhilfe_kamera = as.logical(einparkhilfe_kamera))
  d$einparkhilfe_selbstlenkendes_system <- factor(d$einparkhilfe_selbstlenkendes_system)
  levels(d$einparkhilfe_selbstlenkendes_system)=c("F","T")
  d <- transform(d, einparkhilfe_selbstlenkendes_system = as.logical(einparkhilfe_selbstlenkendes_system))
  d$einparkhilfe_sensoren_vorne <- factor(d$einparkhilfe_sensoren_vorne)
  levels(d$einparkhilfe_sensoren_vorne)=c("F","T")
  d <- transform(d, einparkhilfe_sensoren_vorne = as.logical(einparkhilfe_sensoren_vorne))
  d$einparkhilfe_sensoren_hinten <- factor(d$einparkhilfe_sensoren_hinten)
  levels(d$einparkhilfe_sensoren_hinten)=c("F","T")
  d <- transform(d, einparkhilfe_sensoren_hinten = as.logical(einparkhilfe_sensoren_hinten))
  d$radio <- factor(d$radio)
  levels(d$radio)=c("F","T")
  d <- transform(d, radio = as.logical(radio))
  d$alufelgen <- factor(d$alufelgen)
  levels(d$alufelgen)=c("F","T")
  d <- transform(d, alufelgen = as.logical(alufelgen))
  d$sportfahrwerk <- factor(d$sportfahrwerk)
  levels(d$sportfahrwerk)=c("F","T")
  d <- transform(d, sportfahrwerk = as.logical(sportfahrwerk))
  d$sportpaket <- factor(d$sportpaket)
  levels(d$sportpaket)=c("F","T")
  d <- transform(d, sportpaket = as.logical(sportpaket))
  d$anhaengerkupplung <- factor(d$anhaengerkupplung)
  levels(d$anhaengerkupplung)=c("F","T")
  d <- transform(d, anhaengerkupplung = as.logical(anhaengerkupplung))
  d$scheckheftgepflegt <- factor(d$scheckheftgepflegt)
  levels(d$scheckheftgepflegt)=c("F","T")
  d <- transform(d, scheckheftgepflegt = as.logical(scheckheftgepflegt))
  d$nichtraucherfahrzeug <- factor(d$nichtraucherfahrzeug)
  levels(d$nichtraucherfahrzeug)=c("F","T")
  d <- transform(d, nichtraucherfahrzeug = as.logical(nichtraucherfahrzeug))
  d$garantie <- factor(d$garantie)
  levels(d$garantie)=c("F","T")
  d <- transform(d, garantie = as.logical(garantie))
  
  d$kilometer <- d$kilometer/10000
  
  return(d)
}

filter_SumData_may <- function(d) {
  # filter kilometer
  d <- d[which(d$kilometer < 330000),]
  
  # filter initial registration year
  d <- d[which(d$erstzulassung_jahr > 2004 & d$erstzulassung_jahr < 2016),]
  
  # filter power
  d <- d[which(d$leistung > 40 & d$leistung < 250),]
  
  # filter fuel
  d <- d[which(d$treibstoff == 'Benzin' | d$treibstoff == 'Diesel'),]
  
  # introduce the age column and filter negative age
  d <- merge_age_vector_may(d)
  d <- d[which(d$age >= 0),]
  
  return(d)
}

filter_SumData <- function(d) {
  # filter used car type
  # Gebraucht = Used
  # Jahreswagen = Used car purchased in the last 12 months
  # Tageszulassung = Car resgistered by dealer to be able to sell on a discount
  # Vorf?hrfahrzeug = Display car
  d <- d[which(d$fahrzeugart == 'Gebraucht' | d$fahrzeugart =='Jahreswagen' | d$fahrzeugart == 'Tageszulassung' | d$fahrzeugart == 'Vorf?hrfahrzeug'),]
  
  # filter kilometer
  d <- d[which(d$kilometer < 330000),]
  
  # filter initial registration year
  d <- d[which(d$erstzulassung_jahr > 2004 & d$erstzulassung_jahr < 2016),]
  
  # filter power
  d <- d[which(d$leistung > 40 & d$leistung < 250),]
  
  # filter fuel
  d <- d[which(d$treibstoff == 'Benzin' | d$treibstoff == 'Diesel'),]
  
  # introduce the age column and filter negative age
  d <- merge_age_vector_oct(d)
  d <- d[which(d$age >= 0),]
  
  return(d)
}

filter_dealer_with_rating <- function(d) {
  # filter dealer only
  d <- d[which(d$anbieter_typ == 'Gewerblicher Anbieter'),]
  
  # filter dealer with ratings
  d <- d[which(d$anzahl_bewertungen > 0),]
  
  return(d)
}

filter_dealer_no_rating <- function(d) {
  # filter dealer only
  d <- d[which(d$anbieter_typ == 'Gewerblicher Anbieter'),]
  
  # filter dealer without ratings
  d <- d[which(d$anzahl_bewertungen == 0 | is.na(d$anzahl_bewertungen)),]
  
  return(d)
}

filter_PrivateData <- function(d) {
  # filter private seller only
  d <- d[which(d$anbieter_typ == 'Privater Anbieter'),]
  
  return(d)
}


# create necessary data frames

#RawData <- classification_october(volkswagen_golf_151025)
  
#SumData <- filter_SumData(RawData)
  
#DealerWRatingData <- filter_dealer_with_rating(SumData)
  
#DealerWORatingData <- filter_dealer_no_rating(SumData)
  
#PrivateData <- filter_PrivateData(SumData)

#rm(RawData)




