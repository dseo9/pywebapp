#!/bin/bash
$(aws ecr get-login --region us-west-2)
docker pull 732445306726.dkr.ecr.us-west-2.amazonaws.com/dseo9/pywebapp:latest || {
    echo "ERROR: docker pull failed. Sleeping for 10 minutes to allow investigation..."
    sleep 600
    exit 1
}
docker run --name pywebapp -p 80:8080 --detach 732445306726.dkr.ecr.us-west-2.amazonaws.com/dseo9/pywebapp:latest
