class ChoreList < ActiveRecord::Base
  attr_accessible :title, :user_id, :chore_list_items_attributes, :chore_list_recurring_items_attributes

  belongs_to :user
  has_many :chore_list_items
  has_many :chore_list_recurring_items

  def notes
    Note.where(note_type: "ChoreList", note_type_id: self.id)
  end

  accepts_nested_attributes_for :chore_list_items
  accepts_nested_attributes_for :chore_list_recurring_items

  scope :room_chore_lists, ->(room_id) { joins(:user => :room).where("room_id = ?", room_id) }
end
