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