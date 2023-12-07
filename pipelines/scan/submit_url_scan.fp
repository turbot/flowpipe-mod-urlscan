pipeline "submit_url_scan" {
  title       = "Submit URL Scan"
  description = "Submit an URL to be scanned."

  tags = {
    type = "featured"
  }

  param "cred" {
    type        = string
    description = local.cred_param_description
    default     = "default"
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
      API-Key      = credential.urlscan[param.cred].api_key
    }

    request_body = jsonencode({
      url = param.url
    })
  }

  output "scan_result" {
    description = "The details of the submitted url scan."
    value       = step.http.submit_url_scan.response_body
  }
}
