FROM php:7.1-apache

RUN DEBIAN_FRONTEND=noninteractive apt-get update && apt-get install -y \
  graphviz python \
  git

RUN apt-get clean \
    && rm -r /var/lib/apt/lists/* \
    && rm -rf /tmp/pear

# install webgrind from git
RUN git clone https://github.com/jokkedk/webgrind /usr/src/webgrind
RUN cp -rP /usr/src/webgrind/. /var/www/html
RUN chown www-data:www-data -R /var/www/html
RUN rm -rf /usr/src/webgrind

# expose apache HTTP port
EXPOSE 80

# expose default directory where we look for cachegrind files
VOLUME /tmp


