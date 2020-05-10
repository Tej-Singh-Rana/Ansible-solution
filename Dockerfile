FROM centos
# Pulling centos image

USER root
# Importing epel-release rpm package
RUN dnf install epel-release -y

# Installing docker packages, facing issues in centos 8 
RUN dnf install 'dnf-command(config-manager)' -y && \
    dnf config-manager --add-repo=https://download.docker.com/linux/centos/docker-ce.repo && \
    dnf install docker-ce --nobest -y && \
    dnf install https://download.docker.com/linux/centos/7/x86_64/stable/Packages/containerd.io-1.2.10-3.2.el7.x86_64.rpm -y && \
    dnf install docker-ce -y
 
# Installing ansible
RUN yum clean all && \
    yum install ansible -y 

RUN sleep 2

# Path of container
WORKDIR /root/

# Copying configuration file in container
COPY . .

COPY ansible-playbook.yml /etc/ansible/

# Making executable
RUN chmod +x docker-loop.sh

# Assigning task to perform in run time container
ENTRYPOINT ["ansible-playbook"]

#
CMD ["/etc/ansible/ansible-playbook.yml"]


