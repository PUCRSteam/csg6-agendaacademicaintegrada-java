provider "aws" {
    region = north-virginia
}

resource "aws_instance" "csg6" {
  ami           = "ami-007855ac798b5175e" # Ubuntu 22.04 LTS
  instance_type = "t2.micro"

  tags = {
    Name = "terraform-csg6"
  }
}

resource "aws_vpc" "main" {
    cidr_block = "10.0.0.0/16
    tags = {
        Name = "main"
    }
}

resource "aws_subnet" "example" {
    vpc_id = aws_vpc.main.id
    cidr_block = 10.0.1.0/24
    availability_zone = "us=west-1a"

    tags = {
        Name = "csg6"
    }
}