FROM jenkins/jenkins:lts
USER root
RUN apt-get -y update
EXPOSE 8080
