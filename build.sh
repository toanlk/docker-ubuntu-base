clear

docker build -t docker-ubuntu-base .

docker tag docker-ubuntu-base toanlk/docker-ubuntu-base:latest
docker push toanlk/docker-ubuntu-base:latest