terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

  required_version = ">= 0.14.9"
}

provider "aws" {
  profile = "default"
  region  = "us-west-2"
}


resource "aws_iam_policy" "policy" {
  name = "CadoResponseCrossAccountPolicy"

  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": "sts:AssumeRole",
            "Resource": [
                "arn:aws:iam::0222:role/CadoRole-In-Second-Account",
                "arn:aws:iam::0333:role/CadoRole-In-Third-Account"
            ]
        }
    ]
}
  EOF
}
