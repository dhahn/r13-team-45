class Invitation < ActiveRecord::Base
  attr_accessible :recipient_email, :room_id, :token, :sender
  
  validate :recipient_is_not_registered
  before_create :generate_token

  private
  
    def recipient_is_not_registered
      errors.add :recipient_email, 'is already registered' if User.find_by_email(recipient_email)
    end

    def generate_token
      self.token = Digest::SHA1.hexdigest([Time.now, rand].join)
    end

end
