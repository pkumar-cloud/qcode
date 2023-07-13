#Worker
#! /bin/bash
sudo yum update –y
sudo yum upgrade
sudo amazon-linux-extras install java-openjdk11 -y
sudo yum install git maven docker -y
sudo service docker start
sudo chkconfig docker on
sudo chmod 666 /var/run/docker.sock

#sudo amazon-linux-extras install epel -y
#sudo yum remove java-1.7.0-openjdk -y
#sudo amazon-linux-extras install java-1.8.0 -y
