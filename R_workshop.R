# knitr::opts_chunk$set(echo = TRUE, fig.align = "center")
knitr::opts_chunk$set(echo = TRUE, fig.align = "center", out.width="70%")


# this is only for R Markdown
library(fontawesome)



# this section will automatically install the missing packages on your own computer

# list the packages that we need
packages_need <- c("data.table", # read in csv file and doing data analysis
                   "raster", # analyze raster data
                   "sf", # analyze vector data
                   "ggplot2", # data visualization
                   "ggspatial", # plot raster map
                   "RColorBrewer", # give me some nice color palettes
                   "scales",
                   "cowplot",
                   "shiny", # interactive data visualization
                   "shinyjs", # interactive data visualization
                   "leaflet" # interactive data visualization

)


# What the code below does is to check if your R has these packages installed (the require() function), if not, install them (the install.packages() function), and then load the packages using the library() function.

for (package in packages_need){
  if (!require(package, character.only = TRUE)){
    install.packages(package)
  }
  library(package, character.only = TRUE)
}



## 
## # Good
## fit-models.R
## utility-functions.R
## 
## # Bad
## foo.r
## stuff.r
## 

## 
## 0-download.R
## 1-parse.R
## 2-explore.R
## 

## 
## # Good (shortcut for assignment operator: Option + Minus on MAC and Alt + Minus on Windows & Linux)
## x <- 5
## 
## # Bad
## x = 5
## 
## # Good
## sample(x = 1:10, size = 5)
## 

## 
## # Good
## day_one
## day_1
## 
## # Bad
## first_day_of_the_month
## dayone
## djm1
## 

## 
## # Bad
## T <- FALSE
## c <- 10
## mean <- function(x) sum(x)
## 


# First, let's set up our working directory

# An addition (short cut for running selected code: Cmd + Return on Mac and Ctrl + Enter on Windows & Linux)
5 + 5

# A subtraction
5 - 5 

# A multiplication
3 * 5

# A division
9 / 2

# integer division
9 %/% 2

# x mod y (“x modulo y”)
9 %% 2

# An Exponentiation
3^2

# A root extraction
4^(0.5)

# make if fancy
3 * (4/5 + 2^2)

# assign the value to a variable
x <- 5



# Declare variables of different types
my_integer <- 1
my_decimal <- 1.5
my_character <- "REU student"
my_logical <- TRUE

# Check class of my_integer and my_decimal
class(my_integer)

class(my_decimal)

class(my_character)

class(my_logical)

# OK, how about some real integer types
# The advantage in using real integer types is that it can save you some storage memory in your computer
# But in most cases, you don't need to care!
my_real_integer <- 1L
class(my_real_integer)



# Shortcut for inserting pipe operator: Cmd + Shift + M on MAC and Ctrl + Shift + M on Windows & Linux)

# vector
# "c" means concatenate
v_num <- c(1, 2, 3, 4, 5)
v_char <- c("a", "b", "c")
v_logical <- c(TRUE, FALSE, FALSE)

# test different data types in a vector
# 1 and 2 will be automatically converted to character data type
v_test <- c(1, 2, "a")

# check the length of the vector
length(v_num)

# select some values from the vector
v_num[1]

v_num[1:3]

v_num[c(1, 5)]

v_num[-1]

v_num > 2

v_num[v_num > 2]

# give some names to the vector
names(v_num) <- c("Monday", "Tuesday", "Wednesday", "Thursday", "Friday")

# select based on name
v_num["Monday"]

# sum up two vectors
v_a <- c(1, 2, 3, 4, 5)

v_b <- c(2, 4, 6, 8, 10)

v_total <- v_a + v_b

# concatenate two vectors
v_join <- c(v_a, v_b)

# do some basic statistics on vector

# mean value
mean(v_a)

# standard deviation
sd(v_a)


# quickly create a vector

# create a vector sequence
1:10

# create a vector sequence with 2 as the step
seq(1, 10, by = 2)

# create a vector with 5 replicates
rep(2, times = 5)

# create a vector with lower-case or captial letters
letters[1:10]

LETTERS[1:10]

# create a long vector
v_long <- 1:1000

# use head and tail to show the first or last several elements in the vector
head(v_long)

tail(v_long)




# Shortcut for inserting pipe operator: Cmd + Shift + M on MAC and Ctrl + Shift + M on Windows & Linux)

# unordered (nominal categorical variable)
v_fruit <- c("apple", "banana", "orange", "peach")

f_fruit <- factor(v_fruit)

f_fruit[1] > f_fruit[2]

# ordered (ordinal categorical variable)
v_temp <- c("High", "Low", "High","Low", "Medium")

f_temp <- factor(v_temp)

f_temp <- factor(v_temp, levels = c("Low", "Medium", "High"), ordered = TRUE)

f_temp[1] > f_temp[2]



v_a <- 1:6

# create a 2*3 matrix
m_a <- matrix(v_a, nrow = 2, ncol = 3)

m_a

matrix(v_a, nrow = 2)

# force it to expand along the row
matrix(v_a, nrow = 2, byrow = TRUE)

# check the total dimension
dim(m_a)

# check how many rows
nrow(m_a)

# check how many columns
ncol(m_a)

# select specific row
m_a[1, ]

# select specific columns
m_a[, 1]

# let's display m_a again
m_a

# calculate the totals for each row of a matrix
rowSums(m_a)

# calculate the totals for each column of a matrix
colSums(m_a)

# calculate the mean for each row of a matrix
rowMeans(m_a)

# calculate the sd for each row or each column
# unfortunately, we don't have a built-in rowSds...

# we use the apply function
# Margin = 1 means along the row (row-wise)
# Margin = 1 2 means along the column (column_wise)

apply(m_a, MARGIN = 1, FUN = sd)
apply(m_a, MARGIN = 2, FUN = sd)

# check if the apply is right
sd(m_a[1, ])
sd(m_a[, 1])





dim(mpg) # dimension

# as you can see, each column in data.frame has the same data type, while different columns can have different data types
str(mpg) # data structure

summary(mpg) # data statistics

head(mpg) # first several rows

tail(mpg) # last several rows



# we convert the data.frame to data.table (a special type of data.frame that we will use for all the data manipulation)
dt_mpg <- as.data.table(mpg)

# select elements of data.frame by position
dt_mpg[1, ]

dt_mpg[, 1]

dt_mpg[1:2, ]

dt_mpg[1:2, c(2,3)]

# extract 1 column as a vector
head(dt_mpg[[1]])


# select elements of data.frame by name
# the .() operator keeps the output as data.table
dt_mpg[1:5, .(year)]

dt_mpg[1:5, .(model, year)]

dt_mpg[1:5, .(model, year)]

# extract 1 column as a vector
dt_mpg[1:5, year]

# or you can use the dollar sign
head(dt_mpg$year)

# select elements of data.frame by logical vector
head(dt_mpg$year > 2005)

head(dt_mpg[dt_mpg$year > 2005, ])

# since we are using data.table, why not use the tidy way?
head(dt_mpg[year > 2005, ])

# calculate the average mileage of highway and city for each single row
head(dt_mpg[, mileage_mean := (cty + hwy)/2])

# or a fancy way
head(dt_mpg[, mileage_mean := rowMeans(.SD), .SDcols = c("cty", "hwy")])

# calculate average highway mileage for all car models
dt_mpg[, mean(hwy)]

# But if we want to keep the result as data.table, we can use the .() operator
dt_mpg[, .(hwy_mean = mean(hwy))]

# calculate average highway mileage for different classes
dt_mpg[, .(hwy_mean = mean(hwy)), by = class]

# order the average highway mileage of different classes
dt_mpg[, .(hwy_mean = mean(hwy)), by = class][order(hwy_mean)]

# order the average highway mileage of different classes (descending)
dt_mpg[, .(hwy_mean = mean(hwy)), by = class][order(-hwy_mean)]

# drop one column
dt_mpg[, year := NULL]

# drop several columns
dt_mpg[, c("drv", "cyl") := NULL]

dt_mpg



ggplot()



ggplot(data = mpg)



ggplot(data = mpg, aes(x=displ, y=cty))



ggplot(data = mpg, aes(x=displ, y=cty)) +
  geom_point()



ggplot(data = mpg, aes(x=displ, y=cty)) +
  geom_point(shape=21, size=3, fill="red", color="black")



ggplot(data = mpg, aes(x=displ, y=cty)) +
  geom_point(shape=21, size=3, fill="red", color="black", stroke=0.1, alpha = 0.7)



ggplot(data = mpg, aes(x=displ, y=cty)) +
  geom_point(shape=21, size=3, fill="red", color="black", stroke=0.1, alpha = 0.7) +
  theme_bw()

ggplot(data = mpg, aes(x=displ, y=cty)) +
  geom_point(shape=21, size=3, fill="red", color="black", stroke=0.1, alpha = 0.7) +
  theme_classic()

ggplot(data = mpg, aes(x=displ, y=cty)) +
  geom_point(shape=21, size=3, fill="red", color="black", stroke=0.1, alpha = 0.7) +
  theme_minimal()



ggplot(data = mpg, aes(x=displ, y=cty)) +
  geom_point(shape=21, size=3, fill="red", color="black", stroke=0.1, alpha = 0.7) +
  theme_bw() +
  theme(panel.grid.major = element_line(size = 0.5, linetype = "dashed"),
        panel.grid.minor = element_blank()
        )



ggplot(data = mpg, aes(x=displ, y=cty)) +
  geom_point(shape=21, size=3, fill="red", color="black", stroke=0.1, alpha = 0.7) +
  labs(x="engine displacement in liters",
       y = "city mileage") +
  theme_bw() +
  theme(panel.grid.major = element_line(size = 0.5, linetype = "dashed"),
        panel.grid.minor = element_blank()
        )



ggplot(data = mpg, aes(x=displ, y=cty)) +
  geom_point(shape=21, size=3, fill="red", color="black", stroke=0.1, alpha = 0.7) +
  labs(x="engine displacement in liters",
       y = "city mileage") +
  theme_bw() +
  theme(panel.grid.major = element_line(size = 0.5, linetype = "dashed"),
        panel.grid.minor = element_blank(),
        axis.title = element_text(size = 16),
        axis.text = element_text(size = 14)
        )



ggplot(data = mpg, aes(x=displ, y=cty)) +
  geom_point(shape=21, size=3, fill="red", color="black", stroke=0.1, alpha = 0.7) +
  labs(x="engine displacement in liters",
       y = "city mileage") +
  theme_bw() +
  theme(panel.grid.major = element_line(size = 0.5, linetype = "dashed"),
        panel.grid.minor = element_blank(),
        axis.title = element_text(size = 16),
        axis.text = element_text(size = 14),
        axis.title.x = element_text(margin = margin(t=10)),
        axis.title.y = element_text(margin = margin(r=10))
        )




ggplot(data = mpg, aes(x=displ, y=cty, fill=class)) +
  geom_point(shape=21, size=3, color="black", stroke=0.1, alpha = 0.7) +
  labs(x="engine displacement in liters",
       y = "city mileage") +
  theme_bw() +
  theme(panel.grid.major = element_line(size = 0.5, linetype = "dashed"),
        panel.grid.minor = element_blank(),
        axis.title = element_text(size = 16),
        axis.text = element_text(size = 14),
        axis.title.x = element_text(margin = margin(t=10)),
        axis.title.y = element_text(margin = margin(r=10))
        )




# use the "Accent" palette
ggplot(data = mpg, aes(x=displ, y=cty, fill=class)) +
  geom_point(shape=21, size=3, color="black", stroke=0.1, alpha = 0.7) +
  labs(x="engine displacement in liters",
       y = "city mileage") +
  scale_fill_brewer(palette = "Accent") +
  theme_bw() +
  theme(panel.grid.major = element_line(size = 0.5, linetype = "dashed"),
        panel.grid.minor = element_blank(),
        axis.title = element_text(size = 16),
        axis.text = element_text(size = 14),
        axis.title.x = element_text(margin = margin(t=10)),
        axis.title.y = element_text(margin = margin(r=10))
        )

# use the "Dark2" palette
ggplot(data = mpg, aes(x=displ, y=cty, fill=class)) +
  geom_point(shape=21, size=3, color="black", stroke=0.1, alpha = 0.7) +
  labs(x="engine displacement in liters",
       y = "city mileage") +
  scale_fill_brewer(palette = "Dark2") +
  theme_bw() +
  theme(panel.grid.major = element_line(size = 0.5, linetype = "dashed"),
        panel.grid.minor = element_blank(),
        axis.title = element_text(size = 16),
        axis.text = element_text(size = 14),
        axis.title.x = element_text(margin = margin(t=10)),
        axis.title.y = element_text(margin = margin(r=10))
        )




color_manual <- c("#001219", "#0a9396", "#94d2bd", "#e9d8a6", "#ee9b00", "#ca6702", "#9b2226")

# use show_col from the scales package to see your color
show_col(color_manual)


# use the "Accent" palette
ggplot(data = mpg, aes(x=displ, y=cty, fill=class)) +
  geom_point(shape=21, size=3, color="black", stroke=0.1, alpha = 0.7) +
  labs(x="engine displacement in liters",
       y = "city mileage") +
  scale_fill_manual(values=color_manual) +
  theme_bw() +
  theme(panel.grid.major = element_line(size = 0.5, linetype = "dashed"),
        panel.grid.minor = element_blank(),
        axis.title = element_text(size = 16),
        axis.text = element_text(size = 14),
        axis.title.x = element_text(margin = margin(t=10)),
        axis.title.y = element_text(margin = margin(r=10))
        )



# use the "Accent" palette
ggplot(data = mpg, aes(x=displ, y=cty, fill=class)) +
  geom_point(shape=21, size=3, color="black", stroke=0.1, alpha = 0.7) +
  labs(x="engine displacement in liters",
       y = "city mileage") +
  scale_fill_brewer(palette = "Accent") +
  theme_bw() +
  theme(panel.grid.major = element_line(size = 0.5, linetype = "dashed"),
        panel.grid.minor = element_blank(),
        axis.title = element_text(size = 16),
        axis.text = element_text(size = 14),
        axis.title.x = element_text(margin = margin(t=10)),
        axis.title.y = element_text(margin = margin(r=10)),
        legend.position = "bottom",
        legend.background = element_rect(color = "gray", size = 0.5),
        legend.title = element_text(size=12),
        legend.text = element_text(size=10)
        )



# use the "Accent" palette
ggplot(data = mpg, aes(x=displ, y=cty, fill=class)) +
  geom_point(shape=21, size=3, color="black", stroke=0.1, alpha = 0.7) +
  labs(x="engine displacement in liters",
       y = "city mileage") +
  scale_fill_brewer(palette = "Accent") +
  guides(fill = guide_legend(nrow = 1)) +
  theme_bw() +
  theme(panel.grid.major = element_line(size = 0.5, linetype = "dashed"),
        panel.grid.minor = element_blank(),
        axis.title = element_text(size = 16),
        axis.text = element_text(size = 14),
        axis.title.x = element_text(margin = margin(t=10)),
        axis.title.y = element_text(margin = margin(r=10)),
        legend.position = "bottom",
        legend.background = element_rect(color = "gray", size = 0.5),
        legend.title = element_text(size=12),
        legend.text = element_text(size=10)
        )



# use the "Accent" palette
ggplot(data = mpg, aes(x=displ, y=cty)) +
  geom_point(shape=21, size=3, fill = "red", color="black", stroke=0.1, alpha = 0.7) +
  labs(x="engine displacement in liters",
       y = "city mileage") +
  facet_wrap(vars(class)) +
  theme_bw() +
  theme(panel.grid.major = element_line(size = 0.5, linetype = "dashed"),
        panel.grid.minor = element_blank(),
        axis.title = element_text(size = 12),
        axis.text = element_text(size = 10),
        axis.title.x = element_text(margin = margin(t=10)),
        axis.title.y = element_text(margin = margin(r=10))
        )



# use the "Accent" palette
ggplot(data = mpg, aes(x=displ, y=cty)) +
  geom_point(shape=21, size=3, fill = "red", color="black", stroke=0.1, alpha = 0.7) +
  labs(x="engine displacement in liters",
       y = "city mileage") +
  facet_wrap(vars(class)) +
  theme_bw() +
  theme(panel.grid.major = element_line(size = 0.5, linetype = "dashed"),
        panel.grid.minor = element_blank(),
        axis.title = element_text(size = 12),
        axis.text = element_text(size = 10),
        axis.title.x = element_text(margin = margin(t=10)),
        axis.title.y = element_text(margin = margin(r=10)),
        strip.text = element_text(size = 12)
        )



# use the "Accent" palette
ggplot(data = mpg, aes(x=displ, y=cty)) +
  geom_point(shape=21, size=2, fill = "red", color="black", stroke=0.1, alpha = 0.7) +
  labs(x="engine displacement in liters",
       y = "city mileage") +
  geom_smooth(method = lm, se = TRUE, color="#999999", size = 0.5) +
  facet_wrap(vars(class)) +
  theme_bw() +
  theme(panel.grid.major = element_line(size = 0.5, linetype = "dashed"),
        panel.grid.minor = element_blank(),
        axis.title = element_text(size = 12),
        axis.text = element_text(size = 10),
        axis.title.x = element_text(margin = margin(t=10)),
        axis.title.y = element_text(margin = margin(r=10)),
        strip.text = element_text(size = 12)
        )



ggplot(data = mpg, aes(x=displ, y=cty, fill=hwy)) +
  geom_point(shape=21, size=3, color="black", stroke=0.1, alpha = 0.7) +
  labs(x="engine displacement in liters",
       y = "city mileage") +
  scale_fill_viridis_c(option = "magma") +
  theme_bw() +
  theme(panel.grid.major = element_line(size = 0.5, linetype = "dashed"),
        panel.grid.minor = element_blank(),
        axis.title = element_text(size = 16),
        axis.text = element_text(size = 14),
        axis.title.x = element_text(margin = margin(t=10)),
        axis.title.y = element_text(margin = margin(r=10))
        )


# change the legend aesthetics
range(mpg$hwy)

ggplot(data = mpg, aes(x=displ, y=cty, fill=hwy)) +
  geom_point(shape=21, size=3, color="black", stroke=0.1, alpha = 0.7) +
  labs(x="engine displacement in liters",
       y = "city mileage") +
  scale_fill_continuous(type = "viridis",
                        option = "magma",
                        limits = c(10, 45), # limits are needed to make the labels work properly
                        breaks = seq(10, 45, by = 5),
                        labels = seq(10, 45, by = 5)) +
  theme_bw() +
  theme(panel.grid.major = element_line(size = 0.5, linetype = "dashed"),
        panel.grid.minor = element_blank(),
        axis.title = element_text(size = 16),
        axis.text = element_text(size = 14),
        axis.title.x = element_text(margin = margin(t=10)),
        axis.title.y = element_text(margin = margin(r=10)),
        legend.title = element_text(size=14, vjust = 5),
        legend.text = element_text(size=12),
        legend.key.height = unit(15, units = "mm"),
        legend.key.width = unit(3, units = "mm")
        )



# Bar plot: how many cars are in each class
ggplot(data = mpg) +
  geom_bar(aes(x=class)) +
  theme_bw() +
  theme(panel.grid.major = element_line(size = 0.5, linetype = "dashed"),
        panel.grid.minor = element_blank(),
        axis.title = element_text(size = 16),
        axis.text = element_text(size = 14),
        axis.title.x = element_text(margin = margin(t=10)),
        axis.title.y = element_text(margin = margin(r=10)),
        )

# Bar plot: let's flip the x-y axis
ggplot(data = mpg) +
  geom_bar(aes(x=class)) +
  coord_flip() +
  theme_bw() +
  theme(panel.grid.major = element_line(size = 0.5, linetype = "dashed"),
        panel.grid.minor = element_blank(),
        axis.title = element_text(size = 16),
        axis.text = element_text(size = 14),
        axis.title.x = element_text(margin = margin(t=10)),
        axis.title.y = element_text(margin = margin(r=10)),
        )



# Boxplot of hwy in each class

ggplot(data = mpg) +
  geom_boxplot(aes(x=class, y=hwy)) +
  theme_bw() +
  theme(panel.grid.major = element_line(size = 0.5, linetype = "dashed"),
        panel.grid.minor = element_blank(),
        axis.title = element_text(size = 16),
        axis.text = element_text(size = 14),
        axis.title.x = element_text(margin = margin(t=10)),
        axis.title.y = element_text(margin = margin(r=10)),
        )

# Boxplot of hwy in each class and in each cylinder
ggplot(data = mpg) +
  geom_boxplot(aes(x=class, y=hwy, fill=as.factor(cyl)), size = 0.2) +
  coord_flip() +
  scale_fill_brewer(name="Number of cylinders", palette = "Accent") +
  theme_bw() +
  theme(panel.grid.major = element_line(size = 0.5, linetype = "dashed"),
        panel.grid.minor = element_blank(),
        axis.title = element_text(size = 16),
        axis.text = element_text(size = 14),
        axis.title.x = element_text(margin = margin(t=10)),
        axis.title.y = element_text(margin = margin(r=10)),
        )




# Histograms of hwy

ggplot(data = mpg) +
  geom_histogram(aes(x=hwy)) +
  theme_bw() +
  theme(panel.grid.major = element_line(size = 0.5, linetype = "dashed"),
        panel.grid.minor = element_blank(),
        axis.title = element_text(size = 16),
        axis.text = element_text(size = 14),
        axis.title.x = element_text(margin = margin(t=10)),
        axis.title.y = element_text(margin = margin(r=10)),
        )

# Histograms of hwy in each class
ggplot(data = mpg) +
  geom_histogram(aes(x=hwy, fill=class), bins = 20, position = "dodge") +
  scale_fill_brewer(palette = "Accent") +
  theme_bw() +
  theme(panel.grid.major = element_line(size = 0.5, linetype = "dashed"),
        panel.grid.minor = element_blank(),
        axis.title = element_text(size = 16),
        axis.text = element_text(size = 14),
        axis.title.x = element_text(margin = margin(t=10)),
        axis.title.y = element_text(margin = margin(r=10)),
        )

# Density of hwy
ggplot(data = mpg) +
  geom_density(aes(x=hwy), size=0.2) +
  theme_bw() +
  theme(panel.grid.major = element_line(size = 0.5, linetype = "dashed"),
        panel.grid.minor = element_blank(),
        axis.title = element_text(size = 16),
        axis.text = element_text(size = 14),
        axis.title.x = element_text(margin = margin(t=10)),
        axis.title.y = element_text(margin = margin(r=10)),
        )

# Density of hwy in each class

# we can clearly see the differences between small and big cars
ggplot(data = mpg) +
  geom_density(aes(x=hwy, fill=class), size=0.2, alpha = 0.5) +
  scale_fill_brewer(palette = "Accent") +
  theme_bw() +
  theme(panel.grid.major = element_line(size = 0.5, linetype = "dashed"),
        panel.grid.minor = element_blank(),
        axis.title = element_text(size = 16),
        axis.text = element_text(size = 14),
        axis.title.x = element_text(margin = margin(t=10)),
        axis.title.y = element_text(margin = margin(r=10)),
        )

# OK, let's save our figure
ggsave(filename = "density_plot.pdf", width = 6, height = 4)




# learn more about time counting here: https://www.alexejgossmann.com/benchmarking_r/
# much faster using fread from data.table
system.time(dt_temp <- fread(file.path("data", "gcoos_2020_01_air_temperature.csv")))

# slower when reading csv files using the built-in read.csv function
system.time(df_test <- read.csv(file.path("data", "gcoos_2020_01_air_temperature.csv")))

# use rmarkdown to make the table pretty
rmarkdown::paged_table(dt_temp)

# check the data
str(dt_temp)

ggplot(dt_temp) +
  geom_histogram(aes(x=air_temperature))

quantile(dt_temp$air_temperature, prob = seq(0, 1, 0.01), na.rm = TRUE)

# filter out the bad ones
dt_temp <- dt_temp[air_temperature > -20 & air_temperature < 40]

ggplot(dt_temp) +
  geom_histogram(aes(x=air_temperature))



# average air temperature by platform
dt_mean <- dt_temp[, 
                   .(temp = mean(air_temperature), 
                       network = first(network), 
                       lat = first(latitude), 
                       lon = first(longitude)),
                   by = platform]
dt_mean

# let's plot our data

ggplot(data = dt_mean, aes(x=lon, y=lat, fill=temp)) +
  geom_point(shape=21, size=3, color="black", stroke=0.1, alpha = 0.7) +
  labs(x = "Longitude",
       y = "Latitude") +
  scale_fill_continuous(name = "Temperature (Celsius)",
                        type = "viridis",
                        option = "magma") +
  theme_bw() +
  theme(panel.grid.major = element_line(size = 0.5, linetype = "dashed"),
        panel.grid.minor = element_blank(),
        axis.title = element_text(size = 16),
        axis.text = element_text(size = 14),
        axis.title.x = element_text(margin = margin(t=10)),
        axis.title.y = element_text(margin = margin(r=10)),
        legend.title = element_text(size=12, vjust = 5),
        legend.text = element_text(size=10),
        legend.key.height = unit(15, units = "mm"),
        legend.key.width = unit(3, units = "mm")
        )




# convert data into a spatial vector
sf_temp <- st_as_sf(dt_mean, coords = c("lon", "lat"), crs = 4326)

# check the data
sf_temp

# read in land outline
# we use st_read from sf package to read in vector file (here it is a .shp format)
sf_land <- st_read(file.path("data", "ne_50m_land", "ne_50m_land.shp"))

ggplot() +
  geom_sf(data=sf_land, fill="#dedede", size=0.1, color="#aaaaaa") +
  geom_sf(data=sf_temp, aes(fill=temp), shape=21, size=1, color="black", stroke=0.1, alpha = 0.7) +
  labs(x = "Longitude",
       y = "Latitude") +
  scale_fill_continuous(name = "Temperature",
                        type = "viridis",
                        option = "magma") +
  coord_sf(xlim = c(-180, 180), ylim = c(-90, 90), expand = FALSE) +
  theme_bw() +
  theme(panel.grid.major = element_line(size = 0.5, linetype = "dashed"),
        panel.grid.minor = element_blank(),
        axis.title = element_text(size = 12),
        axis.text = element_text(size = 10),
        axis.title.x = element_text(margin = margin(t=10)),
        axis.title.y = element_text(margin = margin(r=10)),
        legend.title = element_text(size=10, vjust = 2),
        legend.text = element_text(size=8),
        legend.key.height = unit(10, units = "mm"),
        legend.key.width = unit(3, units = "mm")
        )

# change the projection to Mercator
sf_land_crop <- st_crop(sf_land, c(xmin = -180, ymin = -85, xmax = 180, ymax = 85))

sf_land_mercator <- st_transform(sf_land_crop, crs = 3857)

sf_temp_mercator <- st_transform(sf_temp, crs = 3857)

ggplot() +
  geom_sf(data=sf_land_mercator, fill="#dedede", size=0.1, color="#aaaaaa") +
  geom_sf(data=sf_temp_mercator, aes(fill=temp), shape=21, size=3, color="black", stroke=0.1, alpha = 0.7) +
  labs(x = "x",
       y = "y") +
  scale_fill_continuous(name = "Temperature",
                        type = "viridis",
                        option = "magma") +
  coord_sf(expand = FALSE, datum = 3857) +
  theme_bw() +
  theme(panel.grid.major = element_line(size = 0.5, linetype = "dashed"),
        panel.grid.minor = element_blank(),
        axis.title = element_text(size = 12),
        axis.text = element_text(size = 8),
        axis.title.x = element_text(margin = margin(t=10)),
        axis.title.y = element_text(margin = margin(r=10)),
        legend.title = element_text(size=10, vjust = 2),
        legend.text = element_text(size=8),
        legend.key.height = unit(10, units = "mm"),
        legend.key.width = unit(3, units = "mm")
        )


# crop the land to the Gulf of Mexico region
c_us_crop <- c(xmin = -105, ymin = 15, xmax = -75, ymax = 35)

sf_land_us <- st_crop(sf_land, c_us_crop)

ggplot() +
  geom_sf(data=sf_land_us, fill="#dedede", size=0.1, color="#aaaaaa") +
  geom_sf(data=sf_temp, aes(fill=temp), shape=21, size=3, color="black", stroke=0.1, alpha = 0.7) +
  labs(x = "Longitude",
       y = "Latitude") +
  scale_fill_continuous(name = "Temperature",
                        type = "viridis",
                        option = "magma") +
  coord_sf(expand = FALSE) +
  theme_bw() +
  theme(panel.grid.major = element_line(size = 0.5, linetype = "dashed"),
        panel.grid.minor = element_blank(),
        axis.title = element_text(size = 12),
        axis.text = element_text(size = 10),
        axis.title.x = element_text(margin = margin(t=10)),
        axis.title.y = element_text(margin = margin(r=10)),
        legend.title = element_text(size=10, vjust = 2),
        legend.text = element_text(size=8),
        legend.key.height = unit(10, units = "mm"),
        legend.key.width = unit(3, units = "mm")
        )



# Now we read in the global average sea surface temperature
# we use raster from raster package to read in raster file (here it is a .tif format)
rast_temp <- raster(file.path("data", "BO2_tempmean_ss_lonlat.tif"))

rast_temp

# plot the raster (will see how we can plot this using the ggspatial package coupled with ggplot2)
# the simple way
plot(rast_temp)


# check crs 
crs(rast_temp)

# check the resolution
res(rast_temp)

# check the dimension
dim(rast_temp)

# check the extent
extent(rast_temp)

# Calculate Raster Min and Max Values
minValue(rast_temp)

maxValue(rast_temp)


# get the pixel value
rast_temp[1, 1]

# calculate the mean temperature
cellStats(rast_temp, mean)

cellStats(rast_temp, sd)

sd(values(rast_temp), na.rm = TRUE)

# crop the raster
c_us_rast_crop <- c(xmin = -105, xmax = -75, ymin = 15, ymax = 35)

rast_temp_crop <- crop(rast_temp, y = c_us_rast_crop)

plot(rast_temp_crop)

# Here we use ggplot2 and ggspatial to plot the raster in the ggplot2 way
ggplot() +
  geom_sf(data=sf_land_us, fill="#dedede", size=0.1, color="#aaaaaa") +
  layer_spatial(data = rast_temp_crop, aes(fill = stat(band1))) +
  scale_fill_continuous(name = "Temperature",
                        type = "viridis",
                        option = "magma",
                        na.value = NA) +
  coord_sf(expand = FALSE) +
  theme_bw() +
  theme(panel.grid.major = element_line(size = 0.5, linetype = "dashed"),
        panel.grid.minor = element_blank(),
        axis.title = element_text(size = 12),
        axis.text = element_text(size = 10),
        axis.title.x = element_text(margin = margin(t=10)),
        axis.title.y = element_text(margin = margin(r=10)),
        legend.title = element_text(size=10, vjust = 2),
        legend.text = element_text(size=8),
        legend.key.height = unit(10, units = "mm"),
        legend.key.width = unit(3, units = "mm")
        )




# read in the shapefile of marine regions from International Hydrographic Organization (https://www.marineregions.org/gazetteer.php?p=details&id=4288)


sf_iho <- st_read(file.path("data", "World_Seas_IHO_v1", "World_Seas.shp"))


# extract the Gulf of Mexico
sf_gulf <- sf_iho[sf_iho$NAME == "Gulf of Mexico", ]

# check the extraction
ggplot() +
  geom_sf(data=sf_land_us, fill="#dedede", size=0.1, color="#aaaaaa") +
  geom_sf(data = sf_gulf, fill = "#9bf6ff")

# mask the seawater temperature with the shapefile of the Gulf of Mexico
rast_temp_crop

rast_temp_gulf <- mask(rast_temp_crop, sf_gulf)

rast_temp_gulf

plot(rast_temp_gulf)

# shrink the extent
rast_temp_gulf_trim <- trim(rast_temp_gulf)

plot(rast_temp_gulf_trim)

# plot the final product
ggplot() +
  geom_sf(data=sf_land_us, fill="#dedede", size=0.1, color="#aaaaaa") +
  layer_spatial(data = rast_temp_gulf_trim, aes(fill = stat(band1))) +
  scale_fill_continuous(name = "Temperature",
                        type = "viridis",
                        option = "magma",
                        na.value = NA) +
  coord_sf(expand = FALSE) +
  theme_bw() +
  theme(panel.grid.major = element_line(size = 0.5, linetype = "dashed"),
        panel.grid.minor = element_blank(),
        axis.title = element_text(size = 12),
        axis.text = element_text(size = 10),
        axis.title.x = element_text(margin = margin(t=10)),
        axis.title.y = element_text(margin = margin(r=10)),
        legend.title = element_text(size=10, vjust = 2),
        legend.text = element_text(size=8),
        legend.key.height = unit(10, units = "mm"),
        legend.key.width = unit(3, units = "mm")
        )

# extract the raster points to a data.frame so that you can use it later
df_temp_gulf <- rasterToPoints(rast_temp_gulf_trim)

dt_temp_gulf <- as.data.table(df_temp_gulf)

rmarkdown::paged_table(dt_temp_gulf)




# define the color palette
pal <- colorNumeric(
    palette = "magma",
    domain = values(rast_temp_gulf_trim),
    na.color = NA
)

leaflet() %>% 
    addTiles() %>%
    addRasterImage(x = rast_temp_gulf_trim, colors = pal, opacity = 1) %>% 
    addLegend("bottomright", 
              pal = pal, 
              values = values(rast_temp_gulf_trim),
              title = "Temperature",
    )

