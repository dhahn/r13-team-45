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

class BillRecurringItem < RecurringItem
  before_save :modulo_value

  private

    def modulo_value
      if self.value > 1
        self.value = self.value % 2
      end
    end
end
