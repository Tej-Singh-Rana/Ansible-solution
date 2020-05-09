FROM centos
# Pulling centos image

USER root
RUN yum install https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm -y
# Importing epel-release rpm package
COPY centos.repo /etc/yum.repos.d/
 
RUN yum clean all && \
    yum install ansible -y 
RUN sleep 2
RUN yum install docker -y

COPY . /root/
# Installing ansible and other packages
RUN systemctl enable --now docker

ENTRYPOINT ["/bin/sh","-c","/root/docker-loop.sh"]
