namespace :guests do
  task :destroy_deprecated => :environment do
    User.deprecated_guests.destroy_all
  end
end
