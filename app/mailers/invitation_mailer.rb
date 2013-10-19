class InvitationMailer < ActionMailer::Base
  
  def invite(invitation)
    subject = "Invitation to The Fridge"
    recipients = invitation.recipient_email
    @user = invitation.sender
    @url = "#{root_url}users/sign_up?token=#{invitation.token}"
    from = invitation.sender.email
    mail(to: recipients, subject: subject, from: from)
  end
end
