# == Schema Information
#
# Table name: recurring_items
#
#  id              :integer          not null, primary key
#  type            :string(255)
#  interval        :string(255)
#  specific_day_of :string(255)
#  body            :string(255)
#  value           :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

require 'test_helper'

class RecurringItemTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
