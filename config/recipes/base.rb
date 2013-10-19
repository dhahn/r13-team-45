def template(from, to)
  erb = File.read(File.dirname(__FILE__)+"/templates/#{from}")
  put ERB.new(erb).result(binding), to
end

def set_default(name, *args, &block)
  set(name, *args, &block) unless exists?(name)
end

namespace :deploy do
  desc "Install Everything"
  task :install do 
    #Stuff to come!
  end
end
