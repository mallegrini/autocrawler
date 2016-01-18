linear_models <- function(){
  kilometer <- lm(preis ~ kilometer, data = SumData)
  print(summary(kilometer))
  
  leistung <- lm(preis ~ leistung, data=SumData)
  print(summary(leistung))
  
  fahrzeugart <- lm(preis ~ as.factor(fahrzeugart)-1, data=SumData)
  print(summary(fahrzeugart))
  
  garantie <- lm(preis ~ as.factor(garantie)-1, data=SumData)
  print(summary(garantie))
  
  bewertung_durchschnitt <- lm(preis ~ bewertung_durchschnitt, data=DealerWRatingData)
  print(summary(bewertung_durchschnitt))

  bewertung_gesamteindruck <- lm(preis ~ bewertung_gesamteindruck, data=DealerWRatingData)
  print(summary(bewertung_gesamteindruck))

  bewertung_erreichbarkeit <- lm(preis ~ bewertung_erreichbarkeit, data=DealerWRatingData)
  print(summary(bewertung_erreichbarkeit))

  bewertung_zuverlaessigkeit <- lm(preis ~ bewertung_zuverlaessigkeit, data=DealerWRatingData)
  print(summary(bewertung_zuverlaessigkeit))

  bewertung_angebotsbeschreibung <- lm(preis ~ bewertung_angebotsbeschreibung, data=DealerWRatingData)
  print(summary(bewertung_angebotsbeschreibung))

  bewertung_kauferlebnis <- lm(preis ~ bewertung_kauferlebnis, data=DealerWRatingData)
  print(summary(bewertung_kauferlebnis))

  anzahl_bewertungen <- lm(preis ~ anzahl_bewertungen, data=DealerWRatingData)
  print(summary(anzahl_bewertungen))
  
  prozentsatz_weiterempfehlungen <- lm(preis ~ prozentsatz_weiterempfehlungen, data=DealerWRatingData)
  print(summary(prozentsatz_weiterempfehlungen))
  
  performance_guarantee <- lm(preis ~ as.factor(erstzulassung_jahr)-1 + kilometer + leistung + garantie, data=SumData)
  print(summary(performance_guarantee))
  
  ave_rating <- lm(preis ~ as.factor(erstzulassung_jahr)-1 + kilometer + bewertung_durchschnitt 
                   + leistung + garantie, data=DealerWRatingData)
  print(summary(ave_rating))
  
  number_of_rating <- lm(preis ~ as.factor(erstzulassung_jahr)-1 + kilometer + anzahl_bewertungen + bewertung_durchschnitt 
                         + leistung, data=DealerWRatingData)
  print(summary(number_of_rating))
  
  general_impression <- lm(preis ~ as.factor(erstzulassung_jahr)-1 + kilometer + anzahl_bewertungen 
                           + bewertung_gesamteindruck  + leistung + garantie, data=DealerWRatingData)
  print(summary(general_impression))
  
  rating_accessibility <- lm(preis ~ as.factor(erstzulassung_jahr)-1 + kilometer + anzahl_bewertungen 
                             + bewertung_erreichbarkeit + leistung + garantie, data=DealerWRatingData)
  print(summary(rating_accessibility))
  
  rating_reliability <- lm(preis ~ as.factor(erstzulassung_jahr)-1 + kilometer + anzahl_bewertungen 
                           + bewertung_zuverlaessigkeit + leistung + garantie, data=DealerWRatingData)
  print(summary(rating_reliability))
  
  rating_offer_discription <- lm(preis ~ as.factor(erstzulassung_jahr)-1 + kilometer + anzahl_bewertungen 
                                 + bewertung_angebotsbeschreibung + leistung + garantie, data=DealerWRatingData)
  print(summary(rating_offer_discription))
  
  rating_purchase_experience <- lm(preis ~ as.factor(erstzulassung_jahr)-1 + kilometer + anzahl_bewertungen 
                                   + bewertung_kauferlebnis + leistung + garantie, data=DealerWRatingData)
  print(summary(rating_purchase_experience))
  
  guarantee_seller_type <- lm(preis ~ as.factor(erstzulassung_jahr) + as.factor(anbieter_typ)-1 + kilometer + leistung + garantie, data=SumData)
  print(summary(guarantee_seller_type))
  
  ElasticityData <- data.frame(cbind(log(DealerWRatingData$preis), DealerWRatingData$erstzulassung_jahr, 
                                     DealerWRatingData$kilometer, log(DealerWRatingData$bewertung_durchschnitt)))
  elasticity <- lm(log(DealerWRatingData$preis) ~ as.factor(DealerWRatingData$erstzulassung_jahr)-1 + 
                     DealerWRatingData$kilometer + log(DealerWRatingData$bewertung_durchschnitt), data=ElasticityData)
  print(summary(elasticity))
  rm(ElasticityData)
}

descriptive_statistics <- function(){
  require(boot)
  library(pastecs)
  options(scipen = 100)
  options(digits = 2)
  
  
  print(stat.desc(SumData[,c("preis","kilometer","leistung","erstzulassung_jahr", "mfk_jahr","fahrzeughalter",
                       "bewertung_durchschnitt", "bewertung_erreichbarkeit", "bewertung_zuverlaessigkeit",
                       "bewertung_angebotsbeschreibung", "bewertung_kauferlebnis", "anzahl_bewertungen",
                       "prozentsatz_weiterempfehlungen")]))
}

text_output <- function() {
  sink("autoscout24_output_160110.txt")
  linear_models()
  descriptive_statistics()
  sink()
}

save_autoscout24 <- function() {
  save.image("autoscout24_160110.Rdata")
}

age_counter_oct <- function(month, year) {
  file_date <- as.yearmon("2015-11")
  registry_date <- as.yearmon(paste(c(year,"-",month), collapse = ""))
  return(12 * as.numeric(file_date - registry_date))
}

age_vector_oct <- function(df) {
  library(zoo)
  vector <- mapply(age_counter_oct, df$erstzulassung_monat, df$erstzulassung_jahr)
  return(vector)
}

merge_age_vector_oct <- function(df) {
  age <- age_vector_oct(df)
  return(cbind.data.frame(df,age))
}

age_counter_may <- function(month, year) {
  file_date <- as.yearmon("2015-05")
  registry_date <- as.yearmon(paste(c(year,"-",month), collapse = ""))
  return(12 * as.numeric(file_date - registry_date))
}

age_vector_may <- function(df) {
  library(zoo)
  vector <- mapply(age_counter_may, df$erstzulassung_monat, df$erstzulassung_jahr)
  return(vector)
}

merge_age_vector_may <- function(df){
  age <- age_vector_may(df)
  return(cbind.data.frame(df,age))
}

linear_model_diagnostics <- function(LinMod) {
  library(MASS)
  library(leaps)
  library(relaimpo)
  
  # placeholder for name of linear model
  name <- deparse(substitute(LinMod))
  
  # text output
  sink(paste("diagnostics/", name, ".txt", sep = ""))
  
  title <- paste("Linear Model:", name, "\n", sep = " ")
  cat(title)
  
  # linear regression result
  cat("\nLinear Regression\n")
  print(summary(LinMod))
  
  # anova of linear model
  cat("\nANOVA of Linear Model\n")
  print(anova(LinMod))
  
  # stepwise regression
  cat("\n\nStepwise Regression\n")
  step <- stepAIC(LinMod, direction = "both")
  step$anova

  sink()
  
  # diagram output as pdf
  pdf(paste("diagnostics/", name, ".pdf", sep = ""))
  
  layout(matrix(c(1,2,3,4),2,2))
  
  # linear regression diagnostics
  plot(LinMod)
  
  # relative importance
  boot <- boot.relimp(LinMod, type = c("lmg", "last", "first"), rank = TRUE, diff = TRUE, rela = TRUE)
  booteval.relimp(boot)
  plot(booteval.relimp(boot, sort = TRUE))
  
  dev.off()
  
  rm(step)
  rm(boot)
}

linear_model_diagnostics_single <- function(LinMod) {
  library(MASS)
  library(leaps)
  
  # placeholder for name of linear model
  name <- deparse(substitute(LinMod))
  
  # text output
  sink(paste("diagnostics/", name, ".txt", sep = ""))
  
  title <- paste("Linear Model:", name, "\n", sep = " ")
  cat(title)
  
  # linear regression result
  cat("\nLinear Regression\n")
  print(summary(LinMod))
  
  # anova of linear model
  cat("\nANOVA of Linear Model\n")
  print(anova(LinMod))
  
  # stepwise regression
  cat("\n\nStepwise Regression\n")
  step <- stepAIC(LinMod, direction = "both")
  step$anova
  
  sink()
  
  # diagram output as pdf
  pdf(paste("diagnostics/", name, ".pdf", sep = ""))
  
  layout(matrix(c(1,2,3,4),2,2))
  
  # linear regression diagnostics
  plot(LinMod)
  
  dev.off()
  
  rm(step)
}