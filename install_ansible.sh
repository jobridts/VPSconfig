#!/bin/bash

# try locating ansible
which ansible >/dev/null 2>/dev/null
# if we found ansible, exit status is 0.
if [ $? != 0 ]; then
	echo "Adding ansible ppa"
	apt-get -y install software-properties-common
	apt-add-repository -y ppa:ansible/ansible
	echo "Updating apt cache"
	apt-get update
	echo "Installing Ansible"
	apt-get install -y --no-install-recommends ansible
fi

# update the hosts file
cp /vagrant/ansible/hosts /etc/ansible/hosts