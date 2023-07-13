## Setup Jenkins master (with 2nd disk) and one worker node

```
    terraform init
    terraform validate
    terraform plan
    terraform apply --auto-approve    
```
## Jenkins installation
Jenkins installation instructions ref: https://www.jenkins.io/doc/tutorials/tutorial-for-installing-jenkins-on-AWS/ . 

Troubleshooting & workarounds:

1. If you get daemonize error while running the command `sudo yum install jenkins java-1.8.0-openjdk-devel -y` then , run the commands from the answer of https://stackoverflow.com/questions/68806741/how-to-fix-yum-update-of-jenkins

2. Docker installation ref on the EC2 after Jenkins is installed by following the instructions on https://serverfault.com/questions/836198/how-to-install-docker-on-aws-ec2-instance-with-ami-ce-ee-update

3. Added `sudo chmod 666 /var/run/docker.sock` in script after Docker is installed.

4. Installed: Jenkins, Docker, Git, Maven

### Jenkins plugins to install

Install the following plugins for the demo.
- Amazon EC2 plugin (No need to set up Configure Cloud after)
- Docker plugin  
- Docker Pipeline
- GitHub Integration Plugin
- Parameterized trigger Plugin

## Jenkins 2nd disk conf -> Jenkins home
### First time:
- Format & mount:
```
lsblk
sudo file -s /dev/xvdh #If the above command output shows “/dev/xvdh: data“, it means your volume is empty.
sudo mkfs -t ext4 /dev/xvdh
OR
sudo mkfs -t xfs /dev/xvdh
sudo mkdir /mnt/tmp
sudo mount /dev/xvdh /mnt/tmp
sudo rsync -avx /var/lib/jenkins/ /mnt/tmp
cd /mnt/tmp; ls -l #check content
sudo mount /dev/xvdh /var/lib/jenkins 
ls -l /var/lib/jenkins #check content
sudo umount /var/lib/jenkins
sudo rm -rf /var/lib/jenkins #delete old location

sudo mkdir /var/lib/jenkins/
sudo mount /dev/xvdh /var/lib/jenkins/
ls -l /var/lib/jenkins
sudo umount /mnt/tmp
df -h

sudo cp /etc/fstab /etc/fstab.bak

#echo UUID=`blkid -s UUID -o value $DISK` /var/lib/jenkins/ ${DISK_TYPE} nofail,noatime,defaults,nodev 0 2 | tee -a /etc/fstab

echo UUID=`blkid -s UUID -o value /dev/xvdh` /var/lib/jenkins/ xfs defaults 0 0 | sudo tee -a /etc/fstab
mount -a OR sudo reboot
```

### Future:
- Create a snapshot of 2nd disk.
- Unmount & Dettach 2nd disk.
- Either create from snapshot or attach/mount 2nd disk to new server.

