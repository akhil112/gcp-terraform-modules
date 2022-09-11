# # resource "google_project_iam_member" "project" {
# #   project = "lively-guard-355000"
# #   role    = "roles/compute.networkAdmin"
# #   member  = "user:akhil.maddu021@gmail.com"

 
# # }



# resource "google_project_iam_member" "project1" {
#   project = "lively-guard-355000"
#   role    = "roles/compute.loadBalancerAdmin"
#   member  = "user:akhil.maddu021@gmail.com"

 
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