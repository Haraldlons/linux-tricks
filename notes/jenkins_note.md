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
- Recieved 503 error after updating jenkins.conf and restarting jenkins
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

Then install Java, Nginx and Jenkins as copied below
Then edit nginx configuration to point to Jenkins



# Install Java, Nginx, Jenkins
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
# Configure NGINX
```bash
sudo apt upgrade
# Grup: Keeb the local version currently installed
ps -ef | grep jenkins
sudo unlink /etc/nginx/sites-enabled/default
sudo vim /etc/nginx/conf.d/jenkins.conf	
```

Configure file:
```bash
upstream jenkins {
	server 127.0.0.1:8080;
}
server {
	listen 90 default;
	#server_name your_jenkins_site.com;
	access_log /var/log/nginx/jenkins.access.log;
	error_log /var/log/nginx/jenkins.error.log;
	proxy_buffers 16 64k;
	proxy_buffer_size 128k;
	location / {
		proxy_pass http://jenkins;
		proxy_next_upstream error timeout invalid_header http_500 http_502 http_503 http_504;
		proxy_redirect off;
		proxy_set_header Host $host;
		proxy_set_header X-Real-IP $remote_addr;
		proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
		proxy_set_header X-Forwarded-Proto http;
	}
}

```
TIP: To change user password:
```bash
sudo passwd ubuntu
```
```bash
systemctl reload nginx
```

Go to Public DNS and Install recommented packages, and make admin user

Then go to AWS and make simple server stuff
SES HOME -> Email Addresses -> Verify a new email address

Go to Jenkins and http://10.0.0.17/configure
Go to the end "E-mail Notifications"

Then you need to go to AWS
SES HOME -> SMTP Settings -> create my SMTP Credentials
I think you can use whatever IAM name you want

You get the credentials from the 
https://console.aws.amazon.com/ses/home?region=us-east-1#smtp-settings:

Just make new ones

Go to Jenkin configure
		
System Admin e-mail address: haraldlons
E-mail Notification
Change:
	SMTP Server
	Check Use smtp authentication
	User name: from credentials.csv
	Password: from credentials.csv
	Check Use SSL
	SMTP port: 465

	And then test configuration by sending test e-mail

# Then make Build server
Amazon Elastic Block Store (EBS)

Jenkins 
-> Key Pair
-> Build servers
-> IAM 
-> EBS (Or S3/EC2)

## IAM Role
What are IAM roles?
IAM roles are a secure way to grant permissions to entities that you trust.

Roles -> Create role
Choose the service that will use this role: EC2
-> next permissions
Search for 'beanstalk'
choose: AWSElasticBeanstalkFullAccess
-> next tags
Key: name
Value: build-server-iam

## Security Group
name: build-server
Inbound: 
ssh TCP 22: source 

## Key Pair

## Launch new instance
type: Amazon Linux 2 AMI (HVM), SSD Volume Type
3. configure instance: IAM Role: build-server2
Advanced Details
-> User data:
```bash
#!bin/bash
#update the yum cache
yum update
#install java
yum -y install java-1.8.0-openjdk
#install git
yum -y install git
#install elastic beanstalk CLI
/usr/bin/easy_install awsebcli
```
Can also run those after you SSH to the server

5. Add tags
name: build-server

6. Configure security group
Existing: build-server


Choose existing key pair

## Elastic IP
Make new
Remember to Associate address

## SSH
Use public DNS(IPv4)
alias sshb='ssh -i "~/coding/jenkins/build-server.pem" ec2-user@ec2-18-203-23-195.eu-west-1.compute.amazonaws.com'
Then run following commands:
```bash
sudo yum update
sudo /usr/bin/easy_install awsebcli
```

## Link jenkins-master and build-server
Go to "Instances" at AWS.
Copy Private DNS to build-server

Go to Jenkins
Remove number of executors of master to 0

New-node
Node-Name: build-server-one
Choose parmanent agent
number of executors: 4
Remote root directory: /home/ec2-user
labels: beanstalk
Usage: Use this node as much as possible
Launch method: Launch agent via SSH
Host: ip-172-31-19-198.eu-west-1.compute.internal
Credentials: ec2-user (build-server) (These we should have created 
Host key Verificiation Strategy: Non verifying Verification Strategy
Availability: Keep this agent online as much as possible
Press Save

Click on build-server-one
and log
Will spin up and open up SSH connection. 
Then going to configure Jenkins to connect to this instance. 
Should read after a while: "Agent successfully connected and online"

## Configure Github integration
Jenkins -> configurations

from login and password

add login server 
GitHub:	GitHub Servers

name: haraldlons
api-url: https://api.github.com
Credentials: GitHub auto generated token credentials for haraldlons
manage-hooks: 1

You should be able to se that hook here: https://github.com/settings/security


# Test one repository

Source Code Management: Git

Build:
Execute shell:
```bash
cat README.md
```

# Python Webpage
New item in jenkins
GitHub Project: 1

Restrict where this project can be run: beanstalk
// Is beanstalk since build-server-one is labeled beanstalk.
Men andre ord kan dette prosjektet dermed kun kjøre på build-server-one

Source Code Management
Git:
Repositories: Fill inn correct URL

Additional behaviours: Check out to specific branch. You don't need to fill in any branch name

Build Triggers
GitHub hook trigger fot GITScm polling

Build:
Execute shell:
```bash
# Initialize the elastic beanstalk app
eb init my-eb-app1 --platform python-3.6 --region eu-west-1

# Select the development environment for development
eb use app2-harald

# Deploy the application
eb deploy

# Get the health and status information
eb health
eb status
```

Build Triggers: GitHub hook trigger for GITScm polling


