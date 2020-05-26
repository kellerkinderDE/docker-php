FROM edbizarro/gitlab-ci-pipeline-php:7.3

MAINTAINER Uwe Kleinmann <u.kleinmann@kellerkinder.de>

USER root

RUN apt-get update -yqq \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
    re2c \
    && rm -rf /var/lib/apt/lists/* /var/cache/apt/*

RUN pecl install mailparse && \
    docker-php-ext-enable mailparse
