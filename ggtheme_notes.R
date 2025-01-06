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

#testing a random theme 
blue_theme <- function() {
  theme(
    # add border 1)
    panel.border = element_rect(colour = "blue", fill = NA, linetype = 2),
    # color background 2)
    panel.background = element_rect(fill = "aliceblue"),
    # modify grid 3)
    panel.grid.major.x = element_line(colour = "steelblue", linetype = 3, size = 0.5),
    panel.grid.minor.x = element_blank(),
    panel.grid.major.y =  element_line(colour = "steelblue", linetype = 3, size = 0.5),
    panel.grid.minor.y = element_blank(),
    # modify text, axis and colour 4) and 5)
    axis.text = element_text(colour = "steelblue", face = "italic", family = "Times New Roman"),
    axis.title = element_text(colour = "steelblue", family = "Times New Roman"),
    axis.ticks = element_line(colour = "steelblue"),
    # legend at the bottom 6)
    legend.position = "bottom"
  )
}

ggplot(cars, aes(x = wt, y = mpg)) +
  geom_point() +
  blue_theme()



# classic
ggplot(cars, aes(x = wt, y = mpg)) +
  geom_point() +
  theme_classic()

# minimal
ggplot(cars, aes(x = wt, y = mpg)) +
  geom_point() +
  theme_minimal()
  