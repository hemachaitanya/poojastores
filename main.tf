provider "aws" {
    region = "us-east-1"
}
resource "aws_vpc" "vpc1" {
    cidr_block = "190.19.0.0/16"
    tags = {
      "Name" = "vpc1"
    }  
}
resource "aws_subnet" "sub" {  
    vpc_id = aws_vpc.vpc1.name
    count = 3
    cidr_block =  cidrsubnet("190.19.0.0/16",8,count.index)
    tags = {
      Name = "mysub$(count.index)"
    }

}