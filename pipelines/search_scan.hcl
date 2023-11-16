pipeline "search_scans" {
  title       = "Search Archived Scans on Urlscan.io"
  description = "Search archived scans of URLs on urlscan.io."

  param "api_key" {
    type        = string
    description = local.api_key_param_description
    default     = var.api_key
  }

  param "query_term" {
    type        = string
    description = "The query term (ElasticSearch Query String Query)."
  }

  param "page_size" {
    type        = number
    description = "Number of results returned."
    optional    = true
  }

  param "search_after" {
    type        = string
    description = "For retrieving the next batch of results."
    optional    = true
  }

  step "http" "search_scans" {
    method = "get"
    url    = "https://urlscan.io/api/v1/search/?q=${param.query_term}"

    request_headers = {
      Content-Type = "application/json"
      API-Key      = param.api_key
    }
  }

  output "scan_result" {
    description = "Details about the scan."
    value       = step.http.search_scan.response_body
  }
}
