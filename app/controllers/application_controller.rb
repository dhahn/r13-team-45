class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :authenticate_user!
  before_filter :verify_room_for_user
  load_and_authorize_resource

  private

    def new_guest_user
      User.create(:name => "Guest", 
                  :email => "Guest_#{Time.now.to_i}#{rand(99)}@example.com",
                  :password => "guest_account_#{Time.now.to_i}#{rand(10000)}",
                  :room_id => Room::GUEST_ROOM_ID,
                  :guest => true)
    end

    def verify_room_for_user
      unless current_user.nil?
        if current_user.room_id.blank?
          redirect_to new_room_path
        end
      end
    end
end
