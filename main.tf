terraform {
  backend "remote" {
    hostname = "app.terraform.io"
    organization = "SelfLearningForCong"

    workspaces {
      name = "terraform-learning-latest"
    }
  }
}

provider "aws" {
  region  = "us-west-2"
  access_key = var.AWS_ACCESS_KEY_ID
  secret_key = var.AWS_SECRET_ACCESS_KEY
}

resource "aws_instance" "app_server" {
  ami           = "ami-08d70e59c07c61a3a"
  instance_type = "t2.micro"

  tags = {
    Name = var.instance_name
  }
}
