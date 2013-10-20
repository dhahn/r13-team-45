class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :authenticate_user!
  before_filter :verify_room_for_user

  load_and_authorize_resource

  private

    def after_sign_up_path_for(resource)
      after_sign_in_path_for(resource) 
    end

    def guest_user
      User.find(session[:guest_user_id].nil? ? 
      session[:guest_user_id] = create_guest_user.id : 
      session[:guest_user_id]) 
    end

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
