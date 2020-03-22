#FROM tomcat:8.5.53

#WORKDIR /usr/local/tomcat/conf
#ADD tomcat-config/server.xml server.xml
#ADD AM-eval-6.5.2.3.war /usr/local/tomcat/webapps/openam/openam.war

#WORKDIR //usr/local/tomcat/webapps/openam
#RUN jar xvf /usr/local/tomcat/webapps/openam/openam.war

FROM jboss/keycloak

WORKDIR /opt/jboss/keycloak/standalone
ADD cert.pem /usr/share/pki/ca-trust-source/anchors/cert.pem
USER root
RUN keytool -import -noprompt -alias selfsigned -cacerts -file /usr/share/pki/ca-trust-source/anchors/cert.pem  -storepass changeit