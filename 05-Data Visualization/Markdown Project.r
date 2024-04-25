---
title: "Homework Visualization"
author: "Top Rangsiman"
date: "2023-12-25"
output: pdf_document
---

## Fuel economy data from 1999 to 2008 for 38 popular models of cars
> This dataset contains a subset of the fuel economy data that the EPA makes available.It contains only models which had a new release every year between 1999 and 2008 - this was used as a proxy for the popularity of the car.

```{r, message=FALSE, echo=FALSE, fig_width = 8}
library(tidyverse)

head(mpg)
```

|column | Description|
|---    | ---|
|manufacturer | manufacturer name|
|model | model name|
|displ | engine displacement, in litres|
|year | year of manufacture|
|cyl | number of cylinders|
|trans | type of transmission|
|drv | the type of drive train|
|cty | city miles per gallon|
|hwy | highway miles per gallon|
|fl | fuel type|
|class | "type" of car|

- Which Audi models offer both automatic and manual transmission options, and what are their respective drivetrains?

```{r, message=FALSE, echo=FALSE, fig.width=10, fig.align = "center", fig.height=6}
library(tidyverse)

m1 <- mpg %>%
  select(manufacturer, model, drv, trans) %>%
  filter(manufacturer == "audi")


ggplot(m1,
       aes(x = drv, y = trans)) +
  
  geom_label(aes(label=model), alpha=0.5, size=3) +
  theme_minimal() +
  labs(
    x= "the type of drive train",
    y= "type of transmission"
  )

```

> Picture 1: 2 types of drivetrains and 5 types of transmission options.

- What car brand gets the most miles per gallon on average ?

```{r, message=FALSE, echo=FALSE, fig.width=10, fig.align = "center", fig.height=6}
library(tidyverse)

mpg %>%
  group_by(manufacturer) %>%
  summarize(avg_mpg = mean(cty)) %>%
  arrange(desc(avg_mpg)) %>%
  head(7) %>%
  ggplot(data =. , mapping = aes(x=manufacturer, avg_mpg)) +
  geom_col() +
  theme_minimal() 

```

> Picture 2 : Honda have the most miles per gallon on average.

- In what way does the size of a car's engine impact its fuel efficiency

```{r, message=FALSE, echo=FALSE, fig.width=10, fig.align = "center", fig.height=6}
library(tidyverse)

ggplot(mpg, 
       mapping = aes(x=displ, y=cty)) +
  
  geom_point(alpha=0.5, size=1) +
  geom_smooth() +
  theme_minimal() +
  labs(
    x = "engine displacement",
    y = "city miles per gallon"
  )

```

> Picture 3: When looking at cars, you can see that engine displacement doesn't necessarily have a direct relationship with miles per gallon While larger engines tend to have lower fuel efficiency.

- Which type of car is most fuel-efficient?

```{r,message=FALSE, echo=FALSE, fig.width=10, fig.align = "center", fig.height=6}
library(tidyverse)

ggplot(mpg,
       aes(cty, hwy, color = class)) +
  
  geom_count() +
  theme_minimal()

```

> Picture 4 : Subcompact cars are the most fuel-efficient choice. These are one of two types shown in the pictures, along with compact options.

- revolutionizing the way we think about fuel.

```{r, message=FALSE, echo=FALSE, fig.width=10, fig.align = "center", fig.height=6}
library(tidyverse)

ggplot(mpg,
       aes(year, hwy)) +
  
  geom_line() +
  theme_minimal()

```

> Pictures 5: Throughout history, humans have continuously developed the automobile industry.
