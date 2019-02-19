




# setting



SciViews::R

# stalk evolution


(stalk_evo <- as_dataframe(tibble(
  stalk = rep(c(1, 2,3,4,5),4),
  height = c(26.8,1.5,1.3,0.3,2.3,28.5,1.5,1.3,0.3,2.4,31.2,1.5,1.4,0.4,2.4,33.0,1.5,1.4,0.4,2.3 ),
  day = rep(c(1,2,3,4),each = 5)
)))

stalk_evo$stalk <- as.factor(stalk_evo$stalk)
stalk_evo$day <- as.factor(stalk_evo$day)

visdat::vis_dat(stalk_evo)






ggpubr::ggtexttable(head(stalk_evo))


# flower birth day


tibble(
    stalk = c(1,1,2,2,3,3,4,4,5,5),
    number    = c(1,2,1,2,1,2,1,2,1,2),
    day      = c(4,0,0,0,0,0,0,0,0,0)
  ) -> flower_day


flow <- xtabs(data = flower_day, day ~ stalk + number)
flow



  pander::pander(flow,
               caption = "day of the flower birth")

# flower evolution after the birth

  tibble(
    stalk = c(1),
    flower    = c(1),
    age      = c("day1"),
    petal_lg = c(10.3),
    male_lg = c(6.6),
    fml_lg= c (10.1)
  ) -> flower_evo




