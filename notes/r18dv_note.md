# Tricks and tips for work on R18DV

## If Lidar is not connected

## Check USB-connections
```
dmesg --follow
```

## Start CAN
Use alias 
```
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

Bo sett videre på camera-fester

Anbefalinger:
Lime assi på rear-cover. Bak dempere.

Fikk robert SBS koden. Ja. Tror det.

Har kun et kort.

Vårt skift:

Brukte to første timer på å gjøre klar. 
GJort klar til vanntetting.
Har ikke kommet noe regn, men ser ut som det kan begynne å regn.


? Hvorfor ikke bagge nå med.

Lidar problemer. Koblet inn og ut mange steder.

Ethernet kabl. 

Må sette lidar direkte i PX-casing.

Fikk endelig kamera i. 
Lille hub funker mer med den. 
? Har ikke målt spenning på hub. 
- Kan se på spenning i flycap programm til kamera. 
	Vet ikke hvilke arbeidsforhold den skal ligge i.

Kan powre kamera. 
Trenger dioder på huben, siden den powrer mye annet også.

Fikk kalibrert kamera med lidar. Er ikke sikkert det er veldig nøyaktig. 

Har dyttet rundt og den.

Litt mye ymse detection. Ofte veldig mange kjegler. Mange kjegler som ikke blir klassifisert som kjegler.


Hva bør vi gjøre?
	Bagge data

	Bagge uten å kutte RTK. 

	Bagge Skid-pad og aks. 

	Bagge i høyere hastighet. 

	Bagge i mange runder for å sjekke odometry. 

	Kort ligger i bertel-bil.	

###
Lage designdok.
	Mathias linker.
	Først lese litt om hvilke spørsmål man fikk i fjor. 
	Lage presentasjon til våre systemer
	Ta utgangspunkt i de oppdelingene i det konkurransen gir.
	På konkurranse.

## Notater 3. Juli 2018
Øystein: Igår, crimpe opp ledninger. Må fikse CAN-buss. Crimpe 9-pins.
	Laget liten patch til actuator interface - feature branch, ikke testet eller at den fungerer.
	Sender ut null med mindre man er i "drive" state.

	Sondre snakker med Robert om videreføring av.

Sondre:
	Igår:
		Gjorde ish ferdig force interface controller i matlab.

		En som har feedback i kraft-estimat.

		Dette skal inn i VCU.

		Skrev om Los guidance til å lage odometry direkte.

		SLAM publiserer ikke ODOmetry i høy frekvens.

		Det som jeg gjør er ikke absolutt kritisk for å få kjørt.
		Viktig for masteren å få implementert det, men hjelper ikke hvis ikke kan kjøre.


		Bør fikse odometry frekvens.

1. Fikse CAN-bus
2. Se på rate i ROS vs rate på bus. Se om vi dropper noe inn på ROS
3. Teste uptime på kameraer.


1. Få all kode som ligger på torque vectoring på VCU'en.

Hva det har å si for oss: At vi får en kraft-estimering(8-krefter) på VCU'en, som kan brukes til å regulere kraft. 
Estimerer i tillegg friksjonskoeffisientene.
	Hva slags dekk.

2. Rydde opp i koden slik at den kan brukes til å generere kode.
Har en god del dev og debug bolker.
Må sende debug-informasjon riktig sted. Sende ut på riktige kanaler i steden for å lese ut direkte.

