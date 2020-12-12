data "terraform_remote_state" "remote_instance" {
    backend =   "s3"

    config  =   {
        bucket  =   var.state_s3_bucket[terraform.workspace]
        key     =   var.infrastructure_state_key[terraform.workspace]
        region  =   var.deploy_region
        }
    }

