require("jsonlite")
require("RCurl")
# Change the USER and PASS below to be your UTEid
djdf <- data.frame(fromJSON(getURL(URLencode('129.152.144.84:5001/rest/native/?query="select * from DJIA "'),httpheader=c(DB='jdbc:oracle:thin:@129.152.144.84:1521/PDBF15DV.usuniversi01134.oraclecloud.internal', USER='cs329e_gmg954', PASS='orcl_gmg954', MODE='native_mode', MODEL='model', returnDimensions = 'False', returnFor = 'JSON'), verbose = TRUE), ))
tbl_df(djdf)

summary(df)

head(df)





#This data shows the cycilical nature of the Dow Jones price score fluctuations in the month of June over a number of years.
djdf %>% filter(grepl('-Jun', Date)) %>% mutate(lead_z = CLOSE-lead(CLOSE)) %>% ggplot(aes(x = Date, y = lead_z)) + geom_point(aes(color=lead_z))

#This data shows each of the days values of every day of the year.  We can see where most of the data falls into three categories.  A high, a lower-mid, and a bottom.
djdf %>% group_by(Date) %>% summarise(mean = mean(OPEN)) %>% ggplot(aes(x=Date, y=mean, color=Date)) + geom_point() 

#This data distribution is the same as the previous, but segmented just for one month.  The distribution is the same.
djdf %>% filter(grepl('-Jan', Date)) %>% mutate(price_percent = cume_dist(OPEN)) %>% filter(price_percent >= 0.3 | price_percent <= .7) %>% ggplot(aes(x = Date, y = OPEN)) + geom_point()

#This data shows the differences of the open and closing amounts, showing how much the Dow changes from the beginning to the end of the day 
djdf %>% mutate(diff = CLOSE - OPEN)  %>% ggplot(aes(x=Date, y=diff, color=diff)) + geom_point() 

