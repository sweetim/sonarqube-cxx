FROM alpine as builder

RUN apk add --no-cache curl

WORKDIR /usr/timx/plugins

RUN curl -OL https://github.com/SonarOpenCommunity/sonar-cxx/releases/download/cxx-0.9.8/sonar-cxx-plugin-0.9.8.jar \
    && curl -OL https://github.com/mibexsoftware/sonar-bitbucket-plugin/releases/download/v1.2.1/sonar-bitbucket-plugin-1.2.1.jar

FROM sonarqube

LABEL maintainer="hosweetim@gmail.com"
LABEL sonar-cxx-version="0.9.8"
LABEL sonar-bitbucket="v1.2.1"
LABEL description="Sonarqube integration with sonar-cxx and bitbucket plugins"

COPY --from=builder /usr/timx/plugins /opt/sonarqube/extensions/plugins
