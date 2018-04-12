# Learn R!Beginner's workshop 
R-Ladies-Vancouver  
April 2, 2018  


## Overview

---

Notes from a hands-on 3 hour workshop for participants with no prior knowledge of programming skills. 

Learning materials used in this tutorial were adapted form:

* [Intro into R by Research Bazar](https://resbaz.github.io/RLadies-Intro-R-workshop/)
* [Software Carpentry - "R for reproducible scientific analysis"](https://swcarpentry.github.io/r-novice-gapminder/)
* [2-hour intro into R by Mine Cetinkaya-Rundel](https://github.com/mine-cetinkaya-rundel/rworkshop-mem)

**Required**

* a laptop
* R and R studio installed. [Click here](https://github.com/R-Ladies-Vancouver/April2018-Learn-R-Beginner/blob/master/Setup.md) for instructions. 
* we will also need be installing the  `dplyr` and  `ggplot2`packages during the tutorial

**Other resources**

* [Google slides](https://docs.google.com/presentation/d/1ZhVXBN7cJfRrQuR2BAmUNfxt9-wMDb1_y6bt5NoWjag/edit#slide=id.g36b4849f4f_0_11)

* The open-source dataset with passanger onboard a Titanic from [Kaggle website](https://www.kaggle.com/c/titanic). Download the csv file with the dataset [here](https://drive.google.com/open?id=1iK6tiBsb4cabyi7mP5FLCH6LWYs4hOSI). We will use this learn dplyr and ggplot2 package

**Topics covered**

1. RStudio orientation & good practices for data analysis   
2. Basics of coding in R  
3. Working with functions and packages  
4. Loading and inspecting the titanic.csv dataset
5. Basics of data wrangling with the `dplyr` package  
6. Basics of data plotting with the `ggplot2` package  

---

## What is R and RStudio?

What is R and why learn it? 

* one of the leading languages in statistics and data science
* open-source and free
* powerfull for data wrangling and visualization
* large library of tools (packages and functions) for diverse applications (e.g. [Bioconductor for genomic research](https://www.bioconductor.org/), [rOpenGov for social sciences](http://ropengov.github.io/about/))
* increasing number of organizations use R, find out more in this [StackOverflow post](https://stackoverflow.blog/2017/10/10/impressive-growth-r/)
* with a programming language such as R you can document the process of your data analysis, making it easier for you or another user to reproduce. This is challenging using tools such as an excell spreadsheet, where calculations are hidden in individual cells.
* R has a highly active, supportive and fast-growing user and developer community. 


What is RStudio?

* powerful and productive user interface for R
* free and open-source. 

---

## Data analysis workflow


As adapted from R for Data Science by Hadley Wickham, the maker of the many popular R packages such as `dplyr` and `ggplot2` packages we will be working with today

![](https://github.com/R-Ladies-Vancouver/April2018-Learn-R-Beginner/blob/master/Img/2018-April_event-presentation.jpg)


---

## RStudio orientation & best practices for data analysis

This is what you should see when you launch RStudio:

* the interactive console (left), a version of R you are working with will be printed there every time you start a new session
* Environment/History (top right)
* Files/Plots/Packages/Help/Viewer

![](https://github.com/R-Ladies-Vancouver/April2018-Learn-R-Beginner/blob/master/Img/RStudio-launch.jpg)

---

## Setting yourself up for reproducible R work

Before we begin producing R code, we need to familiarize ourselves with where R work is going to be located on our computer.To find out, type `getwd()` into the console. This will prompt R to print out a path to a location on your computer where any scripts, plots, data you generate will be saved.


```r
getwd()
```

```
## [1] "C:/Users/Ania/R_coding/RLadies-Van-Github/April2018-Learn-R-Beginner"
```


It is a good practice to keep all of your data analysis for a particular project in a single location. RStudio comes with a built-in framework called R projects. To create a new project in RStudio:

1. Click the “File” menu button, then “New Project”.
2. Click “New Directory”.
3. Click “Empty Project”.
4. Type in the name of the directory to store your project
5. Click the “Create Project” button.


A recommendation on how to organize your R project from [Good Enough Practices for Scientific Computing](https://github.com/swcarpentry/good-enough-practices-in-scientific-computing/blob/gh-pages/good-enough-practices-for-scientific-computing.pdf) as summarized by [Software Carpentry](https://swcarpentry.github.io/r-novice-gapminder/02-project-intro/)

1. Put each project in its own directory, which is named after the project.
2. Put text documents associated with the project in the doc directory.
3. Put raw data and metadata in the data directory, and files generated during cleanup and analysis in a results directory.
4. Put source for the project’s scripts and programs in the src directory, and programs brought in from elsewhere or compiled locally in the bin directory.
5. Name all files to reflect their content or function.

> Challenge

1. Create an Rproject called “R-beginner-workshop". Click **File**>**New Project**>**New directory**>**Empty project** 
2. Create a folder called "data"
3. Put the titanic.csv into folder data
4. Create a folder called "scr"

---

## Basics of R coding


You can clear your console with a command `ctr + L`

We can use R to do simple arithmetic: 

* division `/`
* multiple `*`
* addition `+`
* exponent `^`
* subtraction `-`

For instance, type the following in your console:


```r
5+5
```

```
## [1] 10
```

```r
10/5
```

```
## [1] 2
```

The answer to this is printed below the command, preceded by [1]. Right now, none of our work exists anywhere besides the console. 

To create a script:

 1. Click File
 2. Click New File 
 3. Click R script
 4. Give your script a name

> Challenge

* Create a script called “R-beginner-code” in your current project and put it in `scr` folder
 
---

We can annotate a script with comments using the `#`. If you precede anything with this sign, R will ignore it.  For instance


```r
# to do a addition in R, we do the following
5+5
```

```
## [1] 10
```

To store results or data we need to assign it a name, using assignment operator `<-`


```r
# now I tell R to store my height

height_cm <- 172
```

Now, position your cursor at the line of the above command and press `CTRL + ENTER` (Windows) or `COMMAND + ENTER` (Mac). In the environment (top right) you should see a variable `height_cm` and its value appear

It is not always possible to view what is stored in a variable by looking at your environment. To find out what value is stored in the variable `height_cm` simply type it in the new line of our script and run `CTRL + ENTER`/`COMMAND + ENTER`.


```r
# what is stored in height_cm?

height_cm
```

```
## [1] 172
```

Note, R is case sensitive. If we were to type `Height_cm` we would get an error. Try it!


```r
# what is stored in height_cm?

# Height_cm
```

Say you wanted to convert your heigh to inches.


```r
# what is my height in inches?

height_cm * 0.39
```

```
## [1] 67.08
```

```r
# oh wait, I want to store this value!

height_inches <- height_cm * 0.39

# what is it again?

height_inches
```

```
## [1] 67.08
```

If we wanted to clear the environment of the variables we have 2 options:

* rm(list = ls())
* start a new R session - essentially a refresh button. In RStudio click "Session" > "Restart R"

> Challenge

1. Create a variable called `mass_kg` with a value of 50
2. Convert `mass_kg` to mass in pounds (multiply by 2.2) and store the answer in `mass_lbs`


## What are functions and packages?

**Functions:**

* fundamental building blocks of R
* a list of "build-in"R functions (come with installation) can be found [here](http://www.sr.bham.ac.uk/~ajrs/R/r-function_list.html)
* functions are used by first specifying first their name followed by `()`, into which we put arguments that a given function takes.

`log()` is an example of a function to compute a logarithm.

You can also get information on how to use a function in R studio by typing

`?log()`

This will promt a Help page in the bottom right pane to appear with description of a function, what arguments a given function uses and some examples of how to apply it.


```r
# find out log of height_cm
log(height_cm)
```

```
## [1] 5.147494
```

```r
# find out exp of height_cm
exp(height_cm)
```

```
## [1] 4.996327e+74
```


Objects can store more than one value, and this value can be
* numeric (e.g. 1,2, -3, .2)
* character (e.g."vancouver","victoria","nanaimo")
* locaical (TRUE or FALSE)

We will see shortly that an object can also be a large dataset with a variety of data types.


```r
# an object with few numeric values
heights_cm <- c(172, 143, 152, 180)

mean(heights_cm)
```

```
## [1] 161.75
```

```r
sd(heights_cm)
```

```
## [1] 17.17314
```

```r
length(heights_cm)
```

```
## [1] 4
```


**Packages**:

* Packages are the fundamental units of reproducible R code. They include reusable R functions, the documentation that describes how to use them, and (often) sample data. (From: http://r-pkgs.had.co.nz)

* Packages need to be **installed** once only, therefore we don't put these commands into the script. To install a package we use a command `install.packages("package-name")`. Today, we will be working with two packages called the `dplyr` for data wrangling and `ggplot2`for data visualization

* Packages need to be **loaded** everytime we start a new R session. Typically this command goes on top of a script. To do so we use `library("package-name")` command


> Challenge

Install the `dplyr` and `ggplot2` packages.

Type the following into console. 


```r
# install.packages("ggplot2")
# install.packages("dplyr")
```

Now load these packages.


```r
library("ggplot2")
library("dplyr")
```

```
## Warning: package 'dplyr' was built under R version 3.4.3
```

```
## 
## Attaching package: 'dplyr'
```

```
## The following objects are masked from 'package:stats':
## 
##     filter, lag
```

```
## The following objects are masked from 'package:base':
## 
##     intersect, setdiff, setequal, union
```


## Loading and inspecting the titanic.csv dataset

---



```r
library("dplyr")
library("ggplot2")

titanic <- read.csv("Data/titanic.csv")

# tibble: a refined print method that shows only first 10 rows and all columns fit the screen

titanic <- as_tibble(titanic)
```


Before we dive into extracting information from this dataset, it is important to know what variables we are working with. 

There are several functions that will provide information about the structure of the dataframe: `str()`, `head()` (part of base R) or `glimpse()`(part of DPLYR package).

Note the differences in the output in your R console when you run these three functions.


```r
head(titanic)
```

```
## # A tibble: 6 x 12
##   PassengerId Survived Pclass Name    Sex     Age SibSp Parch Ticket  Fare
##         <int>    <int>  <int> <fct>   <fct> <dbl> <int> <int> <fct>  <dbl>
## 1           1        0      3 Braund~ male    22.     1     0 A/5 2~  7.25
## 2           2        1      1 Cuming~ fema~   38.     1     0 PC 17~ 71.3 
## 3           3        1      3 Heikki~ fema~   26.     0     0 STON/~  7.92
## 4           4        1      1 Futrel~ fema~   35.     1     0 113803 53.1 
## 5           5        0      3 Allen,~ male    35.     0     0 373450  8.05
## 6           6        0      3 Moran,~ male    NA      0     0 330877  8.46
## # ... with 2 more variables: Cabin <fct>, Embarked <fct>
```

```r
glimpse(titanic)
```

```
## Observations: 891
## Variables: 12
## $ PassengerId <int> 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15,...
## $ Survived    <int> 0, 1, 1, 1, 0, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 1, 0,...
## $ Pclass      <int> 3, 1, 3, 1, 3, 3, 1, 3, 3, 2, 3, 1, 3, 3, 3, 2, 3,...
## $ Name        <fct> Braund, Mr. Owen Harris, Cumings, Mrs. John Bradle...
## $ Sex         <fct> male, female, female, female, male, male, male, ma...
## $ Age         <dbl> 22, 38, 26, 35, 35, NA, 54, 2, 27, 14, 4, 58, 20, ...
## $ SibSp       <int> 1, 1, 0, 1, 0, 0, 0, 3, 0, 1, 1, 0, 0, 1, 0, 0, 4,...
## $ Parch       <int> 0, 0, 0, 0, 0, 0, 0, 1, 2, 0, 1, 0, 0, 5, 0, 0, 1,...
## $ Ticket      <fct> A/5 21171, PC 17599, STON/O2. 3101282, 113803, 373...
## $ Fare        <dbl> 7.2500, 71.2833, 7.9250, 53.1000, 8.0500, 8.4583, ...
## $ Cabin       <fct> , C85, , C123, , , E46, , , , G6, C103, , , , , , ...
## $ Embarked    <fct> S, C, S, S, S, Q, S, S, S, C, S, S, S, S, S, S, Q,...
```

```r
str(titanic)
```

```
## Classes 'tbl_df', 'tbl' and 'data.frame':	891 obs. of  12 variables:
##  $ PassengerId: int  1 2 3 4 5 6 7 8 9 10 ...
##  $ Survived   : int  0 1 1 1 0 0 0 0 1 1 ...
##  $ Pclass     : int  3 1 3 1 3 3 1 3 3 2 ...
##  $ Name       : Factor w/ 891 levels "Abbing, Mr. Anthony",..: 109 191 358 277 16 559 520 629 417 581 ...
##  $ Sex        : Factor w/ 2 levels "female","male": 2 1 1 1 2 2 2 2 1 1 ...
##  $ Age        : num  22 38 26 35 35 NA 54 2 27 14 ...
##  $ SibSp      : int  1 1 0 1 0 0 0 3 0 1 ...
##  $ Parch      : int  0 0 0 0 0 0 0 1 2 0 ...
##  $ Ticket     : Factor w/ 681 levels "110152","110413",..: 524 597 670 50 473 276 86 396 345 133 ...
##  $ Fare       : num  7.25 71.28 7.92 53.1 8.05 ...
##  $ Cabin      : Factor w/ 148 levels "","A10","A14",..: 1 83 1 57 1 1 131 1 1 1 ...
##  $ Embarked   : Factor w/ 4 levels "","C","Q","S": 4 2 4 4 4 3 4 4 4 2 ...
```

It is also possible to view a dataframe in a spreadsheet-like view. Click on the `titanic` in your Environment to chek it out.

**What is in the titanic dataset?**


Variable | Definition    | Key                        | 
---------|:--------------|:-------------------------- |
survival |	Survival     |	0 = No, 1 = Yes           |
pclass   |	Ticket class |	1 = 1st, 2 = 2nd, 3 = 3rd |
sex	     |  Sex	         |                            |
Age      |	Age in years |                            |
sibsp    |	# of siblings / spouses aboard the Titanic	| |
parch    |	# of parents / children aboard the Titanic	| |
ticket   |	Ticket number	|                           |
fare     |	Passenger fare|                           |
cabin	   |  Cabin number  |                           |
embarked |	Port of Embarkation	C = Cherbourg, Q = Queenstown, S = Southampton |         |


Other usefull commands to explore a dataset:


```r
names(titanic) # lists the variable names
```

```
##  [1] "PassengerId" "Survived"    "Pclass"      "Name"        "Sex"        
##  [6] "Age"         "SibSp"       "Parch"       "Ticket"      "Fare"       
## [11] "Cabin"       "Embarked"
```

```r
dim(titanic) # dimentions of the dataset, it has 891 observations by 12 columns
```

```
## [1] 891  12
```

```r
nrow(titanic) # number of observations
```

```
## [1] 891
```

```r
summary(titanic) # gives me summary statistics for every column/variable
```

```
##   PassengerId       Survived          Pclass     
##  Min.   :  1.0   Min.   :0.0000   Min.   :1.000  
##  1st Qu.:223.5   1st Qu.:0.0000   1st Qu.:2.000  
##  Median :446.0   Median :0.0000   Median :3.000  
##  Mean   :446.0   Mean   :0.3838   Mean   :2.309  
##  3rd Qu.:668.5   3rd Qu.:1.0000   3rd Qu.:3.000  
##  Max.   :891.0   Max.   :1.0000   Max.   :3.000  
##                                                  
##                                     Name         Sex           Age       
##  Abbing, Mr. Anthony                  :  1   female:314   Min.   : 0.42  
##  Abbott, Mr. Rossmore Edward          :  1   male  :577   1st Qu.:20.12  
##  Abbott, Mrs. Stanton (Rosa Hunt)     :  1                Median :28.00  
##  Abelson, Mr. Samuel                  :  1                Mean   :29.70  
##  Abelson, Mrs. Samuel (Hannah Wizosky):  1                3rd Qu.:38.00  
##  Adahl, Mr. Mauritz Nils Martin       :  1                Max.   :80.00  
##  (Other)                              :885                NA's   :177    
##      SibSp           Parch             Ticket         Fare       
##  Min.   :0.000   Min.   :0.0000   1601    :  7   Min.   :  0.00  
##  1st Qu.:0.000   1st Qu.:0.0000   347082  :  7   1st Qu.:  7.91  
##  Median :0.000   Median :0.0000   CA. 2343:  7   Median : 14.45  
##  Mean   :0.523   Mean   :0.3816   3101295 :  6   Mean   : 32.20  
##  3rd Qu.:1.000   3rd Qu.:0.0000   347088  :  6   3rd Qu.: 31.00  
##  Max.   :8.000   Max.   :6.0000   CA 2144 :  6   Max.   :512.33  
##                                   (Other) :852                   
##          Cabin     Embarked
##             :687    :  2   
##  B96 B98    :  4   C:168   
##  C23 C25 C27:  4   Q: 77   
##  G6         :  4   S:644   
##  C22 C26    :  3           
##  D          :  3           
##  (Other)    :186
```

---

## Data wrangling with the DPLYR package

The dplyr package is based on the concepts of functions as verbs that manipulate data frames:

* `filter()`: pick rows matching criteria
* `select()`: pick columns by name
* `rename()`: rename specific columns
* `arrange()`: reorder rows
* `mutate()`: add new variables
* `transmute()`: create new data frame with variables
* `sample_n()` / `sample_frac()`: randomly sample rows
* `summarise()`: reduce variables to values

Each one of these functions can be performed individually but the real power comes in when we string them together using the pipe (`%>%`) operator. This allows us to perform multiple operations in one hit and return a single tibble with our results at the end.

Let's explore some of these functions!

### Picking out variables with select()

Use the `select()` function to extract specific variables from a dataframe. You can store variables of interest extracted with `select()` in new tibble should you want to have a small subset of the data to work on seperately.

Here's an example. 


```r
# this 'pipes' the titanic dataset to the select command and will # print only the age, sex and survived columns
   titanic %>%
   select(Age,Sex,Survived)
```

```
## # A tibble: 891 x 3
##      Age Sex    Survived
##    <dbl> <fct>     <int>
##  1   22. male          0
##  2   38. female        1
##  3   26. female        1
##  4   35. female        1
##  5   35. male          0
##  6   NA  male          0
##  7   54. male          0
##  8    2. male          0
##  9   27. female        1
## 10   14. female        1
## # ... with 881 more rows
```

```r
# I am happy with the output, now let's create a seperate object
# containing just these 3 columns (aka variables)
 gender_survival <- titanic %>%
   select(Age,Sex,Survived)
```

There are various ways to use `select()` function. For instance, we could extract variables that start or end with certain letters or strings.


```r
# select columns which begin with letter A 
   titanic %>%
   select(starts_with("A"))
```

```
## # A tibble: 891 x 1
##      Age
##    <dbl>
##  1   22.
##  2   38.
##  3   26.
##  4   35.
##  5   35.
##  6   NA 
##  7   54.
##  8    2.
##  9   27.
## 10   14.
## # ... with 881 more rows
```

```r
# select columns which end with letter s
   titanic %>%
   select(ends_with("s"))
```

```
## # A tibble: 891 x 1
##    Pclass
##     <int>
##  1      3
##  2      1
##  3      3
##  4      1
##  5      3
##  6      3
##  7      1
##  8      3
##  9      3
## 10      2
## # ... with 881 more rows
```

> ### Challenge

Create a subset of titanic dataframe called `passanger_info` containing `Name`,`Age`,`Sex`

### Subsetting with filter()

The function `filter()` extracts data **row_wise**. 

An example: Column (variable) **Sex** contains two categories: females and males. Let's extract all of the information (all variables) contained in the `titanic` dataset but only for females


```r
# extract all of the variables but only for females
   titanic%>%
     filter(Sex == "female")
```

```
## # A tibble: 314 x 12
##    PassengerId Survived Pclass Name   Sex     Age SibSp Parch Ticket  Fare
##          <int>    <int>  <int> <fct>  <fct> <dbl> <int> <int> <fct>  <dbl>
##  1           2        1      1 Cumin~ fema~   38.     1     0 PC 17~ 71.3 
##  2           3        1      3 Heikk~ fema~   26.     0     0 STON/~  7.92
##  3           4        1      1 Futre~ fema~   35.     1     0 113803 53.1 
##  4           9        1      3 Johns~ fema~   27.     0     2 347742 11.1 
##  5          10        1      2 Nasse~ fema~   14.     1     0 237736 30.1 
##  6          11        1      3 Sands~ fema~    4.     1     1 PP 95~ 16.7 
##  7          12        1      1 Bonne~ fema~   58.     0     0 113783 26.6 
##  8          15        0      3 Vestr~ fema~   14.     0     0 350406  7.85
##  9          16        1      2 "Hewl~ fema~   55.     0     0 248706 16.0 
## 10          19        0      3 Vande~ fema~   31.     1     0 345763 18.0 
## # ... with 304 more rows, and 2 more variables: Cabin <fct>,
## #   Embarked <fct>
```

We can also do multiple levels of filtering.


```r
# extract all of the variables but only or females aged 20 and up
   titanic%>%
    filter(Sex == "female", Age > 20)
```

```
## # A tibble: 184 x 12
##    PassengerId Survived Pclass Name   Sex     Age SibSp Parch Ticket  Fare
##          <int>    <int>  <int> <fct>  <fct> <dbl> <int> <int> <fct>  <dbl>
##  1           2        1      1 Cumin~ fema~   38.     1     0 PC 17~ 71.3 
##  2           3        1      3 Heikk~ fema~   26.     0     0 STON/~  7.92
##  3           4        1      1 Futre~ fema~   35.     1     0 113803 53.1 
##  4           9        1      3 Johns~ fema~   27.     0     2 347742 11.1 
##  5          12        1      1 Bonne~ fema~   58.     0     0 113783 26.6 
##  6          16        1      2 "Hewl~ fema~   55.     0     0 248706 16.0 
##  7          19        0      3 Vande~ fema~   31.     1     0 345763 18.0 
##  8          26        1      3 Asplu~ fema~   38.     1     5 347077 31.4 
##  9          41        0      3 Ahlin~ fema~   40.     1     0 7546    9.48
## 10          42        0      2 Turpi~ fema~   27.     1     0 11668  21.0 
## # ... with 174 more rows, and 2 more variables: Cabin <fct>,
## #   Embarked <fct>
```

he trick with the `filter()` option is that we always want each statement to return a `True` or a `False`. 

 **Performing calculations with group_by() and summarize()**
 
So far we learnt how to extract pieces of data from the `titanic` dataset, but we still have lots of rows of data. How do we summarize it so that we can find out something useful, say the average age of people who survived the tragedy? This is where two powerful functions come in:  `group_by` and `summarize()`.

To perform operations on the `titanic` dataset, we first need to specify what variable we want to summarize with the `group_by`function.

In the example below we specify that the operation will be grouped by Sex for the `titanic` data. Because we have 2 categories in `Sex`, the female and male, any calculations we perform after the `group_by` will produce one value for females and one value for males.



```r
titanic%>%
  group_by(Sex)
```

```
## # A tibble: 891 x 12
## # Groups:   Sex [2]
##    PassengerId Survived Pclass Name   Sex     Age SibSp Parch Ticket  Fare
##          <int>    <int>  <int> <fct>  <fct> <dbl> <int> <int> <fct>  <dbl>
##  1           1        0      3 Braun~ male    22.     1     0 A/5 2~  7.25
##  2           2        1      1 Cumin~ fema~   38.     1     0 PC 17~ 71.3 
##  3           3        1      3 Heikk~ fema~   26.     0     0 STON/~  7.92
##  4           4        1      1 Futre~ fema~   35.     1     0 113803 53.1 
##  5           5        0      3 Allen~ male    35.     0     0 373450  8.05
##  6           6        0      3 Moran~ male    NA      0     0 330877  8.46
##  7           7        0      1 McCar~ male    54.     0     0 17463  51.9 
##  8           8        0      3 Palss~ male     2.     3     1 349909 21.1 
##  9           9        1      3 Johns~ fema~   27.     0     2 347742 11.1 
## 10          10        1      2 Nasse~ fema~   14.     1     0 237736 30.1 
## # ... with 881 more rows, and 2 more variables: Cabin <fct>,
## #   Embarked <fct>
```

Not much will happen when running `group_by` by itself, although in the console above the dataframe that was printed we can see a new line #Groups: Sex [2]. To perform an operation we need to use `group_by` in conjunction with `summarise()`

With summarize we can use the functions we explored at the beginning of the workshop (`mean`,`sd`,`median`,`n()`) or we can perform calculations like we would do in a cell of an excel spreadhseet. 

To calculate the mean age for females and males in the `titanic` dataset:

1. Group your data by variable **Sex**
2. Define what to average with the `mean()` function and put this inside the `summarize()`
3. Note, there are some missing values (NA's) in the variable **Age**, we must tell R to ignore NA's in those calculations using `na.rm = "TRUE` (i.e. na remove = yes)


```r
titanic%>%
  group_by(Sex)%>%
  summarize(mean(Age, na.rm = "TRUE"))
```

```
## # A tibble: 2 x 2
##   Sex    `mean(Age, na.rm = "TRUE")`
##   <fct>                        <dbl>
## 1 female                        27.9
## 2 male                          30.7
```

Now, let's find out the average age of females and males that survive (1) and died (0) by adding **Survived** into the `groub_by()`


```r
titanic%>%
  group_by(Sex,Survived)%>%
  summarize(mean_age = mean(Age, na.rm = "TRUE"))
```

```
## # A tibble: 4 x 3
## # Groups:   Sex [?]
##   Sex    Survived mean_age
##   <fct>     <int>    <dbl>
## 1 female        0     25.0
## 2 female        1     28.8
## 3 male          0     31.6
## 4 male          1     27.3
```

Just like with `groub_by()` where we can have many variables, we can apply many operations in summarize.


```r
titanic%>%
  group_by(Sex,Survived)%>%
  summarize(mean_age = mean(Age, na.rm = "TRUE"),
            stdev = sd(Age, na.rm = "TRUE"),
            num_of_obs = n())
```

```
## # A tibble: 4 x 5
## # Groups:   Sex [?]
##   Sex    Survived mean_age stdev num_of_obs
##   <fct>     <int>    <dbl> <dbl>      <int>
## 1 female        0     25.0  13.6         81
## 2 female        1     28.8  14.2        233
## 3 male          0     31.6  14.1        468
## 4 male          1     27.3  16.5        109
```

> Challenge

Calculate mean, stdev and number of observations for variables Sex in conjunction with Passanger class. Hint!: follow the example we just did.


**Creating new variables with mutate()**

[Marion to finish this section]



> Challenge

1. Create a new object called 'males' containing only columns Age, Sex, Name and 

2. Create a new variable

---

## Data plotting with the GGPLOT2 package

Ggplot2 is built on the [Grammar of Graphics](http://www.springer.com/gb/book/9780387245447). It is a package created by [Hadley Wickham](http://hadley.nz/)

The basic elements required to build a ggplot-plot are:

* dataset 
* aesthetic (position, color, shape, size)
* a set of geoms--they define how data will be plotted (e.g geom_point is for scatterplots, while geom_bar is for bar plots)
* scales
* facetting - if creating subplots plots
* coordinate system

There is a handy [cheatsheet](https://www.rstudio.com/wp-content/uploads/2015/03/ggplot2-cheatsheet.pdf)) for using ggplot2.

And a crazy amount of graphs and options you can customise - [check it out!](http://ggplot2.tidyverse.org/index.html)

Scatter plot example

```r
titanic%>%
  ggplot(aes( x = Age, y = Fare, color = Sex )) + geom_point()
```

```
## Warning: Removed 177 rows containing missing values (geom_point).
```

![](Learn-R-tutorial_files/figure-html/unnamed-chunk-23-1.png)<!-- -->

Adding `dplyr` verbs - zooming on a data of interest.


```r
titanic%>%
  filter(Fare < 200)%>%
  ggplot(aes( x = Age, y = Fare, color = Sex )) + geom_point()
```

```
## Warning: Removed 175 rows containing missing values (geom_point).
```

![](Learn-R-tutorial_files/figure-html/unnamed-chunk-24-1.png)<!-- -->

Creating bar plots : geom_bar()


```r
titanic%>%
  ggplot(aes( x= Pclass, fill = Sex)) +
  geom_bar(position = "dodge")
```

![](Learn-R-tutorial_files/figure-html/unnamed-chunk-25-1.png)<!-- -->


Visualizing data points with geom_jitter() 


```r
titanic%>%
  ggplot(aes( x= Pclass, y= Age, color = Sex)) +
  geom_jitter()
```

```
## Warning: Removed 177 rows containing missing values (geom_point).
```

![](Learn-R-tutorial_files/figure-html/unnamed-chunk-26-1.png)<!-- -->

Creating multiple plots using facet_grid()


```r
titanic%>%
  ggplot(aes( x= Pclass, y= Age, color = Sex)) +
  geom_jitter()+
  facet_grid(~Survived)
```

```
## Warning: Removed 177 rows containing missing values (geom_point).
```

![](Learn-R-tutorial_files/figure-html/unnamed-chunk-27-1.png)<!-- -->


