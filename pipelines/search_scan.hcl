# Search API

pipeline "search_scan" {
  description = "Search based on query."

  param "api_key" {
    type    = string
    default = var.api_key
  }

  param "query_term" {
    type    = string
    default = var.query_term
  }

  param "page_size" {
    type    = number
    default = var.page_size
  }

  param "search_after" {
    type    = string
    default = var.search_after
  }

  step "http" "search_scan" {
    title  = "Search for scans based on specific criteria."
    method = "get"
    url    = "https://urlscan.io/api/v1/search/?q=${param.query_term}"

    request_headers = {
      Content-Type = "application/json"
      API-Key      = param.api_key
    }
  }

  output "response_body" {
    value = jsondecode(step.http.search_scan.response_body)
  }
  output "response_headers" {
    value = step.http.search_scan.response_headers
  }
  output "status_code" {
    value = step.http.search_scan.status_code
  }

}
