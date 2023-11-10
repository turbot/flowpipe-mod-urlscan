
pipeline "submit_url_scan" {
  title       = "Submit URL Scan"
  description = "Submit URL for analysis."

  param "api_key" {
    type        = string
    description = local.api_key_param_description
    default     = var.api_key
  }

  param "url" {
    type        = string
    description = "The URL to be scanned."
  }

  step "http" "submit_url_scan" {
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

  output "url_scan" {
    description = " Details about provided URL."
    value       = jsondecode(step.http.submit_url_scan.response_body)
  }

}
