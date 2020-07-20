# Telco Dockerfile to expose a plumber service

FROM rocker/tidyverse
MAINTAINER Kwangchun Lee <kwangchun.lee.7@gmail.com>

# install the plumber package
RUN R -e 'install.packages(c("plumber"))'

# copy model and scoring script
RUN mkdir /data
COPY deploy_glm.rds /data
COPY telco.R /data
WORKDIR /data

# plumb and run server
EXPOSE 8000
ENTRYPOINT ["R", "-e", \
    "pr <- plumber::plumb('/data/telco.R'); pr$run(port=8000)"]
   