FROM jenkins/jenkins:lts-alpine
MAINTAINER Jeroen Geusebroek <me@jeroengeusebroek.nl>

USER root
ENV JENKINS_UID=1000

RUN apk add --no-cache docker shadow su-exec

COPY docker-entrypoint.sh /
ENTRYPOINT ["/sbin/tini", "--", "/docker-entrypoint.sh"]
