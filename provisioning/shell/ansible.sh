#!/bin/bash

echo 'Installing base packages for ansible'
export DEBIAN_FRONTEND=noninteractive
export PYTHONWARNINGS=ignore
export PYTHONUNBUFFERED=1
export ANSIBLE_FORCE_COLOR=true

# Fix problem with ansible docker module - https://github.com/ansible/ansible/issues/20380#issuecomment-273462845.
pip list | grep -i docker | grep -v pip | awk '{print $1}' | while read i; do sudo pip uninstall -y "$i"; done

# ansible needs python version 2.7.9 to avoid SNIMissingWarning.
# see http://urllib3.readthedocs.io/en/latest/security.html#snimissingwarning
apt-get -y --force-yes install python 2.7.9
apt-get -y --force-yes install python-dev python-simplejson sudo curl make rsync git libmysqlclient-dev apparmor-utils >/dev/null

# because basic ubuntu is too stripped down we need to add logging.
apt-get --reinstall install -y --force-yes bsdutils >/dev/null

# needed to use apt-add-repository.
apt-get -y --force-yes install software-properties-common python-software-properties >/dev/null

echo 'Finished installing base packages for ansible'

echo 'Installing ansible'

echo "Installing pip via easy_install."
sudo apt-get -y --force-yes install unzip python-pip python-dev build-essential libffi-dev libssl-dev

sudo PYTHONWARNINGS=ignore pip install --upgrade pip
sudo PYTHONWARNINGS=ignore pip install --upgrade virtualenv
sudo PYTHONWARNINGS=ignore pip install --upgrade pip
sudo PYTHONWARNINGS=ignore pip install --upgrade cffi
sudo PYTHONWARNINGS=ignore pip install --upgrade cryptography
# Make sure setuptools are installed correctly.
pip install setuptools --no-use-wheel --upgrade

echo "Installing required python modules."
pip install paramiko pyyaml jinja2 markupsafe MySQL-python

echo "Installing Ansible."
pip install ansible==1.9.4

echo 'Finished installing ansible'
