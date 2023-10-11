# Result API, Screenshots & DOM snapshots

pipeline "retrive_scan_result" {
  description = "Retrive specific scan results."

  param "api_key" {
    type    = string
    default = var.api_key
  }

  param "url" {
    type    = string
    default = var.url
  }

  // step "pipeline" "retrive_uuid" {
    step "pipeline" "submit_url_scan" {
    pipeline = pipeline.submit_url_scan

    args = {
      url = param.url
    }
  }

  step "echo" "echo_pipelineresult" {
    text = "https://urlscan.io/api/v1/result/${step.pipeline.submit_url_scan.uuid}"
  }

  step "http" "retrive_scan_result" {
    // depends_on = [step.pipeline.retrive_uuid]
    title  = "Retrive specific scan results."
    method = "get"
    //url    = "https://urlscan.io/api/v1/result/${param.uuid}"
    // url    = "https://urlscan.io/api/v1/result/${step.pipeline.submit_url_scan.uuid}"
    url    = "https://urlscan.io/api/v1/result/${step.pipeline.submit_url_scan.uuid}"
    // url    = "https://urlscan.io/api/v1/result/8e4395dd-1ac6-4685-bf77-e0ddccbc10fe"
    request_headers = {
      Content-Type  = "application/json"
      API-Key = param.api_key
    }

  }

  // output "response_body" {
  //   value = step.http.retrive_scan_result.response_body
  // }
  // output "response_headers" {
  //   value = step.http.retrive_scan_result.response_headers
  // }
  // output "status_code" {
  //   value = step.http.retrive_scan_result.status_code
  // }

}
