<br>

<!-- badges: start -->
[![Project Status: Active The project has reached a stable, usable state and is being actively developed.](https://www.repostatus.org/badges/latest/active.svg)](https://www.repostatus.org/#active)
[![minimal R version](https://img.shields.io/badge/R%3E%3D-3.6-6666ff.svg)](https://cran.r-project.org/)
[![Maintenance](https://img.shields.io/badge/Maintained%3F-yes-green.svg)](https://GitHub.com/Naereen/StrapDown.js/graphs/commit-activity)
[![Last-changedate](https://img.shields.io/badge/last%20change-2021--08--08-yellowgreen.svg)](/commits/master)
<!-- badges: end -->

# MVE chub mackerel
Code to replicate the article "Modeling the Pacific chub mackerel (**Scomber japonicus**) ecological niche and future scenarios in the northern Peruvian Current system".

Open the MVEchubmackerel.Rproj and follow the order provided in the code folder:

* 0) 0_auxiliar_functions.R (You do not need to run this code. It will be called from the following scripts).

* 1) 1_MVE_chub_mackerel.R

* 2) 2_MVE_chub_mackerel_bootstraping.R

* 3) 3_Ellipsoide_plot.R

All the scripts have comments for an easy understanding of the process.

Nevertheless, you must download maxent software from: https://biodiversityinformatics.amnh.org/open_source/maxent/. After that, **you have to create a folder named maxent**, inside this folder there will be: **maxent.bat, maxent.jar, maxent.sh, readme.txt**.

Also, you need to install *kuenm* package. Please follow the instructions provided in this link: https://github.com/marlonecobos/kuenm#installing-the-package


The file structure of this project is:

- code

- data

- figures

- output

- MVEchubmackerel.Rproj

- README.md


If you want to replicate the maps or other plots of the paper, contact to *Josymar Torrejón-Magallanes* (ejosymart@gmail.com) *or Luis Enrique Angeles-González* (luis.angeles0612@gmail.com).


If you find any problem in the code, please add this at the Issues section of the github.


## Reference
