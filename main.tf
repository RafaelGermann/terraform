terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.1"
    }
  }
}

provider "docker" {
  host    = "npipe:////.//pipe//docker_engine"
}

resource "docker_image" "nginx" {
  name         = "nginx:latest"
  keep_locally = false
}

resource "docker_container" "nginx1" {
  image = docker_image.nginx.image_id
  name  = "nginx1"
  ports {
    internal = 80
    external = 8002
  }
}

resource "docker_container" "nginx2" {
  image = docker_image.nginx.image_id
  name  = "nginx2"
  ports {
    internal = 80
    external = 8005
  }
}

