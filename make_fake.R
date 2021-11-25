# create fake data

set.seed(420)
sim <- uoft_covid %>% 
  select(-3) %>% 
  uncount(cases) %>% 
  mutate(
    gender = sample(c("m", "f", "non-binary", "not listed"), 
                    prob = c(50, 50, 1, 1),
                    size = nrow(.), 
                    replace = T),
    age = sample(c("17 and younger", "18", "19", "20", "21", "22", "23", "24",  "25 and older"), 
                 prob = c(1, 5, 5, 5, 5, 4, 3, 2, 1),
                 size = nrow(.), 
                 replace = T),
    campus = sample(c("UTM", "UTSC", "UTSG"), 
                    prob = c(1, 1, 3),
                    size = nrow(.), 
                    replace = T)
  )
  

write_csv(sim, "fake_raw.csv")
