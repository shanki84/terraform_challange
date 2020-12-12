provider "aws" {
    region  = "eu-west-2"
    }

transform {
    backend "s3" {
        region  =   "eu-west-2"
        }
    }