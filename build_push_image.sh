#!/bin/bash

docker build -t item-app:v1 .

docker image ls -a

docker tag item-app:v1 ghcr.io/footgraph/a433-microservicesapp:v1

echo $CR_PAT | docker login ghcr.io -u footgraph --password-stdin

docker push ghcr.io/footgraph/a433-microservices:v1

docker compose logs > log.txt

git add .
git commit -m "from build push image script"
git push