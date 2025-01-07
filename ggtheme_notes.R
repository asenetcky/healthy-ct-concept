# some notes on ggplot themes
# jotting theme down as I go through published document


cars <- 
  mtcars |> 
  dplyr::as_tibble()

cars

# vanilla ggplot

library(ggplot2)

ggplot(cars, aes(x = wt, y = mpg)) +
  geom_point()


# things noticed with current theme

## no vertical grid line
## points often annotated with value
## theme: green, dark purple, dark blue-green, orange, light blue, grey
## current theme colors:
current_main_colors <- 
  list(
    lightblue = "#61B5CC",
    darkblue = "#214066",
    orange = "#E39B3B",
    otherblue = "#3866A0",
    purple = "#47205B",
    green = "#B8C349",
    sortagray = "#7B8B98"
  )

# sometimes they'll take one of those colors
# and just go through the whole gradient of that one

# custom ct theme
theme_ct_vertical <- function() {
  ggplot2::theme_classic() + 
  ggplot2::theme(
    axis.line.y = element_blank(),
    axis.ticks.y = element_blank(),
    axis.ticks.x = element_blank(),
    axis.title = element_text(face = "bold", family = "Poppins")
  )
}

# for sideways like horizontal bars
theme_ct_horizontal <- function() {
  ggplot2::theme_classic() + 
    ggplot2::theme(
      axis.line. = element_blank(),
      axis.ticks.y = element_blank(),
      axis.ticks.x = element_blank(),
      axis.title = element_text(face = "bold", family = "Poppins")
    )
}

# classic
ggplot(cars, aes(x = wt, y = mpg)) +
  geom_point() +
  theme_classic() 

# minimal
ggplot(cars, aes(x = wt, y = mpg)) +
  geom_point() +
  theme_minimal()
  

# ct theme
ggplot(cars, aes(x = wt, y = mpg)) +
  geom_point() +
  # theme_classic() +
  theme_ct_vertical() +
  labs(
    x = "WEIGHT",
    y = "MILES PER GALLON"
  )


# food insecurity demo

demo_food <- 
  dplyr::tibble(
    grp = c(
      rep("CT", 3), 
      rep("US", 3), 
      rep("CT Children", 3), 
      rep("US Children", 3)
    ),
    year = rep(c(2015:2017), 4), 
    prc = c(
      12.2, 
      11.6, 
      11.3, 
      13.4, 
      12.9, 
      12.5, 
      16.7, 
      15.6, 
      15.5, 
      17.9, 
      17.5, 
      17.0
    )
  ) |> 
  dplyr::mutate(
    year = factor(year),
    grp = factor(grp, levels = c("CT", "US", "CT Children", "US Children"))
  )



# recreate sha
ggplot(demo_food) +
  geom_col(
    aes(x = grp, y = prc, fill =  year), col = "white",
    position = "dodge"
  ) +
  geom_text(
    aes(x = grp, y = prc, fill = year, label = prc),
    position = position_dodge(width = 1.0), 
    vjust = -0.5
  ) + 
  scale_fill_manual(values = c( "#47205B","#E39B3B", "#B8C349")) +
  scale_y_continuous(
    limits = c(0, 20), breaks = c(4,8,12,16,20),
    expand = c(0, 0)
  ) +
  theme_ct_vertical() +
  theme(
    title = element_text(face = "bold", family = "Poppins"),
    axis.text.x = element_text(face = "bold", family = "Poppins"),
    legend.position = "inside",
    legend.position.inside = c(0.6, 0.96),
    legend.direction = "horizontal",
    legend.title = element_blank(),
    legend.background = element_blank()
  ) +
  labs(
    x = "",
    y = "FOOD INSECURITY RATE (%)",
    title = "Food Insecurity rate overall and among children, CT and US, 2015-2017",
  )

#same plot but current ct themes spread across the groups
ggplot(demo_food) +
  geom_col(
    aes(x = grp, y = prc, fill =  year), col = "white",
    position = "dodge"
  ) +
  geom_text(
    aes(x = grp, y = prc, fill = year, label = prc),
    position = position_dodge(width = 1.0), 
    vjust = -0.5
  ) + 
  scale_fill_manual(values = c( "#3371E7","#F27124", "#D8343E")) +
  scale_y_continuous(
    limits = c(0, 20), breaks = c(4,8,12,16,20),
    expand = c(0, 0)
  ) +
  theme_ct_vertical() +
  theme(
    title = element_text(face = "bold", family = "Poppins"),
    axis.text.x = element_text(face = "bold", family = "Poppins"),
    legend.position = "inside",
    legend.position.inside = c(0.6, 0.96),
    legend.direction = "horizontal",
    legend.title = element_blank(),
    legend.background = element_blank()
  ) +
  labs(
    x = "",
    y = "FOOD INSECURITY RATE (%)",
    title = "Food Insecurity rate overall and among children, CT and US, 2015-2017",
  )

#same plot but current ct themes just prm colors
ggplot(demo_food) +
  geom_col(
    aes(x = grp, y = prc, fill =  year), col = "white",
    position = "dodge"
  ) +
  geom_text(
    aes(x = grp, y = prc, fill = year, label = prc),
    position = position_dodge(width = 1.0), 
    vjust = -0.5
  ) + 
  scale_fill_manual(values = c("#00214D", "#003D9C", "#7094F5")) +
  scale_y_continuous(
    limits = c(0, 20), breaks = c(4,8,12,16,20),
    expand = c(0, 0)
  ) +
  coord_flip() +
  theme_ct_vertical() +
  theme(
    plot.title = element_text(face = "bold", family = "Poppins", colour = "#3371E7"),
    plot.subtitle = element_text(face = "bold", family = "Poppins", colour = "#F27124"),
    axis.text.x = element_text(face = "bold", family = "Poppins", colour = "#D8343E"),
    axis.title.y = element_text(face = "bold", family = "Poppins", colour = "#D8343E"),
    legend.position = "inside",
    legend.position.inside = c(0.6, 0.96),
    legend.direction = "horizontal",
    legend.title = element_blank(),
    legend.background = element_blank()
  ) +
  labs(
    x = "",
    y = "FOOD INSECURITY RATE (%)",
    title = "Food Insecurity rate overall and among children",
    subtitle = "CT and US, 2015-2017"
  )
