FROM rocker/rstudio:latest

COPY docker/install_rethinking.R /tmp/install_rethinking.R
RUN Rscript /tmp/install_rethinking.R
RUN rm /tmp/install_rethinking.R

# RUN install2.r --error \
#     cmdstanr \
#     rethinking \
#     tidyverse \
#     ggplot2 \
#     ggthemes \
#     ggpubr \
#     ggtext \
#     ggsci \
#     ggthemes
    