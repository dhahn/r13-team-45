# == Schema Information
#
# Table name: list_items
#
#  id                :integer          not null, primary key
#  list_id           :integer
#  recurring_item_id :integer
#  item_id           :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

require 'test_helper'

class ListItemTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
