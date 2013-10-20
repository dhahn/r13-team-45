namespace :notifications do
  task :destroy_old => :environment do
    Notification.all_read_over_one_week_old.destroy_all
  end
end
