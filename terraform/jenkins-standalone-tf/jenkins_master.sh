#!/bin/bash
sudo yum update –y
sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key
sudo yum upgrade
sudo amazon-linux-extras install java-openjdk11 -y
sudo yum install jenkins -y
sudo systemctl enable jenkins
sudo systemctl start jenkins
sudo systemctl status jenkins
# Making it work as worker
sudo yum install git maven docker -y
sudo service docker start
sudo chkconfig docker on
sudo chmod 666 /var/run/docker.sock
sudo cat /var/lib/jenkins/secrets/initialAdminPassword
#sudo yum install java-1.8.0 -y
#sudo yum install java-1.8.0-openjdk-devel -y
