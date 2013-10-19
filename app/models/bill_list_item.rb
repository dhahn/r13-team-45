class BillListItem < ActiveRecord::Base
  include ValueModuloable

  attr_accessible :body, :value, :bill_list_id

  belongs_to :bill_list

  validates_presence_of :body
  validates_presence_of :value
end
