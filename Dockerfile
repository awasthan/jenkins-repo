FROM default-route-openshift-image-registry.apps.prod3.os.fyre.ibm.com/openshift/jenkins:latest
USER root
RUN yum install docker -y
RUN systemctl start docker
RUN systemctl enable docker
RUN chmod 777 /var/run/docker.sock
EXPOSE 8080
