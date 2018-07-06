# Tricks and tips for work on R18DV

## If Lidar is not connected

## Check USB-connections
```bash
dmesg --follow
```

## Start CAN
Use alias 
```bash
can2setup
```
Also check that PCAN is connected correctly

## Start rosbag with autonomous check
```bash
# 1)  
ac
# 2) 
rosbag play <bagname> --clock
# 3) Start Rviz on PX 
rviz
# 4) Start visualization nodes on PX
viz 
```

## Passwords
### Github User

Username: revolvedriverless
Password: Driverless2018

### RevolveDV Router wifi-password
Username: RevolveDV
Password: RevolveDV

### RevolveDV Router Admin password
IP: http://10.19.1.1
username: admin
password: admin



Nappe ut alt på CAN-nettverket.

Problem med node som gjør om point-cload 


VNCViewer

Se på baggene.

Lars har prøvd litt på pipeline.

# Idéer

Alle på skiftet skriver ned hva de har gjort på forhånd


## 14. Juni

Forbedringer:
	- Mer konkrete mål og retning
	- Testing, mange som bare ser på.

## 15. Juni
- Vanntette
- Inspection mission (mode)
- Fikse i dash så man får opp flere missions i mission
- Autonomous mission indicator. Beskriver hvilken oppgave bil er i.

Lese gjennom scrutteskjema. Les gjennom det som har med autonomous å gjøre og EBS.

Inspection

Skal trykke på knapp i Dash, da sette bil i den staten.