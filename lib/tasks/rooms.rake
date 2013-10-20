namespace :rooms do
  task :clean => :environment do
    Room.all_empty.destroy_all
  end
end
