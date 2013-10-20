# == Schema Information
#
# Table name: bills
#
#  id              :integer          not null, primary key
#  recurring       :boolean          default(FALSE)
#  interval        :string(255)
#  specific_day_of :integer
#  body            :string(255)
#  value           :integer          default(0)
#  user_id         :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  amount          :float
#  room_id         :integer
#

class Bill < ActiveRecord::Base
  include ValueModuloable
  include IntervalValidatable
  include SpecificDayValidatable
  attr_accessible :body, :interval, :recurring, :specific_day_of, :value, :user_id, :amount, :room_id

  belongs_to :user
  belongs_to :room

  validates_presence_of :body
  validates_presence_of :value
  validates_presence_of :amount
end
