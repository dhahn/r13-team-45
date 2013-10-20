class InvitationsController < ApplicationController

  def new
    authorize! :manual, "Stop" if current_user.guest
    @invitation = Invitation.new
  end

  def create
    authorize! :manual, "Stop" if current_user.guest
    @invitation = Invitation.new(params[:invitation])
    @invitation.sender = current_user
    @invitation.save
    InvitationMailer.invite(@invitation).deliver
    flash[:notice] = "Invitation sent"
    redirect_to root_path
  end
end
