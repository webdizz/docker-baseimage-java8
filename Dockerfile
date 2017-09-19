FROM phusion/baseimage:0.9.22

MAINTAINER Izzet Mustafaiev "izzet@mustafaiev.com"

# Set correct environment variables.
ENV  HOME /root
ENV  LANG en_US.UTF-8
ENV  LC_ALL en_US.UTF-8
ENV  DEBIAN_FRONTEND  noninteractive

# set sane locale
RUN locale-gen en_US.UTF-8

RUN apt-get -y update \
  && apt-get -y install software-properties-common python-software-properties \
  && add-apt-repository ppa:webupd8team/java \
  && apt-get -y update \
  && echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections \
  && apt-get -y install oracle-java8-installer \
  && apt-get clean \
  && update-alternatives --display java \
  && rm -rf /build \
  && rm -rf /tmp/* /var/tmp/* \
  && rm -rf /var/lib/apt/lists/* \
  && apt-get remove -y x11-common software-properties-common python-software-properties python3-software-properties

ENV JAVA_HOME /usr/lib/jvm/java-8-oracle
