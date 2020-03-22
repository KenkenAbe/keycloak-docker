FROM jboss/keycloak

WORKDIR /opt/jboss/keycloak/standalone
ADD cert.pem /usr/share/pki/ca-trust-source/anchors/cert.pem
USER root
RUN keytool -import -noprompt -alias selfsigned -cacerts -file /usr/share/pki/ca-trust-source/anchors/cert.pem  -storepass changeit