module ValueModuloable
  extend ActiveSupport::Concern

  included do
    before_save :modulo_value
  end

  def modulo_value
    if self.value > 1
      self.value = self.value % 2
    end
  end
end
