require(tidyr)
require(dplyr)
require(ggplot2)
tbl_df(djdf)

#This data shows each of the days values of every day of the year.  We can see where most of the data falls into three categories.  A high, a lower-mid, and a bottom.
djdf %>%  filter(grepl('-Jun', Date)) %>% summarise(mean = mean(OPEN)) %>% ggplot(aes(x=Date, y=mean, color=OPEN)) + geom_point() 

