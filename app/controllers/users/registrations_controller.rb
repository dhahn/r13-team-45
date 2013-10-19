class Users::RegistrationsController < Devise::RegistrationsController
  
  def new
    if params[:token]
      @invitation = Invitation.find_by_token(params[:token])
    end
    super
  end
  
end 
