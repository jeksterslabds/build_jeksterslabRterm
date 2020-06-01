#' ---
#' title: "Setup Terminal Tools for R Scripting"
#' author: "Ivan Jacob Agaloos Pesigan"
#' date: "`r Sys.Date()`"
#' output:
#'   rmarkdown::github_document:
#'     toc: true
#' ---
#'
#' ## Setup
#' 
#+ setup
source("https://raw.githubusercontent.com/jeksterslabds/jeksterslabRutils/master/R/util_txt2file.R")
source("https://raw.githubusercontent.com/jeksterslabds/jeksterslabRutils/master/R/util_os.R")
source("https://raw.githubusercontent.com/jeksterslabds/jeksterslabRterm/master/R/term_user_lib.R")
source("https://raw.githubusercontent.com/jeksterslabds/jeksterslabRterm/master/R/term_renviron.R")
dir <- Sys.getenv("HOME")
GITHUB_PAT <- "TODO"
if (dir == "/home/travis" | dir == "/Users/travis") {
  GITHUB_PAT <- Sys.getenv("GITHUB_PAT")  
}
#'
#+ user_lib
term_user_lib(
  libpath = NULL,
  dir = dir,
  overwrite = TRUE
)
#'
#+ renviron
term_renviron(
  dir = dir,
  overwrite = TRUE,
  GITHUB_PAT = GITHUB_PAT,
  libpath = NULL
)
#'
#' ## Install R Package Dependencies
#'
#+ r_packages
repos <- "https://cran.rstudio.org"
if (!require("devtools")) {
  install.packages(
    "devtools",
    repos = repos
  )
}
if (!require("styler")) {
  install.packages(
    "styler",
    repos = repos
  )
}
if (!require("rmarkdown")) {
  install.packages(
    "rmarkdown",
    repos = repos
  )
}
remotes::install_github(
  "jeksterslabds/jeksterslabRterm"
)
os <- jeksterslabRutils::util_os()
if (os == "osx" | os == "linux") {
  remotes::install_github(
    "jalvesaq/colorout"
  )
}
#'
#' ## Regenerate README.md
#'
#+ readme
rmarkdown::render("README.Rmd")
#' 
#' ## Install Terminal Tools
#'
#+ install_terminal_tools
library(jeksterslabRutils)
library(jeksterslabRterm)
os <- util_distro()
os
if (os == "osx") {
  packages <- c(
    "neofetch",
    "wget",
    "git",
    "hub",
    "bash-completion@2",
    "tmux",
    "macvim",
    "imagemagick",
    "poppler",
    "rustup"
  )
  term_install(
    packages = packages
  )
}
if (os == "arch linux") {
  packages <- c(
    "neofetch",
    "wget",
    "git",
    "hub",
    "bash-completion",
    "xterm",
    "tmux",
    "gvim",
    "imagemagick",
    "poppler",
    "rust",
    "cargo"
  )
  term_install(
    packages = packages
  )
}
if (os == "ubuntu") {
  packages <- c(
    "neofetch",
    "wget",
    "git-all",
    "hub",
    "bash-completion",
    "xterm",
    "tmux",
    "vim",
    "libmagick++-dev",
    "libpoppler-cpp-dev"
  )
  ppa <- c(
    "dawidd0811/neofetch",
    "cpick/hub",
    "cran/imagemagick",
    "cran/poppler"
  )
  term_install(
    packages = packages,
    ppa = ppa
  )
}
if (os == "windows") {
  packages <- c(
    "git",
    "wget",
    "hub",
    "vim",
    "imagemagick",
    "poppler"
  )
  term_install(
    packages = packages
  )
}
#'
#' ## Configs
#' 
#+ git
term_git_config(
  name = "Ivan Jacob Agaloos Pesigan",
  email = "learn.jeksterslab@gmail.com",
  editor = "vim",
  ignore = c(
    "*~",
    ".*.swp",
    ".DS_Store",
    ".~lock.*"
  ),
  msg = paste0(
    "Subject line (try to keep under 50 characters)",
    "\n\n",
    "Multi-line description of commit,",
    "\n",
    "feel free to be detailed.",
    "\n\n",
    "[Ticket: X]"
  ),
  global = TRUE,
  overwrite = TRUE
)
#'
#+ rprofile
term_rprofile(
  dir = dir,
  overwrite = TRUE
)
#'
#+ bash
term_bash(
  dir = dir,
  overwrite = TRUE,
  vars = c(GITHUB_PAT = GITHUB_PAT)
)
#'
#+ conda
term_conda(
  dir = dir,
  overwrite = TRUE,
  conda_path = NULL,
  auto_activate_base = FALSE
)
#'
#+ xterm
term_xterm(
  overwrite = TRUE,
  dark = TRUE
)
#'
#+ vim
term_vim(
  dir = dir,
  overwrite = TRUE,
  plugins = TRUE,
  dark = TRUE,
  colorscheme = "default"
)
