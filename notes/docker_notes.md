# Docker Cheat Sheet
### List all images
```bash
docker images
```
### Show active containers
docker ps
- Show 
~ docker ps

### Show all containers
~ docker ps -a

### Remove an image
~ docker ps -a
~ docker rm <all containers referencing the image>
~ docker rmi <image>

### Push an image to remote
```bash
# 1: Export username
export DOCKER_ID_USER="haraldlons"
# 2: Login
docker login
# 3: Tag your image
docker tag my_image $DOCKER_ID_USER/my_image
# 4: Push to Docker Hub
docker push $DOCKER_ID_USER/my_image
```

### Fancy docker building with your ssh-keys
```bash
docker build -t example --build-arg ssh_prv_key="$(cat ~/.ssh/id_rsa)" --build-arg ssh_pub_key="$(cat ~/.ssh/id_rsa.pub)" --squash .
```

# Notes
~docker-compose -f ~/hello_world/docker-compose.test.yml -p ci build
-f -> spesifiserer hvor docker-compose filen ligger
-p -> indicate specific project name
~ docker logs -f ci_sut_1
Check output of sut container


# Spørsmål om Docker:

Har man et eget file-system i image'et?
Så når du sier WORKDIR /catkin_ws, så er dette i IMAGE, og ikke lokalt på din host.
2
Og run source /opt...
	Da kjører du denne kommandoen på host
3
Hvorfor må du kjøre entry script fra root?
4
Siden du 'arver' fra ros:kinetic-ros-core, så får du også filsystemet som er i den image?
Så derfor finnes allerede /opt/ros/kinetic, siden dette ble laget i det forrige image?
5
ENTRYPOINT? Hva er det igjen?
6
Hvorfor har du laget denne dockerfile INNI beginner tutorials? Og ikke lagt det i catkin_ws bare?
7
Når du kjører kommandoer som copy, kjører du dem da relativt til hvor workdir er?
Eks:
RUN mv src/begi... /
'src' mappen er jo i catkin_ws, og ikke relativt til hvor dockerfilen er?
7.5
COPY . src/beginner_tutorials
Så er '.' relativt til dockerfile, mens 'src/beginner_tutorials' i relativt til workspace?



# Docker Compose
? Hva er build context?
? Når skal man bruke build context?
? It links to the web container so the application container's IP address is accessible to our test.sh script.
	SÅ man kan kommunisere med den containeren?
1
version '3'
dette sier hvilken versjon av docker compose du bruker?
På en måte hvilket 'språk' du snakker?
2
Hver service kan du kalle hva du vil? 
Det har egentlig ikke noe å si hva du kaller den?
3
For hver container du starter, så må du definere HELE environmet? 
4
Så du kan ha Ros i en container, og en apache server i en annen container, og de kan være bygget på ulike OS til og med?
5
    # The name of the container that is created. This is important to set, otherwise it will be dynamically allocated and might not match the "ROS_HOSTNAME" variable
Dette skjønte jeg ikke.
6
# This url must match the name of the master service.
      - "ROS_MASTER_URI=http://master:11311"
master er i 'docker-nettverket?'



7
Kjøre launch-filer? Er det noe problem?
8
Nå lagde du en Dockerfile for EN pakke.
Kan du ha en Dockerfile for MANGE pakker?

9
Når kjører entryscript?
10
Gracefully stopping... (press Ctrl+C again to force)
Stopping listener ... done
Stopping talker   ... done
Stopping master   ... done

Hvor har denne koden blitt laget?

11
 # The command just tells which command should be running in the container
    command:
      - roscore
Denne kommandoen, er det bash, eller

12
Jeg kan gjøre mange endringer i docker-compose uten at det får konsekvenser. Hvorfor det?
Så lenge jeg beholder :       - "ROS_MASTER_URI=http://master:11311"
...går det bra.

13
talker_1    | [ INFO] [1528380260.624301343]: hello world 72

talker_1, er det container-navnet?

14
La oss si at jeg ønsker ros-kinetic på ubuntu, men jeg ønsker å installere noen nye pakker med apt-get. Og så ønsker jeg å lagre dette bildet siden det tar lang tid å installere disse nye pakkene. Kan jeg gjøre det?
Så jeg kan lage mange versjoner med mange ulike pakker installert. 

