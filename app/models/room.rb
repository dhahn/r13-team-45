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
  has_many :check_lists
  has_many :check_list_items
  has_many :poll_lists
  has_many :poll_list_items
  has_many :chore_lists
  has_many :chore_list_items
  has_many :chore_list_recurring_items
  has_many :bills
  has_many :notes
  has_many :pictures

  validates_presence_of :name
  
  GUEST_ROOM_ID = 1
end
