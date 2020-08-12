# nifi-cluster

### ZooKeeper Configuration

included myid file in data directory with 1,2,3 values consecutively.





### Sample Docker Commands

#### connect to container shell
`docker exec -it nifi-node1 /bin/bash`

#### build from docker file
`docker build -t nifi-node1 -f nifi-node1.dockerfile .`

#### run container
`docker run -d --name nifi-node1 nifi-node1`

`docker run -i -t --add-host nifi-node1:10.91.100.91 nifi-node1`

#### remove all containers
`docker container prune`

#### docker compose build
`docker-compose build`

#### docker compose run
`docker-compose run --use-aliases nifi-node1`

#### docker compose up
`docker-compose up`
`docker-compose up -d`
`docker-compose up --build`

#### attach to a container 
`docker attach nifi-node1`


#### docker remove dangling images 
FOR /f "tokens=*" %i IN ('docker images -q -f "dangling=true"') DO docker rmi %i

#### docker remove dangling containers
FOR /f "tokens=*" %i IN ('docker ps -a -q') DO docker rm %i