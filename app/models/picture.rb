# == Schema Information
#
# Table name: pictures
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  filename   :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  room_id    :integer
#

class Picture < ActiveRecord::Base
  default_scope order('created_at DESC')
  attr_accessible :filename, :user_id, :room_id

  validates_presence_of :filename
  validates_presence_of :user_id
  validates_presence_of :room_id

  belongs_to :user
  belongs_to :room
end
