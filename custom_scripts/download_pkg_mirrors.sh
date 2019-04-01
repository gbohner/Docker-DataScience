#!/bin/bash

# This script downloads package mirrors for R (CRAN, Bioconductor), Python (PyPI) and Julia (Pkg)
# By default all are commented out (as they result in huge downloads)
# Uncomments the ones you wish to use

mkdir -p /mirrors/

# CRAN Mirror
# <UNCOMMENT ALL LINES BELOW TO DOWNLOAD>
# mkdir -p /mirrors/cran
# rsync -rtlzv --delete cran.r-project.org::CRAN /mirrors/cran

# Bioconductor Mirror
# <UNCOMMENT ALL LINES BELOW TO DOWNLOAD>
# mkdir -p /mirrors/bioconductor/packages/release
# rsync -zrtlv --delete master.bioconductor.org::release /mirrors/bioconductor/packages/release


# PyPI Mirror
# <UNCOMMENT ALL LINES BELOW TO DOWNLOAD>
# mkdir -p /mirrors/pypi


# Julia Pkg
# <UNCOMMENT ALL LINES BELOW TO DOWNLOAD>
# mkdir -p /mirrors/julia

