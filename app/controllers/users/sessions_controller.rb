class Users::SessionsController < Devise::SessionsController
  skip_load_and_authorize_resource
  
  def create_guest
    user = new_guest_user
    sign_in(:user, user)
    respond_with user, :location => after_sign_in_path_for(user)
  end

end
