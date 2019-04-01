#!/bin/bash
docker run -it \
	-v /etc:/tmp/user_auth \
	-v /ds_tmp:/mnt/study-data \
	-e PASSWORD=pass \
	-p 8787:8787 \
	-p 8000:8000 \
	safehaven_ds:test_versioncontrol \
	/custom_init
