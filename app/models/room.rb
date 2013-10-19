# == Schema Information
#
# Table name: rooms
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  address    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Room < ActiveRecord::Base
  attr_accessible :name, :address

  has_many :users

  validates_presence_of :name
end
