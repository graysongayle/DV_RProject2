require(tidyr)
require(dplyr)
require(ggplot2)
# Change the USER and PASS below to be your UTEid
djdf <- data.frame(fromJSON(getURL(URLencode('129.152.144.84:5001/rest/native/?query="select * from DJIA"'),httpheader=c(DB='jdbc:oracle:thin:@129.152.144.84:1521/PDBF15DV.usuniversi01134.oraclecloud.internal', USER='cs329e_gmg954', PASS='orcl_gmg954', MODE='native_mode', MODEL='model', returnDimensions = 'False', returnFor = 'JSON'), verbose = TRUE), ))
tbl_df(djdf)






#This data shows the cycilical nature of the Dow Jones price score fluctuations in the month of June over a number of years.
djdf %>% filter(grepl('-Jun', Date)) %>% mutate(lead_z = CLOSE-lead(CLOSE)) %>% ggplot(aes(x = Date, y = lead_z)) + geom_point(aes(color=lead_z))




