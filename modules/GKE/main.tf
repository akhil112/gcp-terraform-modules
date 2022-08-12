resource "google_container_cluster" "demo_cluster" {
  project  = "lively-guard-355000" 
  name     = "demo-cluster"
  location = "us-west1-a"

 
  remove_default_node_pool = true
  initial_node_count = 1

  
}