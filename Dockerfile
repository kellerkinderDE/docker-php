FROM edbizarro/gitlab-ci-pipeline-php:7.3

MAINTAINER Uwe Kleinmann <u.kleinmann@kellerkinder.de>

ENV IMAGE_USER=php

USER root

WORKDIR /tmp

RUN apt-get update -yqq \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
    re2c \
    && rm -rf /var/lib/apt/lists/* /var/cache/apt/*

RUN pecl install mailparse && \
    docker-php-ext-enable mailparse

USER $IMAGE_USER

WORKDIR /var/www/html
