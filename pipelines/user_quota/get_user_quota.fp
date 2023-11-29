pipeline "get_user_quota" {
  title       = "Get User Quota"
  description = "Get your current limits and used quota."

  param "api_key" {
    type        = string
    description = local.api_key_param_description
    default     = var.api_key
  }

  step "http" "get_user_quota" {
    method = "get"
    url    = "https://urlscan.io/user/quotas/"

    request_headers = {
      Content-Type = "application/json"
      API-Key      = param.api_key
    }
  }

  output "user_quota" {
    description = "The current limits and used quota."
    value       = step.http.get_user_quota.response_body
  }

}
