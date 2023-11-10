pipeline "retrive_scan_result" {
  title       = "Retrive Scan Result"
  description = "Retrive specific scan results."

  param "api_key" {
    type        = string
    description = local.api_key_param_description
    default     = var.api_key
  }

  param "url" {
    type        = string
    description = "The URL to be scanned."
  }

  step "pipeline" "submit_url_scan" {
    pipeline = pipeline.submit_url_scan

    args = {
      url     = param.url
      api_key = param.api_key
    }
  }

  step "sleep" "sleep" {
    depends_on = [step.pipeline.submit_url_scan]
    duration   = "30s"
  }

  step "echo" "echo_pipelineresult" {
    text = "https://urlscan.io/api/v1/result/${step.pipeline.submit_url_scan.uuid}"
  }

  step "http" "retrive_scan_result" {
    depends_on = [step.sleep.sleep]
    method     = "get"
    url        = "https://urlscan.io/api/v1/result/${step.pipeline.submit_url_scan.uuid}"
    request_headers = {
      Content-Type = "application/json"
      API-Key      = param.api_key
    }
  }

  output "scan_result" {
    description = "Details about specific scan uuid."
    value       = step.http.retrive_scan_result.response_body
  }

}