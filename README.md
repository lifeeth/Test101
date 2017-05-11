[![CircleCI](https://circleci.com/gh/WesleyCharlesBlake/Test101.svg?style=svg)](https://circleci.com/gh/WesleyCharlesBlake/Test101)

#### Auto deploying docker service


## Setup host with Ansible

```
cd ansible-docker 
ansible-playbook docker-install.yml -i $PWD/hosts -u root
```

This is a simple Continous Delivery Example, utilising [Circle CI](https://circleci.com) and [Docker](https://www.docker.com/).

Circle CI will run builds on Each commit, but only deploy when merges to master.

It will tag all images it builds successfully to a docker registry, and on master, it will tag the image as latest. The deploy step will then run and deploy to a remote host. 

### Notes

- Docker services are created and deployed with Swarm. This allowed me to perform rolling updates and have some control over events that could occur (ie roll back on failures etc)
- ansible is used to bootstrap the host and create a swarm cluster
- This pushes an images to Dockerhub

### TODO:
- [ ] bootstrap worker nodes for the swarm cluster
- [ ] Unit tests on the nodejs container
- [ ] Parametize the deploy.sh script, so we can pass in env vars dynamically (right now it is rather static)
- [ ] Test coverage and reporting
- [ ] Store circleci artifacts
- [ ] Ability to roll back to specific tags
- [ ] deploy to dev/stage/uat/qa/pa hosts on all branches that are not master
 
