# dockerzookeeper
docker file for zookeeper 3.4.6

### Standalone mode:

`docker run -d --name zookeeper -p 2181:2181  duffqiu/zookeeper`

If you are running docker in CoreOS, you still need to map the port in virtualbox for the port 2181 in CoreOS. And then you can use the `zkCli.sh` to test the ZooKeeper

If you want to use your own config, just map your own config folder when run the container with `-v <your config folder>:/zookeeper/conf`


### Replicated mode:

- Get the config source from github:  `https://github.com/duffqiu/dockerzookeeper.git`

- Get the docker0 ip in the docker host. I use CoreOS as the host, run `ip addr` to check the docker0 ip. And the change all the configration file `zoo.cfg` under folder <1..3>/conf/. Modify the 172.17.42.1 to your own docker0 ip.

- Run node 1:

`docker run -d --name zoo1 --hostname zoo1 -p 2181:2181 -p 2888:2888 -p 3888:3888 -v /root/docker/zookeeper/mutiple/1/conf:/zookeeper/conf -v /root/docker/zookeeper/mutiple/1/data:/zookeeper/data  duffqiu/zookeeper`

- Run node 2:

`docker run -d --name zoo2 --hostname zoo2 -p 2182:2181 -p 2889:2888 -p 3889:3888 -v /root/docker/zookeeper/mutiple/2/conf:/zookeeper/conf -v /root/docker/zookeeper/mutiple/2/data:/zookeeper/data  duffqiu/zookeeper`

- Run node 3: 

`docker run -d --name zoo3 --hostname zoo3 -p 2183:2181 -p 2890:2888 -p 3890:3888 -v /root/docker/zookeeper/mutiple/3/conf:/zookeeper/conf -v /root/docker/zookeeper/mutiple/3/data:/zookeeper/data  duffqiu/zookeeper`

- Note: `/root/docker/zookeeper` is your working space in the docker host. please correct it to your own working space

- Note2: if you want to setup the zookeeper cluster across VMs, you need to change the ip 172.17.42.1 to the docker host ip. And you also need to add the port forwarding the VM settings.
