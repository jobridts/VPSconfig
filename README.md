VPSconfig
=========

Getting started
---------------
### Installation ###
You will need [vagrant](https://www.vagrantup.com/) and something to run a virtual machine in. [Virtualbox](https://www.virtualbox.org) is the more popular option. But [VMware](https://www.vmware.com) should work (not tested).

To support windows we use the [ansible-local](https://github.com/jaugustin/vagrant-ansible-local) vagrant plugin. You can install it wiht `vagrant plugin install vagrant-ansible-local`.

Our vagrantfile supports [vagrant-cachier](http://fgrehm.viewdocs.io/vagrant-cachier). Which you may install with `vagrant plugin install vagrant-cachier`. This is a optional, but usefull if you do a lot of destroys or have multiple vagrant machines from the same box.

### First start ###
1. vagrant up


### After Editing ansible config ###
1. vagrant provision

Working with ansible
--------------------
### Ansible Galaxy ###
instead of doing `ansible galaxy install {{ name }},v{{ version }}` add it to ` to the `ansible/group_vars/controller`-file. The ansible playbook will install the roles on all the controller machines from the inventory (defined in `ansible/hosts`).

Working on AWS
---------------
(Warning:this will cost you money)

- make sure AWS_ACCESS_KEY_ID and AWS_SECRET_ACCESS_KEY are set (you can add a sript called setupenv.sh, it will not be tracked by git).
- run `ansible-playblook -i aws-provision provision.yml`
- run ansible-playblook -i ec2.py playbook.yml`