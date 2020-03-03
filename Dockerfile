FROM jenkins/jenkins:lts
USER root
RUN apt update -y
RUN apt install apt-transport-https ca-certificates curl gnupg-agent software-properties-common
RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
RUN add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
RUN apt install docker-ce
RUN systemctl start docker
RUN systemctl enable docker
RUN chmod 777 /var/run/docker.sock
EXPOSE 8080
