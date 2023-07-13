// to retrive the resource details. 
output "vpc-name" {
  description = "this is vpc id"
  value       = aws_vpc.rtp03-vpc.id

}

output "master-public-ip" {
  description = "this is jenkins master ip"
  value       = try(aws_instance.jenkins_master.public_ip, "")

}

output "worker-public-ip" {
  description = "this is jenkins worker ip"
  value       = try(aws_instance.jenkins_worker["worker1"].public_ip, "")

}

output "security_group" {
  value = aws_security_group.rtp03-sg.id

}

output "public_subent" {
  value = aws_subnet.rtp03-public_subent_01.id
}


