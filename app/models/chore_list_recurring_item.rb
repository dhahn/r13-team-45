# == Schema Information
#
# Table name: chore_list_recurring_items
#
#  id              :integer          not null, primary key
#  chore_list_id   :integer
#  interval        :string(255)
#  specific_day_of :integer
#  body            :string(255)
#  value           :integer          default(0)
#  room_id         :integer
#

class ChoreListRecurringItem < ActiveRecord::Base
  include ValueModuloable
  include IntervalValidatable
  include SpecificDayValidatable

  attr_accessible :interval, :specific_day_of, :body, :value, :chore_list_id, :room_id

  belongs_to :chore_list
  belongs_to :room

  validates_presence_of :body
  validates_presence_of :value
  validates_presence_of :interval
  validates_presence_of :room_id
end
