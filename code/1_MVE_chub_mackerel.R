# https://luismurao.github.io/
# library(devtools)
# devtools::install_github("luismurao/ntbox")

source("code/0_auxiliar_functions.R")
library(pacman)
pacman::p_load(ntbox, rgl, marmap, oce, raster, stringr, oceanmap, tmap, lubridate, dplyr, plyr, gplots,
               tmaptools, fields, maptools, binovisualfields, rgdal, maps, rworldmap, mapplots, geoR, 
               ncdf4, prettymapr, SDMTools, RColorBrewer, Metrics, ROCR, mapdata, pgirmess, ggplot2, 
               gapminder, forcats, Hmisc, corrplot)

# -------------------------------------------------------------------------
# CABALLA -----------------------------------------------------------------
# -------------------------------------------------------------------------
sp <- "caballa"

# READ DATA
# Total -------------------------------------------------------------------
data      <- utils::read.csv("data/presence_caballa.csv")
data      <- data[complete.cases(data), ]
data$date <- as.Date(data$date, format = "%Y-%m-%d")
data$year <- year(data$date)

# Adding date
pg$date <- as.Date(pg$date, format = "%Y-%m-%d")

#CLEANING DATA
pg <- pg[complete.cases(pg), ]

# SELECT PERIODS
pg_nino <- pg %>% 
  filter(date >= "1997-05-01" & date <= "1998-05-31")

pg_nina <- pg %>% 
  filter(date >= "1998-08-01" & date <= "2000-03-31")



# Train data --------------------------------------------------------------
experiment <- rbind(pg_nino, pg_nina)

ntrain <- experiment %>% dplyr::select(CHL, OXY, SSS, SST)


# Correlation and corvif
environ_cors_ntrain <- cor(ntrain)

env_varsL <- ntbox::correlation_finder(cor_mat = environ_cors_ntrain,
                                       threshold = 0.7,
                                       verbose = FALSE)
(env_vars <- env_varsL$descriptors)

corvif(ntrain)

# plot correlation
matrix_first <- rcorr(as.matrix(ntrain), type = "pearson")
col <- colorRampPalette(c("#BB4444", "#EE9988", "#FFFFFF", "#77AADD", "#4477AA"))

x11()
corrplot(matrix_first$r, method="ellipse", col=col(200),  
         type="lower", addCoef.col = "black", 
         tl.col="black", tl.srt=45, insig = "blank", 
         diag=FALSE, p.mat = matrix_first$P, sig.level = 0.05)
dev.copy(tiff, filename = "figures/correlation_plot.tiff", width = 1000, height = 1000, res = 140)
dev.off()



# Test MVE ----------------------------------------------------------------


