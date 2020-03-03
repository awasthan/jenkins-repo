FROM jenkins/jenkins:lts
USER root
RUN apt install docker-ce
RUN systemctl start docker
RUN systemctl enable docker
RUN chmod 777 /var/run/docker.sock
EXPOSE 8080
