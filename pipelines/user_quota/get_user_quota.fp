pipeline "get_user_quota" {
  title       = "Get User Quota"
  description = "Get your current limits and used quota."

  param "cred" {
    type        = string
    description = local.cred_param_description
    default     = "default"
  }

  step "http" "get_user_quota" {
    method = "get"
    url    = "https://urlscan.io/user/quotas/"

    request_headers = {
      Content-Type = "application/json"
      API-Key      = credential.urlscan[param.cred].api_key
    }
  }

  output "user_quota" {
    description = "The current limits and used quota."
    value       = step.http.get_user_quota.response_body
  }

}
