set :application, "ozon-expert"
set :repo_url, "git@github.com:Eviath/ozon-expert.git"
set :branch, "capistrano"
set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system', 'public' )
set :rvm_ruby_version, '2.6.3'
set :passenger_restart_with_touch, true
set :default_shell, '/bin/bash -l'

SSHKit.config.command_map[:sidekiq] = "bundle exec sidekiq"
SSHKit.config.command_map[:sidekiqctl] = "bundle exec sidekiqctl"