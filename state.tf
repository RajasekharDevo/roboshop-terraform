terraform {
  backend "s3" {
    bucket = "terraform-y72"
    key    =  "roboshop/dev/terraform.tfstate"
    region = "us-east-1"
  }
}

