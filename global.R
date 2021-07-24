# packages
library(shiny)
library(shinythemes)
library(shinycssloaders)
library(shinyWidgets)
library(tidyverse)
library(knitr)
library(ggfortify)
library(plotly)
library(FNN)
library(jsonlite)
library(lubridate)
library(httr)
library(rvest)
library(shinyjs)
library(gtrendsR)

# To install
packages <- c(
  "shiny", "shinythemes", "shinycssloaders", "shinyWidgets", "tidyverse", "knitr", "ggfortify",
  "plotly", "FNN", "jsonlite", "lubridate", "httr", "rvest", "shinyjs", "gtrendsR"
)

# Inspired by https://github.com/ThiagoValentimMarques/The-ten-most-similar-players-Pro-Evolution-Soccer-2019



# package.check <- lapply(packages, FUN = function(x) {
#   if (!require(x, character.only = TRUE)) {
#     install.packages(x, dependencies = TRUE)
#   }
# })

toyota = read.csv("toyota.csv")
hyundai = read.csv("hyundai.csv")
honda = read.csv("honda.csv")