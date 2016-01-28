# Ansible in a Docker container, accessed via ssh.

FROM debian
MAINTAINER j842

ADD ["./assets/bin","/usr/local/bin/"]
ADD ["./assets/opt","/opt/dr"]

#CMD ["/usr/local/bin/simplesecrets"]
