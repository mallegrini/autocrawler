# Regression Models

# Check significance of parameters
# [1] "marke"
# [2] "modell"
# [4] "kilometer"
kilometer <- lm(preis ~ kilometer, data = SumData)
summary(kilometer)
rm(kilometer)
# [5] "erstzulassung_monat" 
# [6] "erstzulassung_jahr"
erstzulassung_jahr <- lm(preis ~ as.factor(erstzulassung_jahr), data=SumData)
summary(erstzulassung_jahr)
rm(erstzulassung_jahr)
# [7] "leistung"
leistung <- lm(preis ~ leistung, data=SumData)
summary(leistung)
rm(leistung)
# [8] "treibstoff"
treibstoff <- lm(preis ~ as.factor(treibstoff), data=SumData)
summary(treibstoff)
rm(treibstoff)
# [9] "mfk_monat"
# [10] "mfk_jahr" 
mfk_jahr <- lm(preis ~ as.factor(mfk_jahr), data=SumData)
summary(mfk_jahr)
rm(mfk_jahr)
# [11] "angebotsnummer"
# [12] "fahrzeughalter"
fahrzeughalter <- lm(preis ~ as.factor(fahrzeughalter), data=SumData)
summary(fahrzeughalter)
rm(fahrzeughalter)
# [13] "fahrzeugart"
fahrzeugart <- lm(preis ~ as.factor(fahrzeugart), data=SumData)
summary(fahrzeugart)
rm(fahrzeugart)
# [14] "karosserieform"
# [15] "getriebe"
# [16] "antriebsart"
# [17] "gaenge"
# [18] "hubraum"
# [19] "kraftstoffverbrauch"
kraftstoffverbrauch <- lm(preis ~ kraftstoffverbrauch, data=SumData)
summary(kraftstoffverbrauch)
rm(kraftstoffverbrauch)
# [20] "co2_emissionen"
# [21] "co2_effizienzklasse"
# [22] "schadstoffklasse"
# [23] "tueren"
# [24] "sitzplaetze"
# [25] "garantie"
garantie <- lm(preis ~ as.factor(garantie), data=SumData)
summary(garantie)
rm(garantie)
# [26] "aussenfarbe"
# [27] "innenausstattung"
# [28] "alarmanlage"
alarmanlage <- lm(preis ~ as.factor(alarmanlage), data=SumData)
summary(alarmanlage)
rm(alarmanlage)
# [29] "tagfahrlicht"
tagfahrlicht <- lm(preis ~ as.factor(tagfahrlicht), data=SumData)
summary(tagfahrlicht)
rm(tagfahrlicht)
# [30] "traktionskontrolle"
traktionskontrolle <- lm(preis ~ as.factor(traktionskontrolle), data=SumData)
summary(traktionskontrolle)
rm(traktionskontrolle)
# [31] "klimaanlage"
klimaanlage <- lm(preis ~ as.factor(klimaanlage), data=SumData)
summary(klimaanlage)
rm(klimaanlage)
# [32] "klimaautomatik"
klimaautomatik <- lm(preis ~ as.factor(klimaautomatik), data=SumData)
summary(klimaautomatik)
rm(klimaautomatik)
# [33] "panoramadach"
panoramadach <- lm(preis ~ as.factor(panoramadach), data=SumData)
summary(panoramadach)
rm(panoramadach)
# [34] "schiebedach"
schiebedach <- lm(preis ~ as.factor(schiebedach), data=SumData)
summary(schiebedach)
rm(schiebedach)
# [35] "einparkhilfe_kamera"
einparkhilfe_kamera <- lm(preis ~ as.factor(einparkhilfe_kamera), data=SumData)
summary(einparkhilfe_kamera)
rm(einparkhilfe_kamera)
# [36] "einparkhilfe_selbstlenkendes_system"
# [37] "einparkhilfe_sensoren_vorne"
# [38] "einparkhilfe_sensoren_hinten"
# [39] "radio"
radio <- lm(preis ~ as.factor(radio), data=SumData)
summary(radio)
rm(radio)
# [40] "alufelgen"
alufelgen <- lm(preis ~ as.factor(alufelgen), data=SumData)
summary(alufelgen)
rm(alufelgen)
# [41] "sportfahrwerk"
sportfahrwerk <- lm(preis ~ as.factor(sportfahrwerk), data=SumData)
summary(sportfahrwerk)
rm(sportfahrwerk)
# [42] "sportpaket"
sportpaket <- lm(preis ~ as.factor(sportpaket), data=SumData)
summary(sportpaket)
rm(sportpaket)
# [43] "anhaengerkupplung"
anhaengerkupplung <- lm(preis ~ as.factor(anhaengerkupplung), data=SumData)
summary(anhaengerkupplung)
rm(anhaengerkupplung)
# [44] "scheckheftgepflegt"
scheckheftgepflegt <- lm(preis ~ as.factor(scheckheftgepflegt), data=SumData)
summary(scheckheftgepflegt)
rm(scheckheftgepflegt)
# [45] "nichtraucherfahrzeug"
nichtraucherfahrzeug <- lm(preis ~ as.factor(nichtraucherfahrzeug), data=SumData)
summary(nichtraucherfahrzeug)
rm(nichtraucherfahrzeug)
# [46] "anbieter_typ"
anbieter_typ <- lm(preis ~ as.factor(anbieter_typ), data=SumData)
summary(anbieter_typ)
rm(anbieter_typ)
# [47] "anbieter_name"
# [48] "anbieter_tel"
# [49] "anbieter_adresse_strasse"
# [50] "anbieter_adresse_land"
# [51] "anbieter_adresse_plz"
# [52] "anbieter_adresse_ort"
# [53] "anbieter_webseite"
# [54] "bewertung_durchschnitt"
bewertung_durchschnitt <- lm(preis ~ bewertung_durchschnitt, data=DealerWRatingData)
summary(bewertung_durchschnitt)
rm(bewertung_durchschnitt)
# [55] "bewertung_gesamteindruck"
bewertung_gesamteindruck <- lm(preis ~ bewertung_gesamteindruck, data=DealerWRatingData)
summary(bewertung_gesamteindruck)
rm(bewertung_gesamteindruck)
# [56] "bewertung_erreichbarkeit"
bewertung_erreichbarkeit <- lm(preis ~ bewertung_erreichbarkeit, data=DealerWRatingData)
summary(bewertung_erreichbarkeit)
rm(bewertung_erreichbarkeit)
# [57] "bewertung_zuverlaessigkeit"
bewertung_zuverlaessigkeit <- lm(preis ~ bewertung_zuverlaessigkeit, data=DealerWRatingData)
summary(bewertung_zuverlaessigkeit)
rm(bewertung_zuverlaessigkeit)
# [58] "bewertung_angebotsbeschreibung"
bewertung_angebotsbeschreibung <- lm(preis ~ bewertung_angebotsbeschreibung, data=DealerWRatingData)
summary(bewertung_angebotsbeschreibung)
rm(bewertung_angebotsbeschreibung)
# [59] "bewertung_kauferlebnis"
bewertung_kauferlebnis <- lm(preis ~ bewertung_kauferlebnis, data=DealerWRatingData)
summary(bewertung_kauferlebnis)
rm(bewertung_kauferlebnis)
# [60] "anzahl_bewertungen"
anzahl_bewertungen <- lm(preis ~ anzahl_bewertungen, data=DealerWRatingData)
summary(anzahl_bewertungen)
rm(anzahl_bewertungen)
# [61] "prozentsatz_weiterempfehlungen"
prozentsatz_weiterempfehlungen <- lm(preis ~ prozentsatz_weiterempfehlungen, data=DealerWRatingData)
summary(prozentsatz_weiterempfehlungen)
rm(prozentsatz_weiterempfehlungen)
# [62] "dienstleistung_abgastest"
dienstleistung_abgastest <- lm(preis ~ as.factor(dienstleistung_abgastest), data=DealerWRatingData)
summary(dienstleistung_abgastest)
rm(dienstleistung_abgastest)
# [63] "dienstleistung_ersatzteilverkauf"
# dienstleistung_ersatzteilverkauf <- lm(preis ~ as.factor(dienstleistung_ersatzteilverkauf), data=DealerWRatingData)
# summary(dienstleistung_ersatzteilverkauf)
# [64] "dienstleistung_service_24h"
dienstleistung_service_24h <- lm(preis ~ as.factor(dienstleistung_service_24h), data=DealerWRatingData)
summary(dienstleistung_service_24h)
rm(dienstleistung_service_24h)
# [65] "dienstleistung_versicherungen"
dienstleistung_versicherungen <- lm(preis ~ as.factor(dienstleistung_versicherungen), data=DealerWRatingData)
summary(dienstleistung_versicherungen)
rm(dienstleistung_versicherungen)
# [66] "dienstleistung_werkstatt"
dienstleistung_werkstatt <- lm(preis ~ as.factor(dienstleistung_werkstatt), data=DealerWRatingData)
summary(dienstleistung_werkstatt)
rm(dienstleistung_werkstatt)
# [67] "dienstleistung_finanzservice"
dienstleistung_finanzservice <- lm(preis ~ as.factor(dienstleistung_finanzservice), data=DealerWRatingData)
summary(dienstleistung_finanzservice)
rm(dienstleistung_finanzservice)
# [68] "dienstleistung_zulassungsservice"
dienstleistung_zulassungsservice <- lm(preis ~ as.factor(dienstleistung_zulassungsservice), data=DealerWRatingData)
summary(dienstleistung_zulassungsservice)
rm(dienstleistung_zulassungsservice)
# [69] "link"
# [70] "age"
age <- lm(preis ~ age, data=SumData)
summary(age)
rm(age)


# Hypothesis 1: dealer prices are higher than thos of private sellers
# age, mileage and horsepower have the most significant effect on the offer price, and are therefore included
# garantie: all private sellers do not offer warranty, 11533 dealers only offer warranty stated by law and no additional
# 29600 dealers offer additional warranty coverage
seller_type_1 <- lm(log(preis) ~ age + kilometer + leistung + as.factor(treibstoff)
                    + as.factor(scheckheftgepflegt) + as.factor(nichtraucherfahrzeug) + as.factor(anbieter_typ), data=SumData)
summary(seller_type_1)

seller_type_2 <- lm(log(preis) ~ age + kilometer + leistung + as.factor(anbieter_typ), data=SumData)
summary(seller_type_2)

seller_type_3 <- lm(log(preis) ~ as.factor(anbieter_typ), data=SumData)
summary(seller_type_3)

# Hypothesis 2: ratings have a positive effect on offer price
without_rating <- lm(log(preis) ~ age + kilometer + leistung + as.factor(garantie), data=DealerWRatingData)
summary(without_rating)

average_rating <- lm(log(preis) ~ age + kilometer + leistung + as.factor(garantie) 
                     + bewertung_durchschnitt, data=DealerWRatingData)
summary(average_rating) 

number_of_rating <- lm(log(preis) ~ age + kilometer + leistung + as.factor(garantie)
                       + bewertung_durchschnitt + anzahl_bewertungen, data=DealerWRatingData)
summary(number_of_rating)

average_number_rating <- lm(log(preis) ~ bewertung_durchschnitt + anzahl_bewertungen, data=DealerWRatingData)
summary(average_number_rating)

average_rating_only <- lm(log(preis) ~ bewertung_durchschnitt, data=DealerWRatingData)
summary(average_rating_only)

# effect of each ratings
rating_general_impression <- lm(log(preis) ~ age + kilometer + leistung + as.factor(garantie) + bewertung_gesamteindruck, data=DealerWRatingData)
summary(rating_general_impression)


rating_accessibility <- lm(log(preis) ~ age + kilometer + leistung + as.factor(garantie) + bewertung_erreichbarkeit, data=DealerWRatingData)
summary(rating_accessibility)


rating_reliability <- lm(log(preis) ~ age + kilometer + leistung + as.factor(garantie) + bewertung_zuverlaessigkeit, data=DealerWRatingData)
summary(rating_reliability)


rating_offer_description <- lm(log(preis) ~ age + kilometer + leistung + as.factor(garantie) + bewertung_angebotsbeschreibung, data=DealerWRatingData)
summary(rating_offer_description)


rating_purchase_experience <- lm(log(preis) ~ age + kilometer + leistung + as.factor(garantie) + bewertung_kauferlebnis, data=DealerWRatingData)
summary(rating_purchase_experience)

# tdi models
tdi_may_regression <- lm(log(preis) ~ age + kilometer + leistung, data=tdi_may)
summary(tdi_may_regression)

tdi_october_regression <- lm(log(preis) ~ age + kilometer + leistung, data=tdi_october)
summary(tdi_october_regression)

# diesel data frame with scandal dummy
diesel_regression <- lm(log(preis) ~ age + kilometer + leistung + as.factor(scandal), data=diesel_sum)
summary(diesel_regression)

# calculate elasticities
elasticity <- lm(log(preis) ~ age + kilometer + leistung + log(bewertung_durchschnitt), data=DealerWRatingData)
summary(elasticity)