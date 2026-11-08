# Copy to local.fish and adjust per host. 

# restic credentials (file uses 'export KEY=VALUE' lines, fish understands that)
test -f ~/.restic/env.s3-config; and source ~/.restic/env.s3-config

# Network interface for nload
alias nload 'nload ens3'

# Caddy in docker
alias reload 'docker exec caddy_IA caddy reload --config /etc/caddy/Caddyfile'
alias rl 'docker exec caddy_IA caddy reload --config /etc/caddy/Caddyfile'
alias fmt 'docker exec caddy_IA caddy fmt --overwrite /etc/caddy/Caddyfile'
