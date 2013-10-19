class ChoreList < ActiveRecord::Base
  attr_accessible :title, :user_id

  belongs_to :user
  has_many :items
  has_many :recurring_items
end
