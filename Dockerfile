FROM	ubuntu:16.04

# For Ansible v2, from https://docs.ansible.com/ansible/intro_installation.html#latest-releases-via-apt-debian

RUN apt-get update \
&& apt-get install software-properties-common -y \
&& apt-add-repository ppa:ansible/ansible \
&& apt-get update \
&& apt-get install -y \
    gnupg \
    git \
    python-pip \
    openssh-client \
    python-dev \
    ruby \
    curl \
    ansible

ENV	HOME	/root
RUN	ssh-keygen -f /root/.ssh/id_rsa -q -N "" \
	&& pip install markupsafe dopy boto linode-python pyrax apache-libcloud>=1.5.0

WORKDIR	/root

RUN	git clone https://github.com/jlund/streisand.git

WORKDIR	/root/streisand

CMD	["./streisand"]
