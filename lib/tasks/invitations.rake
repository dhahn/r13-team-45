namespace :invitations do
  task :destroy_deprecated do
    Invitation.deprecated.destroy_all
  end
end
