FROM jenkins/jenkins:lts
USER root
RUN apt-get -y update && apt-get -y upgrade
RUN apt install software-properties-common
EXPOSE 8080
