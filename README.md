[![CircleCI](https://circleci.com/gh/WesleyCharlesBlake/Test101.svg?style=svg)](https://circleci.com/gh/WesleyCharlesBlake/Test101)

#### Auto deploying docker service


# Setup host with Ansible

```
cd ansible-docker 
ansible docker-host -i $PWD/hosts -m ping -u root
```
