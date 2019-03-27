# Docker data science server for safe havens

This repository implements a single-machine, single-container docker data science setup for small collaborative teams, intended to run within a secure environment.

It's main aim is to provide a reasonably complete data science environment, that can be successfully used in a completely offline (data safe haven) environment.

As such, it pre-installs most potentially useful software tools.


## Services provided

The container concurrently runs two services, to which users can log into via a web browser running on either the host machine, or - often the case in safe haven setup - a web browser running on a gateway machine (with correct ssh tunneling set up for the required ports).

- RStudio Server running on port 8787
- Jupyterhub running on port 8000 (with Python and Julia kernels, providing Tensorflow and Keras access)

Both services provide interfaces for individual users, but also ensure that users (supposedly belonging to the same collaborating team) can access shared directories, that our mounted from the host machine (which often are themselves nfs network drives mounted *on* the host machine).

Collaboration tools provided are **git** for code version control and **dvc** for data version control. The ideal collaboration proceeds with users creating individual clones of the code, and commiting/pushing their significant edits to a shared root code repository. The data, however, is controlled by **dvc** via sym-links and a *dvc-cache* of all data files. This avoids any duplications but still ensure reproducibility of outputs that are based on intermediate results created by others, with other code versions.


## Setup

1. Edit the ```users.list``` file to match host machine user names (do **not** include host user with UID 1000)
2. Run the ```bash 

### User authentication

This docker container is expected to run on a Linux host machine (tested on CentOS 7.3 and Ubuntu 16.04 LTS).

As most data safe havens implement an existing and fixed user setup for the host machine itself, the data science container can simply use the same authentication setup already created.

In order to do that, edit the ```users.list``` file to match the user names existing on the host, and required within the container. The ```custom_scripts/update_auth``` script will be automatically ran on the container initialisation (via ```custom_scripts/custom_init``` initialisation script), and ensures that all users have correct access rights to all shared folders they may require to use.

If user accounts are not yet provided on the host machines, create them first on the host (via the ```useradd``` command).

One important issue is that the container has a fixed user occupying UID 1000, therefore the ```users.list``` file should NOT contain any user that has the UID 1000 on the host machine, as it WILL interfere with the correct operation of the container.
