## Ask 5 questions using Flight table

library(nycflights13)
library(tidyverse)

data("flights")
data("airlines")
data("airports")
data("weather")
data("planes")

## 1. What's flight number delay the longest in July?
flights %>%
  select(month, dep_delay, flight, origin, dest ) %>%
  filter(month == 7) %>%
  arrange(desc(dep_delay))
# answers : flight number 3075 

## 2. What's flight number using American Airlines Inc abbreviation?
flights %>% 
  left_join(airlines, by="carrier") %>%
  select(flight, name) %>%
  filter(name == "American Airlines Inc.") 
#answer : 1141 301 707 1895 1837 413 303 711 305 1815
  
## 3. How many planes from AIRBUS INDUSTRIE flew in may 2013.
flights %>%
  left_join(planes, by="tailnum") %>%
  select(month, manufacturer, flight, tailnum) %>%
  filter(manufacturer == "AIRBUS INDUSTRIE" & month == 5)
# answer : 3,593

## 4. group class of departure's delay (-5 - 5 min customers satisfied) focus on December 2013 
flights %>%
  select(month, dep_delay, flight) %>%
  filter(month == 12) %>%
  mutate(delay_class = if_else(between(dep_delay, -5, 5), "satisfied", "negative emotion"))
# answer : created delay_class 
  
## 5. proportion of group class in number 4
flights %>% 
  mutate(delay_class = if_else(between(dep_delay, -5, 5), "satisfied", "negative emotion")) %>%
  group_by(delay_class) %>%
  summarize(avg_dis = mean(distance),
            sum_dis = sum(distance),
            min_dis = min(distance),
            max_dis = max(distance),
  )
# answer : 
delay_class   avg_dis sum_dis min_dis
  <chr>           <dbl>   <dbl>   <dbl>
1 negative emo…    975.  1.65e8      80
2 satisfied       1127.  1.80e8      80
3 NA               695.  5.74e6      17
#
