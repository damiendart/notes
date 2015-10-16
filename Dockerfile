# This file was written by Damien Dart, <damiendart@pobox.com>. This is
# free and unencumbered software released into the public domain. For
# more information, please refer to the accompanying "UNLICENCE" file.

FROM ubuntu:latest
MAINTAINER Damien Dart <damiendart@pobox.com>
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update
RUN apt-get -y upgrade
# The "zlib1g-dev" package is requires to build Nokogiri.
# TODO: Double check if "zlib1g-dev" is most appropriate package.
RUN apt-get -y install build-essential git ruby-full zlib1g-dev
RUN gem install bundler --no-rdoc --no-ri
WORKDIR /tmp
ADD Gemfile Gemfile
RUN bundle install --system
VOLUME /notes
WORKDIR /notes
CMD rake
