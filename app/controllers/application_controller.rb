class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :authenticate_user!
  before_filter :verify_room_for_user

  load_and_authorize_resource

  private

    def verify_room_for_user
      unless current_user.nil?
        if current_user.room_id.blank?
          redirect_to new_room_path
        end
      end
    end
end
