class Users::RegistrationsController < Devise::RegistrationsController
  skip_load_and_authorize_resource
  
  def new
    if params[:token]
      @invitation = Invitation.find_by_token(params[:token])
    end
    super
  end
  
end 
