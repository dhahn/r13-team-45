# == Schema Information
#
# Table name: poll_lists
#
#  id       :integer          not null, primary key
#  user_id  :integer
#  question :string(255)
#  room_id  :integer
#

class PollList < ActiveRecord::Base
  attr_accessible :question, :user_id, :poll_list_items_attributes, :room_id

  has_many :poll_list_items
  belongs_to :user
  belongs_to :room

  validates_presence_of :question
  validates_presence_of :user_id
  validates_presence_of :room_id

  accepts_nested_attributes_for :poll_list_items
end
