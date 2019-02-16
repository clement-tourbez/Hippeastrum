SciViews::R


(hip <- as_dataframe(tibble(
  stalk = c(1, 2,3,4,5),
  height = c(26.8,1.5,1.3,0.5,2.3 ),
  day = c(1,1,1,1,1)
)))

hip$stalk <- as.factor(hip$stalk)
hip$day <- as.factor(hip$day)

visdat::vis_dat(hip)






ggpubr::ggtexttable(head(hip))
