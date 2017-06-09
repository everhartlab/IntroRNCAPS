# 
# Let's Practice!
# ===============
# 
# In this section we will cover:
# 
#  1. Working directories
#  2. Reading in data
#  3. Finding help
#  4. Basic data manipulation (renaming, subsetting, rotating)
#  
#  
# Part I: Working Directories
# ---------------------------
# 
# A working directory is the folder on your computer where you are currently
# working. You can find out your current working directory by typing `getwd()`

getwd()

# If you've downloaded and un-zipped this directory to your desktop, you might 
# see something like `/Users/<yourname>/Desktop/IntroR`. This is the default 
# place where R will begin reading and writing files. For example, you can use 
# the function `list.files()` to view the files in your current working 
# directory. These are the same files that we downloaded earlier. If you're 
# using Rstudio, you can compare the file list with the "Files" tab in the
# bottom right panel. 
# 
# In order to use `list.files()`, we should provide it with a file path. We can
# provide it a ".", which means "here" to most computer programs.

list.files(".")

# You can see that the first entry in here is "data". This is where we've placed
# the fungicide example data. 

list.files("data")

# Part II: Reading in Data
# ------------------------
# 
# 
# We can use the `read.table()` function to read these data in to R. It's
# important to remember that while in R, these data are simply a copy kept *in
# memory*, not on the disk, so we don't have to worry too much about
# accidentally deleting the data :).
# 
# So, how do we actually USE the `read.table()` function? A good first step to
# figuring out how you can use a function is to look at it's help page. The way
# you can do that is by typing either help("function_name") or ?function_name.

stop("

     Type ?read.table and answer these three questions:
     
     1. What does it do? (Description)
     2. What are the first three arguments and their defaults? (Usage/Arguments)
     3. What does it return? (Value)
     
     ")


# In order to read our data into R, we will need to provide three things:
# 
#  1. The path to the data set                 : data/FungicideExample.csv
#  2. If the first row are column names        : yes
#  3. The separator for each cell in the data  : comma
# 
# Now that we have these elements, we can read the data into a variable, which
# we can call "fungicide". Once we do this, we can check the dimensions to make
# sure that we have all of the data.

fungicide <- read.csv("data/FungicideExample.csv", header = TRUE, sep = ",")
nrow(fungicide)
ncol(fungicide)

# We can print the data to screen by simply typing its name

fungicide

# We can also use the `str()` function (short for "structure") to have a broad
# overview of what our data looks like. This is useful for data frames with many
# columns.

str(fungicide)


# Part III: Finding the right tool for the job
# --------------------------------------------
# 
# The data presented here are from
# http://www.apsnet.org/edcenter/advanced/topics/EcologyAndEpidemiologyInR/DiseaseProgress/Pages/StripeRust.aspx
# and consist of three cultivars of wheat treated with different fungicides 
# Jagger wheat is a succeptible variety whereas Cutter and 2137 are both 
# resistant varieties. It is assumed that the fungicide will only be able to 
# prevent new infections for two weeks after applicaton. With these data, we 
# want to answer the following questions:
# 
#  1. How does the size of the fungicide effect compare to the effect of
#     cultivar? 
#  2. Would it be the same as cultivar?
# 
# To answer these questions, we will use the summary statistic, Area Under the
# Disease Progress Curve (AUDPC). 
# 
# So, how do you calculate this? You could code the trapezoid rule yourself, OR
# you could find a package that was designed for this. 

stop("

    Do an internet search for AUDPC in R. What did you find?

    ")

# The first thing that likely popped up was the function `audpc()` in the
# *agricolae* package. If we want to use it, we can download the package to our
# computer with the function `install.packages()`. This will install a package
# from CRAN and place it into your R *Library*. Where is your R library? Type
# `.libPaths()` to find out!
#+ eval = FALSE

.libPaths()

install.packages("agricolae", repos = "https://cran.rstudio.com")

# Now that we have the *agricolae* package installed, we can load into our R
# workspace using the `library()` function, which looks in our library and loads
# the functions and data sets within that package. You can find out about what
# functions are avialable with help(package = "agricolae").
# 
# To accomplish our task, however, we need to find out how to use the `audpc()`
# function. First we should load the agricolae package

library("agricolae")

# Now we can look up help for `audpc()`
#+ eval = FALSE

?audpc

# This function will take in a data frame of severity and a vector of dates. 
# Since our vector of dates is in the first column, we will need to manipulate
# the data frame by subsetting. 

jdate <- fungicide$Julian.Date # this is also the first column
jdate
fungicide.audpc <- audpc(evaluation = fungicide[, -1], dates = jdate, type = "relative")

# Well this doesn't look good. What can this error message mean? Let's take a 
# look at the audpc help page one more time; this time, we'll look at the
# Examples section. Try to copy and paste the code one line at a time and see
# what happens. Check the evaluaton data relative to the dates and see how it's
# relevant.

stop("

     Stop and look at the examples from ?audpc.
     
     ")

# We can see from example 3, that the data must be arranged where dates are in
# separate columns. We need to transpose our data. To do this, we can use the
# `t()` function:

t(fungicide[, -1])

# Now we can plug this into the `audpc()` function:

fungicide.audpc <- audpc(evaluation = t(fungicide[, -1]), dates = jdate, type = "relative")
fungicide.audpc

# This gives us a vector with the AUDPC values per treatment. The vector format 
# does not make it particularly easy to compare the effect of cultivar or
# treatment. A better format to store these data would be in a table. Since all
# the values are numeric, we can place them into a matrix using the `matrix()`
# function. We are going to put the samples in rows and experiments in columns.

fungicide.res <- matrix(fungicide.audpc, nrow = 3, ncol = 2, byrow = TRUE)
fungicide.res

# We have our result, but there are no labels for the rows and columns. Notice
# how we selected `byrow = TRUE`. This means that the matrix was filled row by 
# row. So the first two elements of the vector would go in the first row, the
# next two would go in the second, and so on and so forth.

names(fungicide.audpc)[1:2]
names(fungicide.audpc)[3:4]
names(fungicide.audpc)[5:6]
 
# Since this is a small matrix, we can easily name these rows and columns
# ourselves using the `rownames()` and `colnames()` functions.

rownames(fungicide.res) <- c("2137", "Cutter", "Jagger")
colnames(fungicide.res) <- c("Control", "Treated")
fungicide.res

# If we wanted to use these data as a table in a paper, we should export it to a
# csv file. We do this using the function `write.table()`

dir.create("results")
write.table(fungicide.res, file = "results/audpc.csv", sep = ",", 
            col.names = NA,
            row.names = TRUE)
#
# Part IV: An alternative approach--Tidy Data
# -------------------------------------------
# 
# Imagine for a second that, instead of one control and one treatment for each 
# cultivar, that we had one control and two treatments. Without the
# `Julian.Date` column, the dimensions of our data frame would be 9 X 9. 
# 
# What would happen if we had tried the `audpc()` function on that matrix? It
# would have given us an answer, *but not the correct one*.
# 
# One solution to this would be to standardize the data format so that we have
# one observation per row. Our data, for example, might look something like 
# this truncated example:
# 
# ```
#   Experiment Julian.Date                  Cultivar Severity
# 1    control         139 TwentyOneThirtySevenWheat     2.34
# 2    control         146 TwentyOneThirtySevenWheat     7.56
# 3    control         154 TwentyOneThirtySevenWheat    28.78
# 4    control         139               CutterWheat     1.15
# 5    control         146               CutterWheat     3.62
# 6    control         154               CutterWheat    17.89
# 7    control         139               JaggerWheat     1.85
# 8    control         146               JaggerWheat     6.92
# 9    control         154               JaggerWheat    47.39
# 10 treatment         139 TwentyOneThirtySevenWheat     1.81
# 11 treatment         146 TwentyOneThirtySevenWheat     7.89
# 12 treatment         154 TwentyOneThirtySevenWheat    15.04
# 13 treatment         139               CutterWheat     1.79
# 14 treatment         146               CutterWheat     2.40
# 15 treatment         154               CutterWheat     6.21
# 16 treatment         139               JaggerWheat     2.27
# 17 treatment         146               JaggerWheat     5.00
# 18 treatment         154               JaggerWheat    20.17
# ```
# 
# The advantages here is that, when you look at the data, it is immediately 
# clear what all the values mean, because each column represents either measured
# data or metadata.
# 
# This data format is known by many names, including an un-pivot table and long
# data. We will be referring to this as "tidy" data. Now we could go into a
# spreadsheet program and reshape the data ourselves, but why should we do that
# when we know:
# 
#  1. Tasks like this are monotonous 
#  2. Humans are prone to mistakes with monotonous tasks 
#  3. Computers are best at doing monotonous tasks
#  
# If we use R to reshape our data, we can keep a track record of what we did to 
# it! Luckily, in the past few years, a suite of packages have come out
# explicitly designed to deal with tidy data frames aptly called the
# "tidyverse". If you are taking this as a workshop, you should have downloaded
# this package beforehand. Otherwise, please download it now.
# 
# The tidyverse is a package that loads several packages dealing with tidy data
# including:
# 
#  - ggplot2, for data visualisation.
#  - **dplyr**, for data manipulation.
#  - **tidyr**, for data tidying.
#  - readr, for data import.
#  - purrr, for functional programming.
#  - tibble, for tibbles, a modern re-imagining of data frames.
#  
# For details, see https://tidyverse.tidyverse.org

library("tidyverse")

# There are several ways of creating the tidy data frame; we will show one here,
# but there are others that are worth exploring on your own. 
# 
# The process we will demonstrate takes three steps:
#  
#  1. subset control and treatment data into separate data frames
#  2. collect each record into a single row with the *tidyr* function `gather()`
#     (This is also known as "unpivot" in Excel: 
#     http://www.excel-university.com/unpivot-excel-data/).
#  3. combine the two data frames and create a new column called "Experiment"
#     with the *dplyr* function `bind_rows()`
# 
# ### Step 1: Subset data
# 
# Subset control and treatmend data into separate data frames. Since we have a
# data frame, we will use matrix-like subsetting.

control   <- fungicide[, c(1, 2, 4, 6)]
treatment <- fungicide[, c(1, 3, 5, 7)]

# Now we have two separate data frames with 4 columns each, but still we have
# three observations per row. 

stop("
      Would this approach work for a different data set? Why or why not?
     ")

# ### Step 2: Tidy data
# 
# Now that we have our experiments in separate tables, we can reshape each 
# table into tidy format by using *tidyr*'s `gather()`. This will "gather" all
# of the data that are spread across columns into single rows. Users of excel
# might be familiar with this operation as "unpivot". 
# 
# In order to do this, we will need to specify three things:
# 
#  - A new column name to specify where the data came from (key)
#  - A new column name to specify what the data represents (value)
#  - The columns to include (or exclude) 
# 
# I often find the key/value syntax confusing and have to look at the examples
# in the help page for `gather()`.
# 

stop("
      Look at the examples for gather and determine what the names of the
      key and value columns should be for our data.
      (hint: you can use example(gather) to run them automatically).
    ")

# 
# 
# 
# Now that we have our keys and values, we can plug them into `gather()`. 
# 
# > Note, however, this uses "bare" names (names that are not between quotation
# > marks) to specify columns. This is a feature of the tidyverse to make typing
# > easier, but does not necessarily work outside of the tidyverse. 
# 
# To avoid typing all of the columns we want to collapse, we'll simply specify
# the column that we don't want to collapse, which is Julian.Date. This is done
# by placing a minus (-) symbol in front of it.

con.tidy <- gather(data = control, key = Cultivar, value = Severity, -Julian.Date)
con.tidy

# Note that we can easily get back our original data by using the `spread()`
# function, which is the opposite of `gather()`:

spread(data = con.tidy, key = Cultivar, value = Severity)

# This was simply to demonstrate that with tidy data, it's possible to reshape
# it in most any way possible.
# 
# Now we can tidy our treatment data. But first, because we want to combine this
# data with our control, we want to make sure that the values in the "Cultivar"
# column are the same. Currently we have the following columns in our treatment
# data.

colnames(treatment)

# If we take a look at these column names, we can see that they all end in .Trt,
# except for the second column, which ends in .trt. Because R is case-sensitive,
# it will see .trt and .Trt as two different things. To avoid this problem, we
# will simply replace the column names of the treatment to those of the control.

colnames(control)
colnames(treatment) <- colnames(control)
treatment

# Now we can tidy our treatment data.

trt.tidy <- gather(data = treatment, key = Cultivar, value = Severity, -Julian.Date)

# ### Step 3: combining experiments
# 
# We can combine the treatments by using the *dplyr* function `bind_rows()`, 
# which takes any number of data frames and places them on top of one another.
# It takes an optional argument, `.id` (note the ".") that specifies a separate
# column to create identifying the source data frame.

fungicide.tidy <- bind_rows(control = con.tidy, fungicide = trt.tidy, .id = "Experiment")
fungicide.tidy

# 
# 
# We've gone to the work to tidy up the data; let's save it to our disk so that
# we can easily reuse it later.
# 

write_csv(fungicide.tidy, path = "data/FungicideTidy.csv")

# 
# Part V: Calculating AUDPC using tidy data
# -----------------------------------------
# 
# The package *dplyr* is one of the most powerful R packages because it allows
# you to think about manipulating data in a way that makes sense to humans. 
# Here, I will show you how to calculate AUDPC from the tidy data frame in three
# steps:
# 
#  1. Separate the data into groups by Experiment and Cultivar
#  2. Summarize AUDPC for each group
#  3. Spread the AUDPC data into separate columns by Experiment
# 
# Here, we use the `group_by()` function to split the rows into specific groups. 
tmp <- group_by(fungicide.tidy, Experiment, Cultivar)
tmp
# You can see here that it says "Groups: Experiment, Cultivar [6]". This
# indicates that we have six groups, containing the experiment and cultivar
# pairs. 
# 
# Now that we have told *dplyr* to assign groups, we can use the *dplyr*
# function `summarize()` to summarize the data within the groups with a function
# that takes in a vector (or multiple vectors) and returns a single value. In
# our case, this is the AUDPC function.
tmp <- summarize(tmp, AUDPC = audpc(Severity, Julian.Date, type = "relative"))
tmp
# Now we see that we have 6 rows and three columns, If we wanted to have each
# experiment side by side, we can use the `spread()` function as we saw earlier
# to spread out our data
fungicide.res <- spread(tmp, Experiment, AUDPC)
fungicide.res
# Now we can write this to a table!
write.table(fungicide.res, 
            file = "results/audpc_tidy.csv",
            sep = ",",
            row.names = FALSE, 
            col.names = TRUE)
