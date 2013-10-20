# == Schema Information
#
# Table name: poll_lists
#
#  id       :integer          not null, primary key
#  user_id  :integer
#  question :string(255)
#

class PollList < ActiveRecord::Base
  attr_accessible :question, :user_id, :poll_list_items_attributes

  has_many :poll_list_items
  belongs_to :user

  def notes
    Note.where(note_type: "PollList", note_type_id: self.id)
  end

  validates_presence_of :question
  validates_presence_of :user_id

  accepts_nested_attributes_for :poll_list_items
  scope :room_poll_lists, ->(room_id) { joins(:user => :room).where("room_id = ?", room_id) }
end
