provider "aws" {
    region = "us-east-1"
}
resource "aws_vpc" "vpc1" {
    cidr_block = "190.19.0.0/16"
    name = "vpc1"
    tags = {
      "Name" = "vpc1"
    }  
}
resource "aws_subnet" "sub" {  
    vpc_id = aws_vpc.vpc1.name
    count = 3
    name = "mysub[count.index]"
    cidr_block =  190.19.[count.index].0/24
    tags = {
      Name = "mysub[count.index]"
    }

}