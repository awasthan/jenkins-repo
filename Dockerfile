FROM jenkins/jenkins:lts
USER root
RUN apt-get -y update && apt-get -y upgrade
RUN apt -y install apt-transport-https ca-certificates curl software-properties-common
RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
RUN add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"
RUN apt -y update
RUN apt -y install docker-ce
RUN systemctl start docker
RUN systemctl enable docker
EXPOSE 8080
