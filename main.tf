# resource "google_compute_network" "custom" {
#   project                 = "lively-guard-355000"
#   name                    = "vpc-network"
#   auto_create_subnetworks = false
# }


# resource "google_compute_subnetwork" "custom" {
#   name          = "test-subnetwork"
#   ip_cidr_range = "10.10.0.0/16"
#   region        = "us-central1"
#   network       = google_compute_network.custom.id
#   secondary_ip_range {
#     range_name    = "services-range"
#     ip_cidr_range = "10.20.0.0/16"
#   }

#   secondary_ip_range {
#     range_name    = "pod-ranges"
#     ip_cidr_range = "10.30.0.0/16"
#   }
# }


# resource "google_container_cluster" "my_vpc_native_cluster" {
#   name               = "my-vpc-native-cluster"
#   location           = "us-central1-a"
#   initial_node_count = 1
#   remove_default_node_pool = true
#   network            = google_compute_network.custom.id
#   subnetwork         = google_compute_subnetwork.custom.id

#   # makes cluster vpc_native
#   ip_allocation_policy {
#     cluster_secondary_range_name  = "services-range"
#     services_secondary_range_name = google_compute_subnetwork.custom.secondary_ip_range.1.range_name
#   }

#   # master_ipv4_cidr_block must be set if enable_private_nodes is true
#   # cluster will be recreated if we change anything
#   private_cluster_config {
#     enable_private_endpoint  = false
#      enable_private_nodes    = true
#    master_ipv4_cidr_block    = "10.100.100.0/28"
#   }

#    # release channel.
#    release_channel {
#       channel = "STABLE"
#   }

#   addons_config {
#     // Enable network policy (Calico)
#     network_policy_config {
#         disabled = true
#       }
#   }

#   /* Enable network policy configurations (like Calico).
#   For some reason this has to be in here twice. */
#   network_policy {
#     enabled = "true"
#   }

# #    workload_identity_config {
# #     identity_namespace = format("%s.svc.id.goog", var.project_id)
# #   }

# }


# resource "google_container_node_pool" "linux_pool" {
#   name               = "linux-pool"
#   project            = "lively-guard-355000"
#   cluster            = google_container_cluster.my_vpc_native_cluster.name
#   location           = google_container_cluster.my_vpc_native_cluster.location
  
#   initial_node_count = 1
#   node_config {
#     image_type   = "COS_CONTAINERD"
#   }

# #   autoscaling {
# #     max_node_count = 1
# #     min_node_count = 1
# #   }
# #   max_pods_per_node = 100

# #   management {
# #     auto_repair  = true
# #     auto_upgrade = true
# #   }

# #   node_config {
# #     preemptible  = true
# #     disk_size_gb = 10

# #     # service_account = var.service_account
# #     # oauth_scopes = [
# #     #   "https://www.googleapis.com/auth/devstorage.read_only",
# #     #   "https://www.googleapis.com/auth/logging.write",
# #     #   "https://www.googleapis.com/auth/monitoring",
# #     #   "https://www.googleapis.com/auth/servicecontrol",
# #     #   "https://www.googleapis.com/auth/service.management.readonly",
# #     #   "https://www.googleapis.com/auth/trace.append",
# #     # ]
# # }

# }




# resource "google_project" "demo_project" {
#   name       = "My Project"
#   project_id = "true-angel-909067"
  
# }

# resource "google_project_service" "project" {
#   project = google_project.demo_project.project_id
#   service = "iam.googleapis.com"
# }
