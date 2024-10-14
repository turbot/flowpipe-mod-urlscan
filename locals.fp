# Common descriptions
locals {
  conn_param_description = "Name for connections to use. If not provided, the default connection will be used."
}

locals {
  search_scan_query_params = {
    query        = "q"
    page_size    = "size"
    search_after = "search_after"
  }
}
