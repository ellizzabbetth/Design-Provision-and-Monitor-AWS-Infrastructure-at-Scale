# TODO: Designate a cloud provider, region, and credentials
provider "aws" {
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
  region     = "us-east-1" # var.region
}

# TODO: provision 4 AWS t2.micro EC2 instances named Udacity T2
resource "aws_instance" "Udacity_T2" {
  count = "4"
  ami = "ami-03d315ad33b9d49c4" # Amazon Linux 2 AMI (HVM), SSD
  instance_type = "t2.micro"
  tags = {
    Name = "Udacity T2"
  }
}

# TODO: provision 2 m4.large EC2 instances named Udacity M4
resource "aws_instance" "Udacity-M4" {
  ami           = "ami-088ff0e3bde7b3fdf" # Amazon Linux 2 AMI (HVM), SSD
  instance_type = "m4.large"
  count         = 2
}