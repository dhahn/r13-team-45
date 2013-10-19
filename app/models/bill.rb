class Bill < ActiveRecord::Base
  include ValueModuloable
  include IntervalValidatable
  include SpecificDayValidatable
  attr_accessible :body, :interval, :recurring, :specific_day_of, :value, :user_id

  belongs_to :user

  scope :room_bills, ->(room_id) { joins(:user => :room).where("room_id = ?", room_id) }

  validates_presence_of :body
  validates_presence_of :value
  validates_presence_of :interval
  validates_presence_of :amount
end
