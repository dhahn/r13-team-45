module IntervalValidatable
  extend ActiveSupport::Concern

  INTERVALS = %w{Once Weekly Monthly Completion}

  included do
    validate :known_interval
  end

  def known_interval
    unless INTERVALS.include? self.interval
      errors.add(:interval, "should be one of #{INTERVALS}")
    end
  end
end
