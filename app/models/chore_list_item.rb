# == Schema Information
#
# Table name: chore_list_items
#
#  id            :integer          not null, primary key
#  chore_list_id :integer
#  body          :string(255)
#  value         :integer          default(0)
#  room_id       :integer
#

class ChoreListItem < ActiveRecord::Base
  include ValueModuloable

  attr_accessible :body, :value, :chore_list_id, :room_id

  belongs_to :chore_list
  belongs_to :room

  validates_presence_of :body
  validates_presence_of :value
  validates_presence_of :room_id

end
