output "ses_user" {
  value       = "${module.ses_user.ses_user}"
  description = "IAM ses username"
}

output "ses_user_arn" {
  value       = "${module.ses_user.ses_user_arn}"
  description = "ARN of the IAM ses user"
}

output "access_key" {
  value       = "${module.ses_user.access_key}"
  description = "IAM Access Key of the created user, used as the STMP user name"
}

output "ses_smtp_password" {
  value       = "${module.ses_user.ses_smtp_password}"
  description = "The secret access key converted into an SES SMTP password"
}
