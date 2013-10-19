class InvitationsController < ApplicationController

  def create
    @invitation = params[:invitation]    
    @invitation[:sender] = current_user
    InvitationMailer.invite(@invitation).deliver
    flash[:notice] = "Invitation sent"
    redirect_to '/'
  end
end
