#!/bin/bash
# Remove all stopped containers and delete unnamed images
docker rm $(docker ps -qa --no-trunc --filter "status=exited")

# remove all unused images
docker rmi $(docker images --filter "dangling=true" -q --no-trunc)
