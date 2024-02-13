FROM quay.io/ukhomeofficedigital/aws-alpine-jdk17:v17.0.10
ENV SONAR_SCANNER_VER=4.8.1.3023
ENV SONAR_SCANNER_OPTS="-Xmx512m -Dsonar.host.url=https://sonarqube.testing.acp.homeoffice.gov.uk/"
ENV PATH=/opt/sonar-scanner-${SONAR_SCANNER_VER}/bin:${PATH}

ENV  LANG en_US.UTF-8
ENV  LANGUAGE en_US.UTF-8
ENV  LC_ALL en_US.UTF-8

# Install necessary packages
RUN apk add --no-cache wget curl git python3 py3-pip ansible-lint gcompat

#Install sonar-scanner
RUN wget -O /tmp/sonar-scanner-cli-${SONAR_SCANNER_VER}.zip \
    https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-${SONAR_SCANNER_VER}.zip && \
    unzip /tmp/sonar-scanner-cli-${SONAR_SCANNER_VER}.zip -d /opt/ && \
    rm -rf /tmp/sonar-scanner-cli-${SONAR_SCANNER_VER}.zip
ENTRYPOINT ["sonar-scanner"]

