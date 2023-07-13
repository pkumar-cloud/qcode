# use data source to get all avalablility zones in region as list
data "aws_availability_zones" "available_zones" {}

// Creatomg a Subnet 
resource "aws_subnet" "rtp03-public_subent_01" {
  vpc_id                  = aws_vpc.rtp03-vpc.id
  cidr_block              = var.subnet_cidr
  map_public_ip_on_launch = "true"
  // availability_zone = "us-east-1a"
  // use the 1st AZ from the list
  availability_zone = data.aws_availability_zones.available_zones.names[0]
  tags = {
    Name = "rtp03-public_subent_01"
  }

}
