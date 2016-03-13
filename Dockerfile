FROM ubuntu
MAINTAINER Lena Brueder <oss@lena-brueder.de>
RUN apt-get update && apt-get install -y htop gnupg-agent scdaemon openssh-client
WORKDIR /opt/docker
ADD startup.sh startup.sh
CMD /opt/docker/startup.sh
