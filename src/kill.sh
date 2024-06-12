#!/usr/bin/env bash
docker cp ros_container:/data/ "${BASEDIR}/../"
docker kill ros_container