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
  has_many :check_lists, :dependent => :delete_all
  has_many :check_list_items, :dependent => :delete_all
  has_many :poll_lists, :dependent => :delete_all
  has_many :poll_list_items, :dependent => :delete_all
  has_many :chore_lists, :dependent => :delete_all
  has_many :chore_list_items, :dependent => :delete_all
  has_many :chore_list_recurring_items, :dependent => :delete_all
  has_many :bills, :dependent => :delete_all
  has_many :notes, :dependent => :delete_all
  has_many :pictures, :dependent => :delete_all
  before_destroy :unassign_user_room

  validates_presence_of :name
  
  GUEST_ROOM_ID = 1
  
  def self.all_empty
    empty = []
    Room.all.each do |room|
      if room.users.blank?
        empty.push room unless room.id == Room::GUEST_ROOM_ID
      end
    end
    empty
  end

  private

  def unassign_user_room
    User.where(room_id: self.id).each do |user|
      user.room_id = nil
      user.save
    end
  end

end
