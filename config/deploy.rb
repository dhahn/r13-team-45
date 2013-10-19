server "50.116.41.68", :app, :web

set :user, "www-data"
set :application, "roommates"
set :application_port, "6969"
set :deploy_to, "/home/www-data/#{application}"
set :deploy_via, :remote_cache
set :use_sudo, false
set :scm, "git"
set :repository,  "git@github.com:railsrumble/r13-team-45.git"
set :branch, "master"
set :environment, "production"

default_run_options[:pty] = true
default_run_options[:shell] = "/bin/bash --login"
ssh_options[:forward_agent] = true

require "bundler/capistrano"
load 'config/recipes/base'
load 'config/recipes/nginx'
load 'config/recipes/unicorn'
load 'deploy/assets'

before "deploy:assets:precompile", "deploy:copy_database_file"
after "deploy", "unicorn:stop", "unicorn:start"

namespace :deploy do
  task :copy_database_file do
    run "cp #{release_path}/config/database.yml.production #{release_path}/config/database.yml"
  end
end
