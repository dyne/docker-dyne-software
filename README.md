# Docker setups at Dyne.org

This repository contains various Dockerfile based setups to quickly
deploy and run...

[![software by Dyne.org](https://files.dyne.org/software_by_dyne.png)](http://www.dyne.org)

This repository is useful for building, while some ready-to-use images are made available on [Dyne.org's Docker Hub](https://hub.docker.com/u/dyne).

## Install Docker Community edition

One should follow [these instructions](https://docs.docker.com/install/linux/docker-ce/debian/) to install docker-ce.

Do not use docker shipped from your distribution, it is too old and buggy. To remove it do:

```sh
sudo apt-get remove docker docker-engine docker.io containerd runc
```

To add the correct Docker-CE on Devuan, simply run these commands:

```sh
sudo apt-get install apt-transport-https ca-certificates curl gnupg2 software-properties-common
echo "deb [arch=amd64] https://download.docker.com/linux/debian buster edge" | sudo tee /etc/apt/sources.list.d/docker.list
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli
```

