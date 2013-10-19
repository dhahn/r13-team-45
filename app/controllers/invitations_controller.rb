class InvitationsController < ApplicationController

  def new
    @invitation = Invitation.new
  end

  def create
    @invitation = Invitation.new(params[:invitation])
    @invitation.sender = current_user
    @invitation.save
    InvitationMailer.invite(@invitation).deliver
    flash[:notice] = "Invitation sent"
    redirect_to root_path
  end
end
