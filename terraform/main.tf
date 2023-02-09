terraform {
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "2.26.0"
    }
  }
}

provider "digitalocean" {
  token = var.DO_TOKEN
}

resource "digitalocean_kubernetes_cluster" "api_cluster" {
  name   = "ks8-fastapi-web"
  region = var.region_ny

  version = var.version_k8s

  node_pool {
    name       = var.name
    size       = var.size
    node_count = var.node_count


    taint {
      key    = var.key
      value  = var.value
      effect = var.effect
    }
  }
}