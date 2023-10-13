variable "api_key" {
  type        = string
  description = "The urlscan.io personal access token to authenticate to the urlscan APIs, e.g., `f1f7962d-cda9-4cdf-a82a-079babsadsad`. Please see https://urlscan.io/docs/api/ for more information."
  default     = ""
}

variable "url" {
  type        = string
  description = "The complete web address."
  default     = ""
}

variable "uuid" {
  type        = string
  description = "The UUID of the scan."
  default     = ""
}

variable "query_term" {
  type        = string
  description = "The query term (ElasticSearch Query String Query)."
  default     = "*"
}

variable "page_size" {
  type        = number
  description = "Number of results returned. Default: 100, Max: 10000 (depending on your subscription)."
  default     = 100
}

variable "search_after" {
  type        = string
  description = "For retrieving the next batch of results, value of the sort attribute of the last (oldest) result you received (comma-separated)."
  default     = ""
}


