Subject: jenkins-ci-aws
Date: 2018-12-25 - 22:51:21

# Nginx
Web server
NGINX can also function as a proxy server for email, and reverse proxy and load balancer for HTTP, TCP and UDP servers

Why NGINX?
Rverse proxy is a server that sits between internal applications and exeternal clients, forwarding client requests to the appropriate server

Nginx has a number of advanced load balancing, security, and acceleration features that most specialized applications lack.

Logging

ec2-13-53-69-228.eu-north-1.compute.amazonaws.com

systemctl status nginx | grep Active
systemctl status jenkins | grep Active

# Problems
- Recieved 503 error after updating jenkins.conf and restarting nginx
FIX: restarting jenkins
	sudo /etc/init.d/jenkins restart
- Unsecure key pair
sudo chmod 400 jenkins.pem

# Connecting to Jenkins Dashboard

# Verify email
Email addre-> haraldlons@gmail.com
Må ha en region som støtter dette

- Credentials:
 jenkins-master-smtp
SMTP Username:
AKIAIHCQ62S62RPQVBUA
SMTP Password:
AuiL7vJSGi65GTp7aYrh9ab2BRr9EX8Db6PiMCTO67fC

# Jenkins credentials
username: haraldlons
pw: vanlige 

# Klarte ikke å logge inn med SSH to build-server
- FIX:
Add SSH from anywhere / or my ip in security group
- Note: In video they only allowed from jenkins-master, which means that I cannot SSH from my personal laptop. Don't know why they didn't think about that.


# Build commands
# Initialize the elastic beanstalk app
eb init my-ebb-app1 --platform python-3.6 --region eu-west-1

# Select the development environment for development
eb use development1

# Deploy the application
eb deploy

# Get the health and status information
eb health
eb status

# Deploying PHP
- Beanstalk -> make new application
"my-first-elastic-app"
- Web Server environment
	Env name: development
	Domain: claydesk
		Will autogenerate if blank
	Platform: Preconfigured platform
		php
	Application code: Sample application
	Configure more options->
		Low Cost (Free tier)
	Then will create environment

# Delete / Clean up AWS 
- Beanstalk - Delete application, not environment
- Instancebs
- Elastic IP
- Key Pairs
- Volumes
- Security Groups
- Just check the dashboard -> should be 0 on all except 1 on security groups
- Email addresses
- S3 -> empty bucket. -> delete bucket


# Bør lære meg
- Reverse proxy
- proxy
- Load balancer

 # Begreper
 - Roles in AWS:
 A set of permissions that grant access to actions and resources in AWS

# Value of DevOps
Disconnect between development and operations. 
- Benefits:
	Increased frequency of deployments
	Software/services made available across more platform
	Increase collaboration between departments

# To host Jenkins
## New jenkins master
Key pair
- Download key pair and store in folder
```bash
chmod 400 /path/my-key-pair.pem
```
Security Group
- Inbound trafic
	- SSH myip
	- HTTP anywhere
	- HTTPS anywhere

TAG - Name: jenkins-master
	Launch new instance
		Ubuntu 18.04 server
		Protect against accidental termination
		TAG: Name: jenkins-master
		Security Group: Choose jenkins-master

		Choose existing key pair

Elastic IP
	Amazon pool
	Choose new EIP -> actions -> associate -> jenkins-master
	Private ip: choose that one which comes ip

SSH to instance:
	ssh -i /path/my-key-pair.pem ec2-user@ec2-198-51-100-1.compute-1.amazonaws.com

	Then install following on server:
```bash
wget -q -O - https://pkg.jenkins.io/debian/jenkins.io.key | sudo apt-key add -

sudo sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'

sudo apt-get update

sudo apt install openjdk-8-jdk

sudo apt-get install nginx

sudo apt-get install jenkins

# To check status:
systemctl status nginx | grep Active
systemctl status jenkins | grep Active
```	
### Configure NGINX
```bash
sudo apt upgrade
# Grup: Keeb the local version currently installed
ps -ef | grep jenkins
unlink /etc/nginx/sites-enabled/default
vim /etc/nginx/conf.d/jenkins.conf	
```


- Build server
- Setup Simple Email Service




# NGINX configure file:
```bash
upstream jenkins {
	server 127.0.0.1:8080;
}
server {
	listen
	80 default;
	#server_name your_jenkins_site.com;#
	access_log /var/log/nginx/jenkins.access.log;
	error_log /var/log/nginx/jenkins.error.log;
	proxy_buffers 16 64k;
	proxy_buffer_size 128k;
	location / {
		proxy_pass http://jenkins;proxy_next_upstream error timeout invalid_header http_500 http_502 http_503 http_504;
		proxy_redirect off;
		proxy_set_header Host
		proxy_set_header X-Real-IP
		$host;
		$remote_addr;
		proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
		proxy_set_header X-Forwarded-Proto http;
	}
}
```