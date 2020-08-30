# Penguin Dockerfile to expose a plumber service

FROM trestletech/plumber
MAINTAINER Kwangchun Lee <kwangchun.lee.7@gmail.com>

# install tidyverse dependancy
RUN apt-get update && apt-get install -y \
  libxml2-dev \
  libcairo2-dev \
  libsqlite-dev \
  libmariadbd-dev \
  libmariadbclient-dev \
  libpq-dev \
  libssh2-1-dev 
RUN apt-get install -y openssl  

# copy model and scoring script
RUN mkdir /data
COPY ../data/penguin_predictvie_model.rds /data
COPY ../penguin/api.R /data
WORKDIR /data

# plumb and run server
EXPOSE 8000
ENTRYPOINT ["R", "-e", \
    "pr <- plumber::plumb('/data/api.R'); pr$run(port=8000)"]
