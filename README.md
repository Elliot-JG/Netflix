# Netflix


## :wave: Introduction <a name="introduction"></a>
This is a repository for the analysis of Netflix movies and TV shows from 2008-2020 from the [Kaggle dataset](https://www.kaggle.com/shivamb/netflix-shows), made available through [Flixable](flixable.com). This was written in Rstudio but feel free to use any GUI!

During this process I learnt how to: 
* Deal with dates in lubridate 
* Plot bar charts with ggplot
* Format bar charts with font size and tick marks in ggplot 


This assignment is broken down into 2 stages: 

1. Analysis of the average length of different film genres 
2. Analysis of the number of films released each year


This repository contains data licensed under [CCO Universal Public Domain Dedication](https://creativecommons.org/publicdomain/zero/1.0/)

## :dog: Table of contents 
* [General info](#introduction)
* [Prerequisites](#prerequisites)
* [Data](#data)
* [Usage](#usage)
* [Guide to the files](#guide)

## :rose: Prerequisites <a name="prerequisites"></a>
The dependencies for the assignment are:
* [tidyverse](https://www.tidyverse.org/)
* [readr](https://readr.tidyverse.org/)
* [ggplot2](https://ggplot2.tidyverse.org/)
* [Lubridate](https://lubridate.tidyverse.org/)

Note, some of these (lubridate and ggplot2 for example) are included within the tidyverse. However, in the spirit of transparency I thought I would list them all 

## :evergreen_tree: Data <a name="data"></a>
* **netflix_titles.csv**
  + Data on netflix titles released 2008-2020
  + For more information please see the [kaggle](https://www.kaggle.com/shivamb/netflix-shows) and [Flixable](flixable.com) page
 

## :lemon: Usage <a name="usage"></a>
* To clone this git repository using [Git Bash](https://gitforwindows.org/):
```r
$ git clone https://github.com/Elliot-JG/Netflix.git
```
* Alternatively, press the green button at the top of this page and unzip the folder in an appropriate place  ![](https://github.com/Elliot-JG/GY7702_assignment/blob/main/READ_ME_graphics/repo_access_clip.PNG)  

## :octopus: Guide to the files <a name="guide"></a>
* **Master_code.R**  
  + In this file you will find 3 sections that address the 2 points of this mini-project
  + Best ran in RStudio


