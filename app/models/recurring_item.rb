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

class RecurringItem < ActiveRecord::Base
  include TypeValidatable
  TYPES = %w{BillRecurringItem ChoreRecurringItem}

  attr_accessible :interval, :specific_day_of, :body, :value, :list_id, :type

  belongs_to :list

  INTERVALS = %w{Daily Weekly Monthly Completion}

  validates_presence_of :interval
  validate :known_interval
  validate :specific_day_of_for_valid_interval

  validates_presence_of :interval
  validates_presence_of :body
  validates_presence_of :value

  private
    def types
      TYPES
    end

    def known_interval
      unless INTERVALS.include? self.interval
        errors.add(:interval, "should be one of #{INTERVALS}")
      end
    end

    def specific_day_of_for_valid_interval
      if self.interval == "Weekly" && not( (1..7).cover?(self.specific_day_of) )
        errors.add(:specific_day_of, "is out of range for given interval")
      elsif self.interval == "Monthly" && not( (1..31).cover?(self.specific_day_of) )
        errors.add(:specific_day_of, "is out of range for given interval")
      end
    end
end
