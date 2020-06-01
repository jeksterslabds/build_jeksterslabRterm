#' ---
#' title: "Setup Terminal Tools for R Scripting"
#' author: "Ivan Jacob Agaloos Pesigan"
#' date: "`r Sys.Date()`"
#' output:
#'   rmarkdown::github_document:
#'     toc: true
#' ---
#'
#+ setup
source("https://raw.githubusercontent.com/jeksterslabds/jeksterslabRutils/master/R/util_txt2file.R")
source("https://raw.githubusercontent.com/jeksterslabds/jeksterslabRutils/master/R/util_os.R")
source("https://raw.githubusercontent.com/jeksterslabds/jeksterslabRterm/master/R/term_user_lib.R")
source("https://raw.githubusercontent.com/jeksterslabds/jeksterslabRterm/master/R/term_renviron.R")
dir <- Sys.getenv("HOME")
#GITHUB_PAT <- TODO
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
#+ library
library(jeksterslabRterm)
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
#'
#+ install_terminal_tools
os <- jeksterslabRutils::util_distro()
os
if (os == "osx") {
  packages <- c(
    "neofetch",
    "wget",
    "git",
    "bash-completion@2",
    "tmux",
    "macvim",
    "imagemagick",
    "poppler",
    "rustup"
  )
  jeksterslabRterm::term_install(
    packages = packages
  )
}
if (os == "arch linux") {
  packages <- c(
    "neofetch",
    "wget",
    "git",
    "bash-completion",
    "xterm",
    "tmux",
    "gvim",
    "imagemagick",
    "poppler",
    "rust",
    "cargo"
  )
  jeksterslabRterm::term_install(
    packages = packages
  )
}
