module IntervalValidatable
  extend ActiveSupport::Concern

  INTERVALS = %w{Weekly Monthly Completion}

  included do
    validate :known_interval
  end

  def known_interval
    if self.respond_to?(:recurring)
      if self.recurring
        unless INTERVALS.include? self.interval
          errors.add(:interval, "should be one of #{INTERVALS}")
        end
      end
    else
      unless INTERVALS.include? self.interval
        errors.add(:interval, "should be one of #{INTERVALS}")
      end
    end
  end
end
