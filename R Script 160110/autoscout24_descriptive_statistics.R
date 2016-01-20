# descriptive statistics

require(boot)
library(pastecs)
 
# exporting descriptive statistics
descriptive_stats <- stat.desc(SumData[,c("preis","kilometer","leistung","erstzulassung_jahr", "mfk_jahr","fahrzeughalter",
                     "bewertung_durchschnitt", "bewertung_erreichbarkeit", "bewertung_zuverlaessigkeit",
                     "bewertung_angebotsbeschreibung", "bewertung_kauferlebnis", "anzahl_bewertungen",
                     "prozentsatz_weiterempfehlungen", "age")])

sink("diagnostics/descriptive_statistics.txt")
cat("Descriptive Statistics\n\n")
print(descriptive_stats)
sink()
rm(descriptive_stats)

# exporting descriptive statistics from DealerWRatingData
descriptive_stats_DealerWRating <- stat.desc(DealerWRatingData[,c("preis","kilometer","leistung","erstzulassung_jahr", "mfk_jahr","fahrzeughalter",
                                          "bewertung_durchschnitt", "bewertung_erreichbarkeit", "bewertung_zuverlaessigkeit",
                                          "bewertung_angebotsbeschreibung", "bewertung_kauferlebnis", "anzahl_bewertungen",
                                          "prozentsatz_weiterempfehlungen", "age")])

sink("diagnostics/descriptive_stats_DealerWRating.txt")
cat("Descriptive Statistics of DealerWRatingData\n")
print(descriptive_stats_DealerWRating)
sink()
rm(descriptive_stats_DealerWRating)

# exporting descriptive statistics from DealerWORatingData
descriptive_stats_DealerWORating <- stat.desc(DealerWORatingData[,c("preis","kilometer","leistung","erstzulassung_jahr", "mfk_jahr","fahrzeughalter",
                                                                  "bewertung_durchschnitt", "bewertung_erreichbarkeit", "bewertung_zuverlaessigkeit",
                                                                  "bewertung_angebotsbeschreibung", "bewertung_kauferlebnis", "anzahl_bewertungen",
                                                                  "prozentsatz_weiterempfehlungen", "age")])

sink("diagnostics/descriptive_stats_DealerWORating.txt")
cat("Descriptive Statistics of DealerWORatingData\n")
print(descriptive_stats_DealerWORating)
sink()
rm(descriptive_stats_DealerWORating)

# exporting descriptive statistics from PrivateData
descriptive_stats_PrivateData <- stat.desc(PrivateData[,c("preis","kilometer","leistung","erstzulassung_jahr", "mfk_jahr","fahrzeughalter",
                                                                  "bewertung_durchschnitt", "bewertung_erreichbarkeit", "bewertung_zuverlaessigkeit",
                                                                  "bewertung_angebotsbeschreibung", "bewertung_kauferlebnis", "anzahl_bewertungen",
                                                                  "prozentsatz_weiterempfehlungen", "age")])

sink("diagnostics/descriptive_stats_PrivateData.txt")
cat("Descriptive Statistics of PrivateData\n")
print(descriptive_stats_PrivateData)
sink()
rm(descriptive_stats_PrivateData)


# exporting descriptive statistics from dealer_rating
descriptive_stats_dealer_rating <- stat.desc(dealer_rating[,c("Dealer Name","Number of Rating","Average Rating", 
                                                              "Overall Impression Rating", "Reachability Rating", 
                                                              "Reliability Rating", "Offer Description Rating", 
                                                              "Shopping Experience Rating", "Reccommendation Tendency")])

sink("diagnostics/descriptive_stats_dealer_rating.txt")
cat("Descriptive Statistics of dealer_rating\n")
print(descriptive_stats_dealer_rating)
sink()
rm(descriptive_stats_dealer_rating)



# exporting descriptive statistics from tdi_may
descriptive_stats_tdi_may <- stat.desc(tdi_may)

sink("diagnostics/descriptive_stats_tdi_may.txt")
cat("Descriptive Statistics of tdi_may\n")
print(descriptive_stats_tdi_may)
sink()
rm(descriptive_stats_tdi_may)

# exporting descriptive statistics from tdi_october
descriptive_stats_tdi_october <- stat.desc(tdi_october)

sink("diagnostics/descriptive_stats_tdi_october.txt")
cat("Descriptive Statistics of tdi_october\n")
print(descriptive_stats_tdi_october)
sink()
rm(descriptive_stats_tdi_october)


# histogram for price
pdf("diagnostics/price_histogramm.pdf")
hist(DealerWRatingData$preis, breaks=50)
hist(DealerWORatingData$preis, breaks=50)
hist(PrivateData$preis, breaks=50)
hist(SumData$preis, breaks=50, main="", xlab="Price")
dev.off()

# histogram for kilometer
pdf("diagnostics/kilometer_histogramm.pdf")
hist(DealerWRatingData$kilometer, breaks=50)
hist(DealerWORatingData$kilometer, breaks=50)
hist(PrivateData$kilometer, breaks=50)
hist(SumData$kilometer, breaks=50, main="", xlab="Mileage")
dev.off()

# histogram for horsepower
pdf("diagnostics/horsepower_histogramm.pdf")
hist(DealerWRatingData$leistung, breaks=50)
hist(DealerWORatingData$leistung, breaks=50)
hist(PrivateData$leistung, breaks=50)
hist(SumData$leistung, breaks=50, main="", xlab="Horsepower")
dev.off()

# histogram for age
pdf("diagnostics/age_histogramm.pdf")
hist(DealerWRatingData$age, breaks=50)
hist(DealerWORatingData$age, breaks=50)
hist(PrivateData$age, breaks=50)
hist(SumData$age, breaks=50,  main="", xlab = "Age")
dev.off()

# linear model diagnostics output
linear_model_diagnostics(seller_type_1)
linear_model_diagnostics(seller_type_2)
linear_model_diagnostics_single(seller_type_3)

linear_model_diagnostics(without_rating)
linear_model_diagnostics(average_rating)
linear_model_diagnostics(number_of_rating)
linear_model_diagnostics_single(average_number_rating)
linear_model_diagnostics_single(average_rating_only)

linear_model_diagnostics(rating_accessibility)
linear_model_diagnostics(rating_general_impression)
linear_model_diagnostics(rating_offer_description)
linear_model_diagnostics(rating_purchase_experience)
linear_model_diagnostics(rating_reliability)

linear_model_diagnostics(tdi_may_regression)
linear_model_diagnostics(tdi_october_regression)
linear_model_diagnostics(diesel_regression)

linear_model_diagnostics(elasticity)

# anova of DealearWRatingData: without_rating & average rating
sink("diagnostics/anova_DealerWRatingData.txt")
cat("ANOVA of linear models average_rating & without_rating from DealerWRatingData \n")
print(summary(anova(without_rating,average_rating)))
sink()
