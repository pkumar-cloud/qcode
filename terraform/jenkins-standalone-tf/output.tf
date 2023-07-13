// to retrive the resource details. 
output "vpc-name" {
  description = "this is vpc id"
  value       = aws_vpc.rtp03-vpc.id

}

output "master-public-ip" {
  description = "this is jenkins master ip"
  //value       = try(aws_instance.jenkins_master["master"].public_ip, "")
  value = try(aws_instance.jenkins_master.public_ip, "")

}

# print the url of the jenkins server
output "website_url" {
  value = join("", ["http://", aws_instance.jenkins_master.public_ip, ":", "8080"])
}

output "security_group" {
  value = aws_security_group.rtp03-sg.id

}

output "public_subent" {
  value = aws_subnet.rtp03-public_subent_01.id
}


