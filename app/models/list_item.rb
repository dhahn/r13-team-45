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

class ListItem < ActiveRecord::Base
  # attr_accessible :title, :body
end
