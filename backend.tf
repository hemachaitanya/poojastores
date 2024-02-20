provider "aws" {
    region = "us-east-1"
    alias  = "env"
  
}
resource "aws_dynamodb_table" "backend-purpose" {
    name = "back-end-porpose"
    billing_mode = "PAY_PER_REQUEST"
    hash_key = "lockID"
    attribute {
        name = "lockID"
        type = "S"      
    }  
}
terraform {
  backend "s3" {
    bucket = "eshubabool143"
    key = "terraform.tfstate"
    region = "us-east-1" 
    encrypt = true   
    dynamodb_table = "back-end-porpose"
  }
}
