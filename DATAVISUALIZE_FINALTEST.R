library(coronavirus)
library(quantmod)
data("coronavirus")
str(coronavirus)
head(coronavirus)
library(ggplot2)
corona_korea = coronavirus[coronavirus$country == 'Korea, South',]
corona_korea
corona_korea = corona_korea[corona_korea$type =='confirmed',]
corona_korea = corona_korea[corona_korea$date <  as.Date("2021-01-22"),]
head(corona_korea)
library(dplyr)
corona_korea_final = select(corona_korea, date, cases)
head(corona_korea_final)
ggplot(data = corona_korea_final,mapping = aes(x = date, y = cases))+ geom_line()
corona_korea_final$data_20 = runMean(corona_korea_final$cases, n = 50)
head(corona_korea_final,50)
ggplot(data=corona_korea_final) + geom_line(aes(x = date, y = cases), color="blue", linetype=5) + geom_line(data=corona_korea_final, aes(x = date, y = data_20), color="red", linetype=5)