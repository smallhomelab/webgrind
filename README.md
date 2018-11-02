# docker-webgrind

[Webgrind](https://github.com/jokkedk/webgrind) is a [Xdebug](http://www.xdebug.org)
profiling web frontend in PHP5. It implements a subset of the features of [kcachegrind](http://kcachegrind.sourceforge.net/cgi-bin/show.cgi).
This is a [docker](https://www.docker.io) image that eases setup.

[![](http://jokke.dk/media/2008-webgrind/webgrind_small.png)](http://jokke.dk/media/2008-webgrind/webgrind_large.png)

## Usage

This Dockerfile is php:7.1-apache version base on https://github.com/clue/docker-webgrind

The recommended way to run this container looks like this:

```bash
$ docker run -d -p 8080:80 -v [your xdebug profile files]:/tmp smallhomelab/webgrind
```

Or in docker-compose.yml

```
version: '3'

volumes:
    php_tmp:
      # host volume for xdebug profiling files

services:

  php:
    image: [your php container image]
    volumes:
        - php_tmp:/tmp

  webgrind:
    image: smallhomelab/webgrind
    ports:
      - "8080:80"
    volumes:
      # share xdebug profiler files with webgrind to be displayed
      - php_tmp:/tmp
```

This will start the webgrind container in a detached session in the background and will expose
its HTTP port. So you can now browse to:

http://localhost:8080/



