
provider "aws" {
  alias = "aws.virginia"
  region = "us-east-1"

}

provider "aws" {
  region = "us-west-2"
}
resource "aws_instance" "ec2_instance" {
  name = "mine"
  ami = "ami-43242fsd"
  instance_type = "t2.micro"

  tags = {
    Name="my"
  }
}
data "aws_instance" "ec2_data" {
  instance_id = ""
}
resource "aws_s3_bucket" "virginia_bucket" {
  provider = "aws.aws.virginia"
  bucket = ""

}
resource "aws_s3_bucket" "default" {

}