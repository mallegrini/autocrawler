# finding TDI cars retrospectively

#tdi_october contains diesel tdi cars in october extraction
tdi_october <- SumData[grep("tdi", SumData$modell, ignore.case = TRUE),]

#tdi_may contains diesel tdi cars in may extraction
tdi_may_vector <- volkswagen_golf_150511$angebotsnummer %in% tdi_october$angebotsnummer
tdi_may <- volkswagen_golf_150511[tdi_may_vector,]

# introduce the age column and filter negative age
tdi_may <- merge_age_vector_may(tdi_may)
tdi_may <- tdi_may[which(tdi_may$age >= 0),]

#limit tdi_october to diesel tdi cars that also appeared in may
tdi_october_vector <- tdi_october$angebotsnummer %in% tdi_may$angebotsnummer
tdi_october <- tdi_october[tdi_october_vector,]

rm(tdi_may_vector)
rm(tdi_october_vector)

#############################################################################################################

# dummy variable before after VW diesel scandal

# setup data frame for May pre-scandal
diesel_may <- classification_may(volkswagen_golf_150511)
diesel_may <- filter_SumData_may(diesel_may)
diesel_may <- diesel_may[which(diesel_may$treibstoff == 'Diesel'),]

# scandal dummy is false in May
scandal <- rep(FALSE, length.out = nrow(diesel_may))
diesel_may <- cbind.data.frame(diesel_may,scandal)

# setup data frame for October post-scandal
diesel_october <- classification_october(volkswagen_golf_151025)
diesel_october <- filter_SumData(diesel_october)
diesel_october <- diesel_october[which(diesel_october$treibstoff == 'Diesel'),]

# scandal dummy is true in October
scandal <- rep(TRUE, length.out = nrow(diesel_october))
diesel_october <- cbind.data.frame(diesel_october,scandal)

require(plyr)
diesel_sum <- rbind.fill(diesel_may, diesel_october)

rm(scandal)
