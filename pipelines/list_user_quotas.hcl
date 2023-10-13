# Quotas & Rate Limiting
pipeline "list_user_quotas" {
  description = "Get the user quota list."

  param "api_key" {
    type    = string
    default = var.api_key
  }

  step "http" "list_user_quotas" {
    method = "get"
    url    = "https://urlscan.io/user/quotas/"
    request_headers = {
      Content-Type = "application/json"
      API-Key      = param.api_key
    }
  }

  output "quota_details" {
    description = "Details about the user quota."
    value       = step.http.list_user_quotas.response_body
  }

}
