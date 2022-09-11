# resource "google_compute_global_address" "default" {
#   name = "global-appserver-ip"
  
#    provider = "google-beta"
#    labels = {
#           "name" = "akhil"
#             }
# }

# resource "google_compute_global_address" "default1" {
#   name = "global-appserver-ip"
 
# }






# # forwarding rule
# resource "google_compute_global_forwarding_rule" "default" {
#   name                  = "l7-xlb-forwarding-rule"
#   ip_protocol           = "TCP"
#   load_balancing_scheme = "EXTERNAL"
#   port_range            = "80"
#   target                = google_compute_target_http_proxy.default.id
#   ip_address            = google_compute_global_address.default.id
# }

# # http proxy
# resource "google_compute_target_http_proxy" "default" {
#   name     = "l7-xlb-target-http-proxy"
#   url_map  = google_compute_url_map.default.id
#   # ssl_certificates = [google_compute_managed_ssl_certificate.default.id]
# }

# # URL map
# resource "google_compute_url_map" "default" {
#   name            = "l7-xlb-url-map"
#   default_service = google_compute_backend_service.default.id
# }

# resource "google_compute_global_network_endpoint_group" "external_proxy" {
#   name                  = "network-endpoint"
#   network_endpoint_type = "INTERNET_FQDN_PORT"
#   default_port          = "80"
# }

# resource "google_compute_global_network_endpoint" "proxy" {
#   global_network_endpoint_group = google_compute_global_network_endpoint_group.external_proxy.id
#   fqdn                          = "www.kalibr.in"
#   port                          = google_compute_global_network_endpoint_group.external_proxy.default_port
# }

# resource "google_compute_backend_service" "default" {
#   name                            = "backend-service"
#   enable_cdn                      = true
#   timeout_sec                     = 10
#   # connection_draining_timeout_sec = 10
#   port_name   = "http"
#   protocol    = "HTTP"

#   custom_request_headers          = ["host: ${google_compute_global_network_endpoint.proxy.fqdn}"]
#   custom_response_headers         = ["X-Cache-Hit: {cdn_cache_status}"]

#   backend {
#     group = google_compute_global_network_endpoint_group.external_proxy.id
#   }
# }




