#!/bin/bash
# Build all stages successively, and also save build log to file for examination later
docker build -t safehaven_ds:stage1 -f Dockerfile.stage1 . 2>&1 | tee build.log
docker build -t safehaven_ds:stage2 -f Dockerfile.stage2 . 2>&1 | tee -a build.log
docker build -t safehaven_ds:stage3 -f Dockerfile.fullpython . 2>&1 | tee -a build.log
docker build -t safehaven_ds:stage4 -f Dockerfile.addtensorflow . 2>&1 | tee -a build.log
docker build -t safehaven_ds:stage5 -f Dockerfile.addjulia . 2>&1 | tee -a build.log
docker build -t safehaven_ds:test_user_auth -f Dockerfile.createusers . 2>&1 | tee -a build.log
docker build -t safehaven_ds:test_versioncontrol -f Dockerfile.versiontools . 2>&1 | tee -a build.log



