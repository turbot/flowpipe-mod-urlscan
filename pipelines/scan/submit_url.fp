pipeline "submit_url" {
  title       = "Submit URL"
  description = "Submit a URL to be scanned."

  param "api_key" {
    type        = string
    description = local.api_key_param_description
    default     = var.api_key
  }

  param "url" {
    type        = string
    description = "The URL to be scanned."
  }

  step "http" "submit_url" {
    method = "post"
    url    = "https://urlscan.io/api/v1/scan/"

    request_headers = {
      Content-Type = "application/json"
      API-Key      = param.api_key
    }

    request_body = jsonencode({
      url = param.url
    })
  }

  output "task" {
    description = "The details of the submitted task."
    value       = step.http.submit_url.response_body
  }
}
