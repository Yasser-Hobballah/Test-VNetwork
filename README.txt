## To run all containers
docker-compose up
## To stop all containers without removing them
docker-compose stop
## To start all containers after stopping them
docker-compose start
## To remove stopped containers
docker-compose rm
## To stop and remove all containers
docker-compose rm -s
## To enter a container
docker exec -it <Container_name> /bin/sh