# == Schema Information
#
# Table name: notifications
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  body       :string(255)
#  read       :boolean          default(FALSE)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Notification < ActiveRecord::Base
  attr_accessible :body, :read, :user_id

  validates_presence_of :body
  validates_presence_of :user_id
  belongs_to :user
  
  def self.all_read_over_one_week_old
    Notification.where("read = true AND updated_at < ?", 1.week.ago)
  end

end
