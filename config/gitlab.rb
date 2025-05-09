################################################################################
# GitLab Omnibus Configuration - Lightweight Setup
# Optimized for low-resource environments (e.g., local or small VPS)
################################################################################

# Set custom SSH port for Git access
gitlab_rails['gitlab_shell_ssh_port'] = 52525

################################################################################
# Optional -
# disabling services
################################################################################

# Disable usage metrics
gitlab_rails['usage_ping_enabled'] = false
gitlab_rails['metrics_enabled'] = false

# Disable Geo (if not in use)
geo_secondary['enable'] = false

# Disable Mattermost (if not in use)
mattermost['enable'] = false

# Disable GitLab Pages (if you don't use it for website hostingg)
pages_external_url = nil
gitlab_pages['enable'] = false

################################################################################

# Lightweight Puma/Sidekiq/Monitoring configuration
puma['worker_processes'] = 0                     # Use single-threaded Puma (less CPU/RAM)
sidekiq['concurrency'] = 10                      # Lower Sidekiq concurrency
prometheus_monitoring['enable'] = false          # Disable built-in Prometheus (saves RAM)

# Gitaly optimization (limits repo concurrency and parallel command spawning)
gitaly['configuration'] = {
  concurrency: [
    {
      rpc: "/gitaly.SmartHTTPService/PostReceivePack",
      max_per_repo: 3,
    },
    {
      rpc: "/gitaly.SSHService/SSHUploadPack",
      max_per_repo: 3,
    },
  ],
}
gitaly['env'] = {
  'GITALY_COMMAND_SPAWN_MAX_PARALLEL' => '2',
  'MALLOC_CONF' => 'dirty_decay_ms:1000,muzzy_decay_ms:1000'
}

# Global memory tuning for Ruby processes
gitlab_rails['env'] = {
  'MALLOC_CONF' => 'dirty_decay_ms:1000,muzzy_decay_ms:1000'
}

# External URL (update this for your server name or domain)
external_url "https://YOUR_SERVER_NAME"

# Disable Let's Encrypt and HTTPS (handled externally, e.g., by reverse proxy)
letsencrypt['enable'] = false
nginx['listen_port'] = 80
nginx['listen_https'] = false
