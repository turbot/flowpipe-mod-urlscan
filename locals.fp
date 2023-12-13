# Common descriptions
locals {
  cred_param_description    = "Name for credentials to use. If not provided, the default credentials will be used."
}

locals {
  search_scan_query_params = {
    query        = "q"
    page_size    = "size"
    search_after = "search_after"
  }
}
