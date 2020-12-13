resource "aws_iam_role" "ops_instance_role" {
 name               = "${var.default_tags[Project]}-${var.default_tags[Environment]}-OPS-IAM-ROLE"
 path               = "/"
 assume_role_policy = data.aws_iam_policy_document.ops_instancce_policy.json

 tags = merge(
    "Name", "${var.default_tags[Project]}-${var.default_tags[Environment]}-OPS-IAM-ROLE"
    "Role", "EC2 Instance"
     )
    )
 }

data "aws_iam_policy_document" "ops_instance_policy"{
    statement {
      action = ["sts:AssumeRole"]
      principle {
        type  = "Service"
        identifier = ["ec2-amazons.com"]
        }
      }
    }

resource "aws_iam_role" "ops_instance_profile" {
 name               = "${var.default_tags[Project]}-${var.default_tags[Environment]}-OPS-IAM-PROFILE"
 path               = "/"
 role               = aws_iam_role.ops_instance_role.id

 provisioner "local-exec" {
   command = "sleep 60"
   }
 }