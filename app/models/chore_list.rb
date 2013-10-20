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
  default_scope order('created_at DESC')
  DAYS_OF_WEEK = [["Sunday", 1],["Monday", 2], ["Tuesday",3],["Wednesday",4],["Thursday",5],["Friday",6],["Saturday",7]]
  DAYS_OF_MONTH = 1..31
  attr_accessible :title, :user_id, :chore_list_items_attributes, :chore_list_recurring_items_attributes, :room_id

  belongs_to :user
  belongs_to :room
  has_many :chore_list_items, :dependent => :delete_all
  has_many :chore_list_recurring_items

  validates_presence_of :title
  validates_presence_of :user_id
  validates_presence_of :room_id

  accepts_nested_attributes_for :chore_list_items
  accepts_nested_attributes_for :chore_list_recurring_items

  def notes
    Note.where(note_type: "ChoreList", note_type_id: self.id)
  end
end
