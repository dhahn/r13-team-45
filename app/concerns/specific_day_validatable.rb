module SpecificDayValidatable
  extend ActiveSupport::Concern

  included do
    validate :specific_day_of_for_valid_interval
  end

  def specific_day_of_for_valid_interval
    given_incorrect_interval? "Weekly", 1..7
    given_incorrect_interval? "Monthly", 1..31
  end

  def given_incorrect_interval? interval, range
    if self.interval == interval && not( (range).cover?(self.specific_day_of) )
      errors.add(:specific_day_of, "is out of range for given interval")
    end
  end
end
