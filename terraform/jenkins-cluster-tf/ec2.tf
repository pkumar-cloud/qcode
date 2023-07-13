data "aws_ami" "amazon-linux-2" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "owner-alias"
    values = ["amazon"]
  }

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm*"]
  }

}

# Provision Jenkins master server
resource "aws_instance" "jenkins_master" {
  //ami           = var.ami
  ami                         = data.aws_ami.amazon-linux-2.id
  instance_type               = var.instance_type
  key_name                    = var.key-name
  associate_public_ip_address = var.associate_ip
  vpc_security_group_ids      = [aws_security_group.rtp03-sg.id] #ids -> [ ]
  subnet_id                   = aws_subnet.rtp03-public_subent_01.id
  // user_data            = file("install_jenkins.sh")
  tags = {
    Name = "jenkins_master"
  }
}

#creating and attaching ebs volume to master
resource "aws_ebs_volume" "data-vol" {
  availability_zone = aws_instance.jenkins_master.availability_zone
  size              = 8
  tags = {
    Name = "Data volume"
  }
}

resource "aws_volume_attachment" "data-vol" {
  device_name = "/dev/sdh"
  volume_id   = aws_ebs_volume.data-vol.id
  instance_id = aws_instance.jenkins_master.id
}


# an empty resource block
resource "null_resource" "name" {

  # ssh into the ec2 instance 
  connection {
    type = "ssh"
    //host        = self.public_ip
    host        = aws_instance.jenkins_master.public_ip
    user        = "ec2-user"
    private_key = file("~/ghub/pkdev-use1.pem")
  }

  # copy the install_jenkins.sh file from your computer to the ec2 instance 
  provisioner "file" {
    source      = "jenkins_master.sh"
    destination = "/tmp/jenkins_master.sh"
  }

  # set permissions and run the install_jenkins.sh file. # The remote-exec provisioner invokes a script on a remote resource after it is created
  provisioner "remote-exec" {
    inline = [
      "sudo chmod +x /tmp/jenkins_master.sh",
      "sh /tmp/jenkins_master.sh"
    ]
  }

  # wait for ec2 to be created
  depends_on = [aws_instance.jenkins_master]
}

# print the url of the jenkins server
output "website_url" {
  value = join("", ["http://", aws_instance.jenkins_master.public_ip, ":", "8080"])
}


# Provision Jenkins worker nodes
resource "aws_instance" "jenkins_worker" {
  // ami           = var.ami
  ami                         = data.aws_ami.amazon-linux-2.id
  instance_type               = var.instance_type
  key_name                    = var.key-name
  associate_public_ip_address = var.associate_ip
  vpc_security_group_ids      = [aws_security_group.rtp03-sg.id]
  subnet_id                   = aws_subnet.rtp03-public_subent_01.id
  user_data                   = <<-EOF
                #! /bin/bash
                sudo yum update –y
                sudo yum upgrade
                sudo amazon-linux-extras install java-openjdk11 -y
                sudo yum install git maven docker -y
                service docker start
                chkconfig docker on
  EOF
  for_each                    = toset(["worker1"])
  tags = {
    Name = "${each.key}"
  }
}



