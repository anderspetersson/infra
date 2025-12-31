Traefik
---------------
traefik is managed with helm:

    helm upgrade --install -f homelab/traefik/values.yaml traefik traefik/traefik -n default
