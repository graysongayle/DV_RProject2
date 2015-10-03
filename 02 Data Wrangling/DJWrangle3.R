require(tidyr)
require(dplyr)
require(ggplot2)
tbl_df(djdf)

#This data distribution is the same as the previous, but segmented just for one month.  The distribution is the same.
djdf %>% filter(grepl('-Jan', Date)) %>% mutate(price_percent = cume_dist(OPEN)) %>% filter(price_percent >= 0.3 | price_percent <= .7) %>% ggplot(aes(x = Date, y = OPEN)) + geom_point()
