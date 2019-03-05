



# setting



SciViews::R

# stalk evolution


(stalk_evo <- as_dataframe(tibble(
  stalk = rep(c(1,2,3,4,5),18),
  height = c(26.8,1.5,1.3,0.3,2.3,28.5,1.5,1.3,0.3,2.4,31.2,1.5,1.4,0.4,2.4,33.0,1.5,1.4,0.4,2.3,29.4,1.5,1.4,0.4,2.3,29.7,1.6,1.5,0.4,2.4,31.2,1.8,1.6,0.7,2.6,32.9,1.8,1.7,0.6,2.6,33.1,1.8,1.6,0.8,2.7,35.4,1.9,1.7,0.7,2.7,39.2,1.9,1.8,0.9,2.9,38.5,2.1,2,1.1,3.4,37.5,2.2,2.4,1.4,3.8,39.6,2.6,3.5,2.4,4.6,41.2,3.0,3.9,3.4,5.6,44.5,3.4,5.5,4.3,6.8,50.1,5.5,7.7,6.6,8.9,50.2,7.3,10.2,8.9,11.3),
  day = rep(c(1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18), each = 5 )
)))

stalk_evo$stalk <- as.factor(stalk_evo$stalk)
stalk_evo$day <- as.factor(stalk_evo$day)

visdat::vis_dat(stalk_evo)

stalk_type <- tibble(
  type = c("floral","leef","leef","leef","leef"),
  stalk=c(1,2,3,4,5)
)




ggpubr::ggtexttable(head(stalk_evo))


# flower birth day


tibble(
    stalk = c(1,1,2,2,3,3,4,4,5,5),
    number    = c(1,2,1,2,1,2,1,2,1,2),
    day_birth      = c(4,12,0,0,0,0,0,0,0,0),
    day_death = c(10,18,0,0,0,0,0,0,0,0)
  ) -> flower_day

flower_day <- unite(flower_day , col = "stalk_number" , stalk , number , sep = "_")


  pander::pander(flow,
               caption = "day of the flower birth")

# flower evolution after the birth to the death

  tibble(
    stalk = c(1,1,1,1,1,1,1,1,1,1,1,1,1,1),
    flower    = c(1,1,1,1,1,1,1,2,2,2,2,2,2,2),
    age_day     = c(1,2,3,4,5,6,7,1,2,3,4,5,6,7),
    petal_lg = c(10.3,12,12.2,12.4,12.9,12.6,12.3,12.1,12.2,13,13.1,12.2,12.6,10.5),
    male_lg = c(6.6,6.5,6.3,6.2,6.9,7,7,6.6,7.0,7.3,7.0,7.0,6.9,7.0),
    fml_lg= c (10.1,10.1,10.1,10.1,10,10.1,10,9.9,10,10,9.9,9.9,10,10)
  ) -> flower_evo

  flower_evo$stalk <- as.factor(flower_evo$stalk)
  flower_evo$flower <- as.factor(flower_evo$flower)


 #flower_evo <- unite(flower_evo , col = "stalk_flower" , stalk , flower , sep = "_")


 flower_evo


 #fruit


 fruit_evo <- tibble(
   stalk = c(1,1),
   flower = c(1,1),
   age = c(7,12),
   perimeter = c(3.5,4.8))

 #local depot


 write$rds(stalk_evo, file = "data/stalk_evo.rds", compress = "gz")

 write$rds(flower_evo, file = "data/flower_evo.rds", compress = "gz")


 write$rds(flower_day, file = "data/flower_day.rds", compress = "gz")

 write$rds(fruit_evo, file = "data/fruit_evo.rds", compress = "gz")

