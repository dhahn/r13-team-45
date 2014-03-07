class NotificationMailer < ActionMailer::Base
  
  def send(notification)
    @notification = notification
    @url = "#{root_url}notifications"
    @user = User.find(notification.user_id)
    if @user.notify_by_email
      subject = "Fridge: New Notification"
      mail(to: @user.email, subject: subject)
    end
  end

end
