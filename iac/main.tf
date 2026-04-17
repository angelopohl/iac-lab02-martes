resource "docker_image" "nginx" { 
    name = "nginx:alpine", 
    keep_locally = true 
    }
resource "docker_image" "node" { 
    name = "node:18-alpine", 
    keep_locally = true 
    }
resource "docker_image" "postgres" { 
    name = "postgres:15-alpine", 
    keep_locally = true }

resource "docker_network" "app_network" {
  name = "${terraform.workspace}-network"
}