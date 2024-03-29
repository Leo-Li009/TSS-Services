#!/bin/bash

SERVICE_IMAGE_NAME=tss-service-image
SERVICE_IMAGE_TAG=version0.1
SERVICE_CONTAINER=tss-service-container
SERVICE_PORT=8222

docker kill $SERVICE_CONTAINER
docker rm $SERVICE_CONTAINER

docker build . -t $SERVICE_IMAGE_NAME:$SERVICE_IMAGE_TAG

docker run --network="host" -d -p $SERVICE_PORT:$SERVICE_PORT --name $SERVICE_CONTAINER $SERVICE_IMAGE_NAME:$SERVICE_IMAGE_TAG 
