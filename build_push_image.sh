#!/bin/bash

docker build -t ghcr.io/footgraph/a433-microservices-submission-item-app:latest .

docker image ls -a

docker tag a433-microservices-submission-item-app:latest footgraph/a433-microservices-submission-item-app:v1

echo $CR_PAT | docker login ghcr.io -u USERNAME --password-stdin

docker push ghcr.io/footgraph/a433-microservices-submission-item-app:v1

docker compose logs > log.txt

git add .
git commit -m "from build push image script"
git push