variable "project_code" {
    default = "kpmg"
}

variable "Environment" {
    type = map(any)
    default = {
       nonprod  = nonprod
       prod     = prod
       }
    }

variable "rds_instance_count" {
    type = map(any)
    default = {
        nonprod = 2
        prod    = 2
        }
      }

variable "rds_instance_type" {
    type map(any)
    default = {
       nonprod = "db.r4.large"
       prod    = "db.r4.large"
       }
    }

variable "state_s3_bucket" {
    type = map(any)
    default ={
      nonprod =   "kpmg-nonprod-data-bucket"
      prod    =   "kpmg-prod-data-bucket"
    }
 }

variable "infrastructure_state_key" {
    type = map [any)
    default = {
      nonprod = "kpmg-nonprod-terraform-state-bucket"
      prod = "kpmg-prod-terraform-state-bucket"
    }
 }

variable "deploy_region"

variable "number_of_instance" {
   type = map(string)
   default = {
    nonprod = 3
    prod =   3
   }
 }

variable "instance_size" {
    type map(any)
    default = {
      nonprod = "t2.medium"
      prod    = "t2.medium"
    }
  }

locals {
    default_tags = {
     Environment = var.environment[terraform.workspace]
     Project     = upper(var.project_code)
     Persistance = var.persistance[terraform.workspace]
     }
   }

variable "persistance" {
    type = map(any)
    default = {
      nonprod = "08:00-20:00"
      prod    = "Ignore"
     }
   }

variable "subnet_ip" {
  default = ""
  }

variable "vpc.cidr" {
  default = ""
}