



# setting



SciViews::R

# stalk evolution


(stalk_evo <- as_dataframe(tibble(
  stalk = rep(c(1, 2,3,4,5),8),
  height = c(26.8,1.5,1.3,0.3,2.3,28.5,1.5,1.3,0.3,2.4,31.2,1.5,1.4,0.4,2.4,33.0,1.5,1.4,0.4,2.3,29.4,1.5,1.4,0.4,2.3,29.7,1.6,1.5,0.4,2.4,31.2,1.8,1.6,0.7,2.6,32.9,1.8,1.7,0.6,2.6),
  day = rep(c(1,2,3,4,5,6,7,8), each = 5 )
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
    stalk = c(1,1,1,1),
    flower    = c(1,1,1,1),
    age_day     = c(1,2,3,4,5),
    petal_lg = c(10.3,12,12.2,12.4,12.9),
    male_lg = c(6.6,6.5,6.3,6.2,6.9),
    fml_lg= c (10.1,10.1,10.1,10.1,10)
  ) -> flower_evo

  flower_evo$stalk <- as.factor(flower_evo$stalk)
  flower_evo$flower <- as.factor(flower_evo$flower)


 flower_evo <- unite(flower_evo , col = "stalk_flower" , stalk , flower , sep = "_")


 flower_evo


 #local depot


 write$rds(stalk_evo, file = "data/stalk_evo.rds", compress = "gz")

 write$rds(flower_evo, file = "data/flower_evo.rds", compress = "gz")






