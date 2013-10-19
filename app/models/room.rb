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

  scope :bill_lists, ->(room_id) { joins(:users => :bill_lists).where("rooms.id = ?", room_id) }
  scope :poll_lists, ->(room_id) { joins(:users => :poll_lists).where("rooms.id = ?", room_id) }
  scope :chore_lists, ->(room_id) { joins(:users => :chore_lists).where("rooms.id = ?", room_id) }
  scope :check_lists, ->(room_id) { joins(:users => :check_lists).where("rooms.id = ?", room_id) }
end
