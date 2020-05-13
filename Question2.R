## Question 2.a ## 

## R Code is modified from week08 tutorial class - Thursday 1800-1900 zoom session (https://ilearn.mq.edu.au/pluginfile.php/6349588/mod_resource/content/2/20200503_06.txt)##

library(WDI)

wdi_data <- WDI(indicator=c("NY.GDP.PCAP.PP.KD","EN.ATM.CO2E.PC"),start=2010,end=2010,extra=TRUE)

library(dplyr)
library(tibble)
wdi_data = as_tibble(wdi_data)
wdi_data <- wdi_data %>%
  rename(GDPpercap=NY.GDP.PCAP.PP.KD,Emit_CO2percap=EN.ATM.CO2E.PC)

library(ggplot2)
dat_map <- map_data("world")

library(readr)
write_csv(wdi_data,"wdi_CO2_GDP.csv")
wdi <- read_csv("wdi_CO2_GDP.csv")

library(countrycode)
dat_map$ccode<- countrycode(dat_map$region,origin="country.name",destination="wb")
wdi$ccode <- countrycode(wdi$country,origin="country.name",destination="wb")
merged <- full_join(dat_map, wdi, by="ccode")

library(ggplot2)
ggplot(merged, aes(x=long,y =lat, group = group, fill= Emit_CO2percap))+geom_polygon(colour = "cyan4")


data(Bali) 
op <- par(mar = c(0,0,0,0)) 
plot(Bali,displaylabels=TRUE,label.cex=0.8,pad=0.4,label.col="darkblue") 


## Question 2b and 2c ##

library(devtools)
install_github("DougLuke/UserNetR")

library(UserNetR)

library(statnet)

## Code of question 2b and 2c code from p.67 - Douglas A. Luke - A User's Guide to Network Analysis in R-Springer (2015) and little bit changed ##

#2b# 
get.vertex.attribute(Bali,"vertex.names")

op <- par(mar = c(0,0,0,0))
plot(Bali,displaylabels=TRUE,label.cex=0.8,pad=0.4,label.col="brown4") 

#2c#

rolelab <- get.vertex.attribute(Bali,"role") 
plot(Bali,usearrows=FALSE,label=rolelab,displaylabels=T,label.col="brown4")

