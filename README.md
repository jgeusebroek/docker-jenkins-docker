[![](https://images.microbadger.com/badges/image/jgeusebroek/jenkins-docker.svg)](https://microbadger.com/images/jgeusebroek/jenkins-docker "Get your own image badge on microbadger.com")
# Docker Jenkins image with docker installed (docker-in-docker)

A image containing [alpine](https://github.com/gliderlabs/docker-alpine) Linux and [Jenkins](https://jenkins.io/) with docker installed.

## Usage

		Use JENKINS_UID to match a user on the docker host that has docker permissions.

		docker run -d --restart=always \
		  --name=jenkins \
		  -e JENKINS_UID=<UID with docker permissions>
		  -p 8080:8080 \
		  -p 50000:50000 \
		  -v /var/run/docker.sock:/var/run/docker.sock \
		  jgeusebroek/jenkins-docker

Read [documentation](https://github.com/jenkinsci/docker/blob/master/README.md) for usage.
