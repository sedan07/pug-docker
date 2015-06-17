FROM ubuntu:14.04

RUN apt-get update \
   && apt-get install wget vim -y \
   && wget https://apt.puppetlabs.com/puppetlabs-release-stable.deb \
   && dpkg -i puppetlabs-release-stable.deb \
   && apt-get update \
   && apt-get install puppet -y
