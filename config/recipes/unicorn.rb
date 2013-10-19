set_default(:unicorn_user) { user }
set_default(:unicorn_pid) { "#{shared_path}/pids/unicorn.pid" }
set_default(:unicorn_config) { "#{shared_path}/config/unicorn.rb" }
set_default(:unicorn_log) { "#{shared_path}/log/unicorn.log" }
set_default(:unicorn_workers, 2)

namespace :unicorn do
  desc "Setup Unicorn initializer and app configuration"
  task :setup, roles: :web do
    run "mkdir -p #{shared_path}/config"
    template "unicorn.rb.erb", unicorn_config
    template "unicorn_init.erb", "/tmp/unicorn_init"
    run "chmod +x /tmp/unicorn_init"
    run "#{sudo} mv /tmp/unicorn_init /etc/init.d/unicorn_#{application}"
  end
  after "deploy:setup", "unicorn:setup"

  desc "delete unicorn socket"
  task :delete_sock, roles: :web do
    run "#{sudo} rm /tmp/unicorn.#{application}.sock" 
  end

  %w[start stop restart].each do |command|
    desc "#{command} unicorn"
    task command, roles: :web do
      run "#{sudo} service unicorn_#{application} #{command}"
    end
  end
end
