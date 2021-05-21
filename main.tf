provider "aws" {
  region  = "${var.ses_region}"
  profile = "${var.aws_profile}"
}

terraform {
  backend "s3" {}
}

locals = {
  user_name = "${var.namespace == "" ? "" : "${lower(var.namespace)}-"}${lower(var.project_env_short)}-ses"
  ses_user  = "${coalesce(var.ses_user,local.user_name)}"
  
  common_tags = {
    Env = "${var.project_env}"
  }
}

# main module:
module "ses_user" {
#  source  = "git::https:/github.com/thanhbn87/terraform-aws-ses-user.git?ref=tags/0.1.1"
  source  = "git::https:/github.com/kienanh04/terraform-aws-ses-user.git?ref=tags/0.1.1"
  enabled = "${var.enabled}"
  
  ses_user      = "${local.ses_user}"
  path          = "${var.path}"
  force_destroy = "${var.force_destroy}"
  pgp_key       = "${var.pgp_key}"
  
  permissions_boundary    = "${var.permissions_boundary}"
  user_policy_name_prefix = "${var.user_policy_name_prefix}"
  
  temp_file_policy = "${var.temp_file_policy}"
  resources        = "${var.resources}"
  whitelist_ips    = "${var.whitelist_ips}"
  
  tags = "${merge(local.common_tags, var.tags)}"
}
