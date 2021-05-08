# ami-06c2bd632901cd82e
provider "aws" {
  region     = "us-east-1"
  access_key = "AKIAS6EWYBAS7K5MH5XS"
  secret_key = "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"
}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "create_ec2_sample" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"
  tags = {
    Name = "terraform-example"
  }
}


# resource "<PROVIDER>_<TYPE>" "<NAME>" {
#[CONFIG …]
# }
