class InvitationMailer < ActionMailer::Base
  
  def invite(invitation)
    subject = "Invitation to The Fridge"
    recipients = invitation[:recipient_email]
    from = invitation[:sender].email
    body = "#{invitation[:sender].name} wants you to join The Fridge, an application to help roommates manage their homes!"
    mail(to: recipients, subject: subject, from: from, body: body)
  end
end
