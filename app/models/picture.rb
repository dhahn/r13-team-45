class Picture < ActiveRecord::Base
  attr_accessible :filename, :user_id

  validates_presence_of :filename
  validates_presence_of :user_id
  belongs_to :user_id
end
