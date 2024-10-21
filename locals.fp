# Common descriptions
locals {
  conn_param_description = "Name of URLScan connection to use. If not provided, the default URLScan connection will be used."
}

locals {
  search_scan_query_params = {
    query        = "q"
    page_size    = "size"
    search_after = "search_after"
  }
}
