terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.2"
    }
  }
}

provider "docker" {}

# Pull the latest NGINX image
resource "docker_image" "nginx_image" {
  name = "nginx:latest"
}

# Run a container using the NGINX image
resource "docker_container" "nginx_container" {
  name  = "nginx-server"
  image = docker_image.nginx_image.latest
  ports {
    internal = 80
    external = 8080
  }
}
