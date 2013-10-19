namespace :nginx do 
  task :install, roles: :web do
    #TODO write this method!
  end
  after "deploy:install", "nginx:install"

  task :setup, roles: :web do 
    template "nginx_unicorn.erb", "/tmp/#{application}_nginx_conf"	
    run "#{sudo} mv /tmp/#{application}_nginx_conf /etc/nginx/conf.d/#{application}.conf"
    run "#{sudo} rm -f /etc/nginx/conf.d/default.conf"
    restart
  end
  after "deploy:setup", "nginx:setup"

  %w[start stop restart].each do |command|
    task command, roles: :web do
      run "#{sudo} service nginx #{command}"
    end
  end
end
