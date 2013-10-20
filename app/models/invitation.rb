# == Schema Information
#
# Table name: invitations
#
#  id              :integer          not null, primary key
#  recipient_email :string(255)
#  token           :string(255)
#  room_id         :string(255)
#  sender          :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class Invitation < ActiveRecord::Base
  attr_accessible :recipient_email, :room_id, :token, :sender
  
  validate :recipient_is_not_registered
  before_create :generate_token

  def self.deprecated
    Invitation.where("created_at < ?", 1.week.ago)
  end

  private
  
    def recipient_is_not_registered
      errors.add :recipient_email, 'is already registered' if User.find_by_email(recipient_email)
    end

    def generate_token
      self.token = Digest::SHA1.hexdigest([Time.now, rand].join)
    end

end
