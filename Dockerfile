FROM jenkins/jenkins:lts
USER root
RUN apt-get -y update && apt-get -y upgrade
EXPOSE 8080
