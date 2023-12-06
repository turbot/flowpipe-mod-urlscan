pipeline "search_scan" {
  title       = "Search Scan"
  description = "Find archived scans of URLs on urlscan.io."

  param "cred" {
    type        = string
    description = local.cred_param_description
    default     = "default"
  }

  param "query" {
    type        = string
    description = "The query term (ElasticSearch Query String Query)."
  }

  step "http" "search_scan" {
    method = "get"

    url = "https://urlscan.io/api/v1/search?q=${param.query}&size=10000"

    loop {
      until = result.response_body.has_more == false

      url = join("", [
        "https://urlscan.io/api/v1/search?q=${param.query}&size=10000&search_after=",
        "${element(result.response_body.results, length(result.response_body.results) - 1).sort[0]}",
        ",${element(result.response_body.results, length(result.response_body.results) - 1).sort[1]}"
      ])
    }

    request_headers = {
      Content-Type = "application/json"
      API-Key      = credential.urlscan[param.cred].api_key
    }
  }

  output "search_results" {
    description = "Details about the scan."
    value       = flatten([for entry in step.http.search_scan : entry.response_body.results])
  }
}
