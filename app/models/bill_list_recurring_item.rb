# == Schema Information
#
# Table name: recurring_items
#
#  id              :integer          not null, primary key
#  type            :string(255)
#  interval        :string(255)
#  specific_day_of :integer
#  body            :string(255)
#  value           :integer          default(0)
#  list_id         :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class BillListRecurringItem < ActiveRecord::Base
  include ValueModuloable
  include IntervalValidatable
  include SpecificDayValidatable

  attr_accessible :interval, :specific_day_of, :body, :value, :bill_list_id

  belongs_to :bill_list

  validates_presence_of :body
  validates_presence_of :value
  validates_presence_of :interval
end
