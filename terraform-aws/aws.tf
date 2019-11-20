//--------------------------------------------------------------------
// Providers

provider "aws" {
  // Credentials set via env vars
  access_key = ""
  secret_key = ""
  region = var.aws_region
}

//--------------------------------------------------------------------
// Data Sources

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

