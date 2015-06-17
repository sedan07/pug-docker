FROM ubuntu:14.04

RUN apt-get update \
   && apt-get install wget vim -y \
   && wget https://apt.puppetlabs.com/puppetlabs-release-precise.deb \
   && apt-get update \
   && apt-get install puppet -y
