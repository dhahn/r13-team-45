# == Schema Information
#
# Table name: lists
#
#  id         :integer          not null, primary key
#  type       :string(255)
#  title      :string(255)
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class List < ActiveRecord::Base
  attr_accessible :title, :user_id

  has_many :items
  has_many :recurring_items

  validates_presence_of :title
  validates_presence_of :user_id
end
