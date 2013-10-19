class BillList < ActiveRecord::Base
  attr_accessible :title, :user_id, :bill_list_items_attributes, :bill_list_recurring_items_attributes

  belongs_to :user
  has_many :bill_list_items
  has_many :bill_list_recurring_items

  accepts_nested_attributes_for :bill_list_items
  accepts_nested_attributes_for :bill_list_recurring_items
end
