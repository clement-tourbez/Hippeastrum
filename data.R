SciViews::R


(hip <- as_dataframe(tibble(
  stalk = rep(c(1, 2,3,4,5),2),
  height = c(26.8,1.5,1.3,0.5,2.3,28.5,0.3,1.5,1.3,2.4 ),
  day = rep(c(1,2),each = 5)
)))

hip$stalk <- as.factor(hip$stalk)
hip$day <- as.factor(hip$day)

visdat::vis_dat(hip)






ggpubr::ggtexttable(head(hip))


---------


















