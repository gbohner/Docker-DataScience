#!/bin/bash

# Create a versioned directory on the mounted /mnt/study-data
# Folder name inferred from environment variable "PROJECT_NAME",
# that is a build argument set in Dockerfile.versiontools
# dvc will handle large files within this

umask 002

# Set up the git repo
git init --bare --shared=all /mnt/study-data/${PROJECT_NAME}_repo.git

# Create a "data remote" as well for git
mkdir -p /mnt/study-data/${PROJECT_NAME}_repo.dvc


# Set up a clone of the git repo, create the dvc within it, add the dvc remote, push to git, then delete the clone
# dvc init doesn't take a path argument, have to cd to the folder
git clone /mnt/study-data/${PROJECT_NAME}_repo.git /mnt/study-data/tmp_clone/tmp_setup
cd /mnt/study-data/tmp_clone/tmp_setup
dvc init --verbose
dvc remote add -d data_remote /mnt/study-data/${PROJECT_NAME}_repo.dvc
git add .dvc
git -c user.name=init_root -c user.email=init@project.com commit -m "Init repo, add dcv config"
git push
cd /mnt/study-data
rm -rf /mnt/study-data/tmp_clone

fix-permissions /mnt/study-data/${PROJECT_NAME}_repo.dvc
fix-permissions /mnt/study-data/${PROJECT_NAME}_repo.git


cd $HOME
