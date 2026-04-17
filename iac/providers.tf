terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "4.2.0"
    }
  }
}


resource "docker_image" "nginx" {
  name = "nginx:alpine"
}

resource "docker_image" "node" {
  name = "node:18-alpine"
}

resource "docker_image" "postgres" {
  name = "postgres:15-alpine"
}