FROM centos
# Pulling centos image

RUN yum install yum install https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm -y
# Importing epel-release rpm package

RUN yum update -y && \
    yum install ansible docker curl which -y
# Installing ansible and other packages
RUN systemctl enable --now docker

