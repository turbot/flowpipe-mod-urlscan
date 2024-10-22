pipeline "submit_url_scan" {
  title       = "Submit URL Scan"
  description = "Submit an URL to be scanned."

  tags = {
    recommended = "true"
  }

  param "conn" {
    type        = connection.urlscan
    description = local.conn_param_description
    default     = connection.urlscan.default
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
      API-Key      = param.conn.api_key
    }

    request_body = jsonencode({
      url = param.url
    })
  }

  output "url_scan_result" {
    description = "The details of the submitted URL scan."
    value       = step.http.submit_url_scan.response_body
  }
}
