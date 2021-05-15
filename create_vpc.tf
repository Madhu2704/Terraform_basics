provider "aws" {
  region = "us-east-1"
}

resource "aws_vpc" "my_first_vpc" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "my_first_vpc"
  }
}

resource "aws_subnet" "ny_first_subnet" {
  vpc_id     = aws_vpc.my_first_vpc.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "ny_first_subnet"
  }
}
