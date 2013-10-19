# == Schema Information
#
# Table name: items
#
#  id         :integer          not null, primary key
#  type       :string(255)
#  body       :string(255)
#  value      :integer          default(0)
#  list_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class CheckListItem < Item
  before_save :modulo_value

  private

    def modulo_value
      if self.value > 1
        self.value = self.value % 2
      end
    end
end
