FROM default-route-openshift-image-registry.apps.prod3.os.fyre.ibm.com/openshift/jenkins:latest
RUN yum install docker -y
RUN systemctl start docker
RUN systemctl enable docker
RUN chmod 777 /var/run/docker.sock
