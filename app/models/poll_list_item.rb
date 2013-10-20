# == Schema Information
#
# Table name: poll_list_items
#
#  id           :integer          not null, primary key
#  poll_list_id :integer
#  body         :string(255)
#  value        :integer          default(0)
#  room_id      :integer
#

class PollListItem < ActiveRecord::Base
  attr_accessible :body, :value, :poll_list_id, :room_id

  belongs_to :poll_list
  belongs_to :room

  validates_presence_of :body
  validates_presence_of :value
  validates_presence_of :room_id
end
