ARG BASE_IMAGE=default-route-openshift-image-registry.apps.prod3.os.fyre.ibm.com/ace/ibm-ace-mqclient-server-prod:11.0.0.7-r1-amd64
FROM $BASE_IMAGE 
ENV LICENSE accept
FROM jenkins/jenkins:latest

# install jenkins plugins
COPY ./jenkins-plugin /usr/share/jenkins/plugins
RUN while read i ; \ 
		do /usr/local/bin/install-plugins.sh $i ; \
	done < /usr/share/jenkins/plugins

ENV JENKINS_USER admin
ENV JENKINS_PASS admin

# allows to skip Jenkins setup wizard
ENV JAVA_OPTS -Djenkins.install.runSetupWizard=false

# Jenkins runs all grovy files from init.groovy.d dir
# use this for creating default admin user
COPY default-user.groovy /usr/share/jenkins/ref/init.groovy.d/
COPY executors.groovy /usr/share/jenkins/ref/init.groovy.d/

# volume for Jenkins settings
VOLUME /var/jenkins_home
EXPOSE 8080
