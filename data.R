



# setting



SciViews::R

# stalk evolution


(stalk_evo <- as_dataframe(tibble(
  stalk = rep(c(1,2,3,4,5,6),44),
  height = c(26.8,1.5,1.3,0.3,2.3,0,28.5,1.5,1.3,0.3,2.4,0,31.2,1.5,1.4,0.4,2.4,0,33.0,1.5,1.4,0.4,2.3,0,29.4,1.5,1.4,0.4,2.3,0,29.7,1.6,1.5,0.4,2.4,0,31.2,1.8,1.6,0.7,2.6,0,32.9,1.8,1.7,0.6,2.6,0,33.1,1.8,1.6,0.8,2.7,0,35.4,1.9,1.7,0.7,2.7,0,39.2,1.9,1.8,0.9,2.9,0,38.5,2.1,2,1.1,3.4,0,37.5,2.2,2.4,1.4,3.8,0,39.6,2.6,3.5,2.4,4.6,0,41.2,3.0,3.9,3.4,5.6,0,44.5,3.4,5.5,4.3,6.8,0,50.1,5.5,7.7,6.6,8.9,0,50.2,7.3,10.2,8.9,11.3,0,51.4,9.8,12.7,12,14.5,0,50.5,11.9,14.6,12.4,16,2.3,51,13.5,17.1,16,18,3.6,50.8,15.9,18.7,17,19.7,3.9,49.5,18.1,22,21.3,21,5.3,51,19.7,20.6,23.1,24.4,6.3,50.5,20.3,24.2,23.9,24.2,7.2,50.6,22.6,27.3,27.2,25.9,8.4,NA,NA,NA,NA,NA,NA,54.1,24,31.1,29.6,28.3,10.8,54.3,24.1,33.1,31.3,29.2,11.6,53.5,26.2,33.7,33,30.4,12.3,53.4,26.1,34.9,35,30.8,13.6,55,26.7,36.8,36.2,33,15,55,26.5,36.2,37.3,33.7,16,54.9,26.8,39,39,34.5,17.8,NA,NA,NA,NA,NA,NA,55,27.5,42.2,41.6,36.1,24.2,54.9,27,42.3,43.4,38.5,25.2,55,28,43.8,43.6,38.9,24.8,54.7,29.1,44.6,46.1,40.2,28.6,NA,NA,NA,NA,NA,NA,NA,NA,NA,NA,NA,NA,54.5,28,45.5,45.6,40.9,29.4,NA,NA,NA,NA,NA,NA,54.2,29.1,46.5,46.5,40.3,34.3),
  day = rep(c(1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44), each = 6 )
)))

stalk_evo$stalk <- as.factor(stalk_evo$stalk)
stalk_evo$day <- as.factor(stalk_evo$day)

visdat::vis_dat(stalk_evo)

stalk_type <- tibble(
  type = c("floral","leef","leef","leef","leef","leef"),
  stalk=c(1,2,3,4,5,6)
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
   stalk = c(1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1),
   flower = c(1,1,1,2,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2),
   age = c(7,12,17,7,9,19,9,22,12,24,14,26,16,29,19,32,22,35,25,38,28),
   perimeter = c(3.5,4.8,5.6,3.5,3.7,6.2,3.5,7.8,2.5,9.5,0.9,10.4,0.9,11.8,0.8,12.2,0.8,12.2,0.8,11.9,0.8))

 #local depot


 write$rds(stalk_evo, file = "data/stalk_evo.rds", compress = "gz")

 write$rds(flower_evo, file = "data/flower_evo.rds", compress = "gz")


 write$rds(flower_day, file = "data/flower_day.rds", compress = "gz")

 write$rds(fruit_evo, file = "data/fruit_evo.rds", compress = "gz")

