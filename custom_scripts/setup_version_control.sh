#!/bin/bash

# Create a "versioned" directory on the mounted /mnt/study-data
# dvc will handle large files within this

git init --shared=true /mnt/study-data/versioned/

# dvc init doesn't take a path argument, have to cd to the folder
cd /mnt/study-data/versioned
dvc init --verbose
