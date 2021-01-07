role :app, %w{root@167.71.52.121}
role :web, %w{root@167.71.52.121}
role :db,  %w{root@167.71.52.121}
set :linked_files, %w{config/master.key}
set :linked_dirs, %w{node_modules}
set :ssh_options, {
    :keepalive => true,
    :keepalive_interval => 30,
    forward_agent: false,
    auth_methods: %w(publickey)
}

