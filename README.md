# nifi-cluster

### ZooKeeper Configuration

included myid file in data directory with 1,2,3 values consecutively.


### Nifi Configuration Properties

- nifi.database.directory=/nifi_data/database_repository
- nifi.flowfile.repository.directory=/nifi_data/flowfile_repository
- nifi.content.repository.directory.default=/nifi_data/content_repository
- nifi.provenance.repository.directory.default=/nifi_data/provenance_repository
- nifi.nar.library.autoload.directory=/nifi_data/extensions
- nifi.web.http.host - 
- nifi.cluster.is.node - Set this to true.
- nifi.cluster.node.address - Set this to the fully qualified hostname of the node. If left blank, it defaults to localhost.

- nifi.state.management.embedded.zookeeper.start=false
- nifi.state.management.embedded.zookeeper.properties=./conf/zookeeper.properties

- nifi.cluster.node.protocol.port - Set this to an open port that is higher than 1024 (anything lower requires root).

- nifi.cluster.node.protocol.threads - The number of threads that should be used to communicate with other nodes in the cluster. This property defaults to 10. A thread pool is used for replicating requests to all nodes, and the thread pool will never have fewer than this number of threads. It will grow as needed up to the maximum value set by the nifi.cluster.node.protocol.max.threads property.

- nifi.cluster.node.protocol.max.threads - The maximum number of threads that should be used to communicate with other nodes in the cluster. This property defaults to 50. A thread pool is used for replication requests to all nodes, and the thread pool will have a "core" size that is configured by the nifi.cluster.node.protocol.threads property. However, if necessary, the thread pool will increase the number of active threads to the limit set by this property.

- nifi.zookeeper.connect.string - The Connect String that is needed to connect to Apache ZooKeeper. This is a comma-separated list of hostname:port pairs. For example, localhost:2181,localhost:2182,localhost:2183. This should contain a list of all ZooKeeper instances in the ZooKeeper quorum.

- nifi.zookeeper.root.node - The root ZNode that should be used in ZooKeeper. ZooKeeper provides a directory-like structure for storing data. Each 'directory' in this structure is referred to as a ZNode. This denotes the root ZNode, or 'directory', that should be used for storing data. The default value is /root. This is important to set correctly, as which cluster the NiFi instance attempts to join is determined by which ZooKeeper instance it connects to and the ZooKeeper Root Node that is specified.

- nifi.cluster.flow.election.max.wait.time - Specifies the amount of time to wait before electing a Flow as the "correct" Flow. If the number of Nodes that have voted is equal to the number specified by the nifi.cluster.flow.election.max.candidates property, the cluster will not wait this long. The default value is 5 mins. Note that the time starts as soon as the first vote is cast.

- nifi.cluster.flow.election.max.candidates - Specifies the number of Nodes required in the cluster to cause early election of Flows. This allows the Nodes in the cluster to avoid having to wait a long time before starting processing if we reach at least this number of nodes in the cluster.



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