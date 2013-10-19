module TypeValidatable
  extend ActiveSupport::Concern

  included do
    validate :known_type
  end

  def known_type
    unless types.include? self.type
      errors.add(:type, "should be one of #{types}")
    end
  end
end
