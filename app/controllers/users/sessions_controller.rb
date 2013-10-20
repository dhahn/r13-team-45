class Users::SessionsController < Devise::SessionsController
  skip_load_and_authorize_resource
  
  def create_guest
    guest_user = new_guest_user
    guest_user.save
    self.resource = warden.authenticate!(auth_options)
    set_flash_message(:notice, :signed_in) if is_navigational_format?
    sign_in(resource_name, resource)
    respond_with resource, :location => after_sign_in_path_for(resource)
  end

end
