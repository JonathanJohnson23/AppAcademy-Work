
Notes from Container Fun:
docker container run --name nginx -p 80:80 -d nginx
# run one container with the nginx image
docker container run --name httpd -p 81:80 -d httpd
# run one container
docker container run --name mysql -p 3306:3306 -e MYSQL_ROOT_PASSWORD=waanao mysql
# run one container with an environment using sql
# password is waanao
PHASE A:
docker container run -it --name web nginx bash
# starting a container and enter the container/interact with shell
# web is the name
# nginx is the image
# bash is the argument being passed to the image
docker container start <containerName>
# restart your container in the background
docker container exec -it <containerName> bash
# enter an existing container's bash
PHASE B:
docker container run -it --name notliketheother ubuntu bash
# create a new shell using ubuntu image
PHASE 2
docker container run -it --name quotes -p 82:80 -d alpine
# create a container named quotes, with alpine image, and jump into bash
# must use -it to be able to enter container
docker container exec -it <containerName> <directoryCommand>
# enter a container using it's specified directory command (find in container ls)
PHASE 3
docker network ls
# list all networks
--net-alias
# add network-scoped alias for the container
docker network create myNetwork
# create a new network named myNetwork
docker container run -d --net myNetwork --net-alias myNet elasticsearch:2
docker container run -detached --net <createdNetworkName> --net-alias <newNetworkAltName> <imageName>
# create a container with the elasticsearch image
# -d => detached to run the container in the background
# elasticsearch:2 is a popular image
will auto-generate name if needed (jolly_lamarr, compassionate_keldysh)
docker container run --net myNetwork alpine nslookup myNet
# create a container that does something......
docker container run -d --net myNetwork centos curl -s myNet:9200
# create a container that will act as the balancer
PART A: BIND MOUNTS
docker run -d \
 -it \
 --name bindMountTest\
 --mount type=bind,source=/Users/kyle/Desktop/dockerDB,target=/readme.md\
 nginx:latest
# create a container with a bind mount to the indicated directory
# container name is bindMountTest
# options must be separated by commas
# the last file in src is parent folder
# the target is the file within
echo "hello world" >> readme.md
# add text to readme file within current directory
rm readme.md
# removes entire file
PART B: Volumes
docker volume create myVolume (volumeName)
# create a volume with a file name myVolume
docker container run -d --name myNewImage -v myVolume:/var/lib/postgresql/data postgres:9.6.1
# create a detach container with a new image (myNewImage), sourced to existing volume named myVolume, at indicated Docker Hub path, with Postgres 9.6.1
docker container exec -it myNewImage psql -U userName
# enter into the volume within myNewImage (image), in a postgres environment as the user 'userName'
# default user of Postgres Database is 'postgres'
docker container run -d --name finalContainer -v myVolume:/var/lib/postgresql/data postgres:9.6.2
# create another container connected to previously made volume
docker container exec -it finalContainer psql -U postgres
# enter the container's psql as default user ('postgres' at the end there)
docker rm -f $(docker ps -aq)
# delete all running and stopped containers
docker volume prune
# delete all volumes not used by a container