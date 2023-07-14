resource "aws_instance" "ec2" {
    ami = var.ami
    instance_type = var.instance_type
    key_name = var.key-name
    associate_public_ip_address = var.associate_ip
   // security_groups = ["rtp03-sg"]
   vpc_security_group_ids = ["${aws_security_group.rtp03-sg.id}"]
   subnet_id = "${aws_subnet.rtp03-public_subent_01.id}"
   // is used to provision the multiple resources of same type. for_each argument is used to iterate over a collection of values and create multiple instances of a resource. The toset() function is used to convert a list or tuple of values into a set. A set in Terraform is an unordered collection of unique elements
   for_each = toset(["master", "slave"]) 
   tags = {
     Name = "${each.key}" //Name the resoucre as per key value in the list
   }
}