require(tidyr)
require(dplyr)
require(ggplot2)
tbl_df(djdf)

#This data shows the differences of the open and closing amounts, showing how much the Dow changes from the beginning to the end of the day 
djdf %>% group_by(Date) %>% mutate(diff = CLOSE - OPEN)  %>% ggplot(aes(x=Date, y=diff, color=diff)) + geom_point() 
