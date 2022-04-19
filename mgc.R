library(tidyverse)
library(magrittr)
library(reshape2)

setwd('C:/Users/tpmon/OneDrive/Documents/rock and roll')
mgc <- read.csv('mgc.csv', header = FALSE) %>% `[`(,c(1,2,4,3,5))
names(mgc) <- c('Name','Scalawag','Both',"Ne'er-do-well",'Neither')
mgc[,-1] %<>% multiply_by(1/19)
mgc %<>% melt()
names(mgc)[2] <- 'Legend'
ggplot(mgc, aes(x="", y=value, group=Legend, color=Legend, fill=Legend)) +
  geom_bar(width = 1, stat = "identity") +
  coord_polar("y", start=0) + 
  facet_wrap(~ Name, ncol = 6) +
  theme_bw() +
  theme(axis.text = element_blank(),
        axis.ticks = element_blank(),
        panel.grid  = element_blank(),
        strip.text.x = element_text(size = 8)) +
  labs(x = '', y = '') +
  scale_fill_manual(values=c("#6699FF", "#FFFF00", "#B3CC80", "#FFFFFF"))
