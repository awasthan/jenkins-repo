FROM jenkins/jenkins:lts
USER root
RUN apt-get update
RUN apt install apt-transport-https ca-certificates curl gnupg-agent
RUN apt-get install software-properties-common
RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
RUN add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"
RUN apt install docker-ce
RUN systemctl start docker
RUN systemctl enable docker
RUN chmod 777 /var/run/docker.sock
EXPOSE 8080
