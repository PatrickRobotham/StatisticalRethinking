install.packages(c("coda","mvtnorm","devtools","loo","dagitty","shape"))
install.packages("cmdstanr", repos = c('https://stan-dev.r-universe.dev', getOption("repos")))
cmdstanr::install_cmdstan()
devtools::install_github("rmcelreath/rethinking")