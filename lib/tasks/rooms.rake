namespace :rooms do
  task :clean => :environment do
    puts Room.all_empty.inspect
  end
end
