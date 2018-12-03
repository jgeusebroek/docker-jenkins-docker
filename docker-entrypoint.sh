#!/usr/bin/env bash

DOCKER_SOCKET=/var/run/docker.sock
DOCKER_GROUP=docker

if [ -S ${DOCKER_SOCKET} ]; then

    userdel jenkins
    adduser -h /var/jenkins_home -s /bin/bash -u ${JENKINS_UID} -g 'Jenkins User' -D jenkins

    # Get group id for the docker socket
    DOCKER_GID=$(stat -c '%g' ${DOCKER_SOCKET})

    # Delete current docker group
    groupdel docker

    # Recreate docker group to match the docker socket group
    groupadd -for -g ${DOCKER_GID} ${DOCKER_GROUP}

    # Add Jenkins user to the docker group
    usermod -aG ${DOCKER_GROUP} jenkins
fi

su-exec ${JENKINS_UID} /usr/local/bin/jenkins.sh
