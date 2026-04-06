terraform {
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "5.19.0-beta.4"
    }
  }
}

provider "cloudflare" {
}


variable "cloudflare_account_id" {
  description = "Cloudflare Account ID"
  type        = string
  sensitive   = true
}

variable "cloudflare_tunnel_id" {
  description = "Cloudflare Tunnel ID"
  type        = string
  sensitive   = true
}

resource "cloudflare_zero_trust_tunnel_cloudflared_config" "home_tunnel" {
  account_id = var.cloudflare_account_id
  tunnel_id  = var.cloudflare_tunnel_id

  config = {
    ingress = [
      {
          hostname = "www.anderspetersson.se"
          service  = "http://mini.local:80"
      },
      {
          hostname = "anderspetersson.se"
          service  = "http://mini.local:80"
      },
      {
          hostname = "www.bestofblocket.se"
          service  = "http://mini.local:80"
      },
      {
          hostname = "bestofblocket.se"
          service  = "http://mini.local:80"
      },
      {
          hostname = "www.quiz.me"
          service  = "http://mini.local:80"
      },
      {
          hostname = "quiz.me"
          service  = "http://mini.local:80"
      },
      {
          hostname = "www.quizme.se"
          service  = "http://mini.local:80"
      },
      {
          hostname = "quizme.se"
          service  = "http://mini.local:80"
      },
      {
          hostname = "www.quizportal.io"
          service  = "http://mini.local:80"
      },
      {
          hostname = "quizportal.io"
          service  = "http://mini.local:80"
      },
      {
          hostname = "*.quizportal.io"
          service  = "http://mini.local:80"
      },
      {
          # Respond with a `404` status code when the request does not match any of the previous hostnames.
          service  = "http_status:404"
      }]
    }
}
