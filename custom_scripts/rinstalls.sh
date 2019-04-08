#!/bin/bash

# Install tensorflow and keras into virtualenv

# First install pip to system python, then virtualenv via that pip

apt-get update && apt-get install -y curl
fix-permissions /usr/local/lib
fix-permissions /usr/local/bin
curl "https://bootstrap.pypa.io/get-pip.py" | /usr/bin/python
/usr/local/bin/pip install virtualenv
fix-permissions /usr/local/lib
fix-permissions /usr/local/bin


# Now that virtualenv is installed, run in R
Rscript /src/rscripts/install_keras.r 


# TODO move virtualenv to a place accessible to all R users and point keras to it.


# Install java for h2o
apt-get install -y default-jdk
Rscript /src/rscripts/install_h2o.r

