# == Schema Information
#
# Table name: check_lists
#
#  id      :integer          not null, primary key
#  user_id :integer
#  title   :string(255)
#  room_id :integer
#

class CheckList < ActiveRecord::Base
  default_scope order('created_at DESC')
  attr_accessible :title, :user_id, :check_list_items_attributes, :room_id

  has_many :check_list_items, :dependent => :delete_all
  belongs_to :user
  belongs_to :room

  accepts_nested_attributes_for :check_list_items

  validates_presence_of :title
  validates_presence_of :user_id
  validates_presence_of :room_id

  def notes
    Note.where(note_type: "CheckList", note_type_id: self.id)
  end
end
