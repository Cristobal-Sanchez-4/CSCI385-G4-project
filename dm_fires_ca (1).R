suppressMessages({
  library(tidyverse)
  library(knitr)
  library(here)
  library(pander)
  library(gridExtra)
  library(gtsummary)
  library(ggpubr)
  library(scales)
  library(marginaleffects)
  library(gridExtra)
})

# Load Data

## Change the directory (file path) to where you have the file located on your computer

fires <- read_csv('/Users/mmigu/OneDrive/Desktop/qmd/csci385/project/data/national_interagency_fire_occurrence_(1992-2020).csv')

# Data Cleaning
fires_ca <- fires %>%
  select(FIRE_NAME, FIRE_YEAR, DISCOVERY_DATE, DISCOVERY_DOY, DISCOVERY_TIME, NWCG_CAUSE_CLASSIFICATION, NWCG_GENERAL_CAUSE, 
         CONT_DATE, CONT_DOY, CONT_TIME, FIRE_SIZE, FIRE_SIZE_CLASS, LATITUDE, LONGITUDE, OWNER_DESCR, STATE, COUNTY) %>%
  filter(STATE == "CA", 
         FIRE_YEAR >= 2000, 
         COUNTY == c("ALAMEDA", "AMADOR", "BUTTE", "CALAVERAS", "COLUSA", "CONTRA COSTA", "DEL NORTE", "EL DORADO", "FRESNO", 
                     "GLENN", "HUMBOLDT", "IMPERIAL", "INYO", "KERN", "KINGS", "LAKE", "LASSEN", "LOS ANGELES", "MADERA",
                     "MARIN", "MARIPOSA", "MENDOCINO", "MERCED", "MODOC", "MONO", "MONTEREY", "NAPA", "NEVADA", "ORANGE", "PLACER",
                     "PLUMAS", "RIVERSIDE", "SACRAMENTO", "SAN BENITO", "SAN BERNARDINO", "SAN DIEGO", "SAN FRANCISCO", "SAN JOAQUIN",
                     "SAN LUIS OBISPO", "SAN MATEO", "SANTA BARBARA", "SANTA CLARA", "SANTA CRUZ", "SHASTA", "SIERRA", "SISKIYOU",
                     "SOLANO", "SONOMA", "STANISLAUS", "SUTTER", "TEHAMA", "TRINITY", "TULARE", "TUOLUMNE", "VENTURA", "YOLO", 
                     "YUBA"))

fires_ca <- fires_ca %>%
  rename(`Fire Name` = FIRE_NAME,
         `Year` = FIRE_YEAR,
         `Discovery Date` = DISCOVERY_DATE,
         `Discovery Date of Year` = DISCOVERY_DOY,
         `Discovery Time` = DISCOVERY_TIME,
         `Classification` = NWCG_CAUSE_CLASSIFICATION,
         `General Cause` = NWCG_GENERAL_CAUSE,
         `Containment Date` = CONT_DATE,
         `Containment Date of Year` = CONT_DOY,
         `Containment Time` = CONT_TIME,
         `Fire Size` = FIRE_SIZE,
         `Fire Size Class` = FIRE_SIZE_CLASS,
         `Latitude` = LATITUDE,
         `Longitude` = LONGITUDE,
         `Land Description` = OWNER_DESCR,
         `State` = STATE,
         `County` = COUNTY)

rm(fires)

## Change the directory (file path) to the same file location as your project file!

save(list = c("fires_ca"), file = "/Users/mmigu/OneDrive/Desktop/qmd/csci385/project/fires_ca_clean.Rdata")
