#
# Variables
#

variable "enabled" { 
  description = "Set to false to prevent the module from creating any resources"
  default     = true
}

variable "ses_region" {
  type        = "string"
  description = "The region of SES"
  default     = "us-west-2"
}

variable "aws_profile" {
  type        = "string"
  description = "The aws profile"
  default     = "default"
}

variable "project_env" {
  type        = "string"
  description = "The environment of project"
  default     = "Development"
}

variable "project_env_short" {
  type        = "string"
  description = "The short name of environment of project"
  default     = "dev"
}

variable "namespace" {
  type        = "string"
  description = "The namespace of project"
  default     = ""
}

variable "ses_user" {
  type        = "string"
  description = "Name of the SES user"
  default     = ""
}

variable "path" {
  type        = "string"
  description = "Path in which to create the user"
  default     = "/"
}

variable "permissions_boundary" {
  type        = "string"
  description = "The ARN of the policy that is used to set the permissions boundary for the user"
  default     = ""
}

variable "force_destroy" {
  description = "Use this to be able to also delete IAM users that were not created with Terraform and have IAM access keys, MFA devices, etc."
  default     = false
}

variable "pgp_key" {
  type        = "string"
  description = "Either a base-64 encoded PGP public key, or a keybase username in the form keybase:some_person_that_exists"
  default     = ""
}

variable "user_policy_name_prefix" {
  type        = "string"
  description = "Name prefix of the IAM policy that is assigned to the user"
  default     = "SesSending"
}

variable "temp_file_policy" {
  type        = "string"
  description = "The Path of template file for the IAM policy"
  default     = ""
}

variable "resources" {
  type        = "list"
  description = "The list of SES resources"
  default      = ["*"]
}

variable "whitelist_ips" {
  type        = "list"
  description = "The list of whitelist IP addresses"
  default     = ["0.0.0.0/0"]
}

variable tags {
  type    = "map"
  default = {}
}
