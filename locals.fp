# Common descriptions
locals {
  api_key_param_description = "A unique identifier required to authenticate and interact with the Urlscan APIs."
}

locals {
  search_scan_query_params = {
    query        = "q"
    page_size    = "size"
    search_after = "search_after"
  }
}
