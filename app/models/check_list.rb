# == Schema Information
#
# Table name: check_lists
#
#  id      :integer          not null, primary key
#  user_id :integer
#  title   :string(255)
#

class CheckList < ActiveRecord::Base
  attr_accessible :title, :user_id

  has_many :items
  belongs_to :user

  validates_presence_of :title
  validates_presence_of :user_id
end
