# == Schema Information
#
# Table name: chore_lists
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  room_id    :integer
#

class ChoreList < ActiveRecord::Base
  attr_accessible :title, :user_id, :chore_list_items_attributes, :chore_list_recurring_items_attributes, :room_id

  belongs_to :user
  belongs_to :room
  has_many :chore_list_items
  has_many :chore_list_recurring_items

  validates_presence_of :title
  validates_presence_of :user_id
  validates_presence_of :room_id

  accepts_nested_attributes_for :chore_list_items
  accepts_nested_attributes_for :chore_list_recurring_items
end
