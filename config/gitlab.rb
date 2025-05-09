# SSH port
gitlab_rails['gitlab_shell_ssh_port'] = 52525


#LESSPOWER SETUP
puma['worker_processes'] = 0
sidekiq['concurrency'] = 10
prometheus_monitoring['enable'] = false
gitaly['configuration'] = {
  concurrency: [
    {
      rpc: "/gitaly.SmartHTTPService/PostReceivePack",
      max_per_repo: 3,
    }, {
      rpc: "/gitaly.SSHService/SSHUploadPack",
      max_per_repo: 3,
    },
  ],
}
gitaly['env'] = {
  'GITALY_COMMAND_SPAWN_MAX_PARALLEL' => '2',
  'MALLOC_CONF' => 'dirty_decay_ms:1000,muzzy_decay_ms:1000'
}
#
gitlab_rails['env'] = {
  'MALLOC_CONF' => 'dirty_decay_ms:1000,muzzy_decay_ms:1000'
}
#
external_url "https://YOUR_SERVER_NAME"
#
letsencrypt['enable'] = false
#
nginx['listen_port'] = 80
nginx['listen_https'] = false
