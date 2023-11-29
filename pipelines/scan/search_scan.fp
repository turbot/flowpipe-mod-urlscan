pipeline "search_scan" {
  title       = "Search Scan"
  description = "Find archived scans of URLs on urlscan.io."

  param "api_key" {
    type        = string
    description = local.api_key_param_description
    default     = var.api_key
  }

  param "query" {
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
    description = "For retrieving the next batch of results, value of the sort attribute of the last (oldest) result you received (comma-separated)."
    optional    = true
  }

  step "http" "search_scan" {
    method = "get"

    url = join("&", concat(["https://urlscan.io/api/v1/search/?"],
    [for name, value in param : "${local.search_scan_query_params[name]}=${urlencode(value)}" if contains(keys(local.search_scan_query_params), name) && value != null]))

    request_headers = {
      Content-Type = "application/json"
      API-Key      = param.api_key
    }
  }

  output "search_results" {
    description = "Details about the scan."
    value       = step.http.search_scan.response_body
  }
}
