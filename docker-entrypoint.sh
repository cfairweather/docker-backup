#!/bin/sh

#Get all mounts attached to this container
MOUNTS=`docker inspect -f '{{ range .Mounts}}{{.Destination}} {{end}}' backup`
echo "Found the following mounts: $MOUNTS"

#Create backup tar in root
tar pcfz /backup.tar.gz $MOUNTS

# Create tag from Epoch
TAG=`date +%s`

docker commit -m "Creating backup of $IMAGE_NAME with tag $TAG" -a "docker-compose-backup" backup $IMAGE_NAME:$TAG
echo "Creating backup of $IMAGE_NAME with tag $TAG"