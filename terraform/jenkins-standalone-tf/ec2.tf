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

/* If script fails while running, will not come to know. Thus use: provisioner "remote-exec"
# Provision Jenkins master server
resource "aws_instance" "jenkins_master" {
  //ami           = var.ami
  ami                         = data.aws_ami.amazon-linux-2.id
  instance_type               = var.instance_type
  key_name                    = var.key-name
  associate_public_ip_address = var.associate_ip
  vpc_security_group_ids      = [aws_security_group.rtp03-sg.id] #ids -> [ ]
  subnet_id                   = aws_subnet.rtp03-public_subent_01.id
  user_data                   = file("jenkins_master.sh")
  for_each                    = toset(["master"])
  tags = {
    Name = "${each.key}"
  }
}
*/

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

# an empty resource block
resource "null_resource" "name" {

  # ssh into the ec2 instance 
  connection {
    type = "ssh"
    //host        = self.public_ip
    host        = aws_instance.jenkins_master.public_ip
    user        = "ec2-user"
    private_key = file("${var.private_key_file}")
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









