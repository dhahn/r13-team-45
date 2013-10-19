# == Schema Information
#
# Table name: poll_lists
#
#  id       :integer          not null, primary key
#  user_id  :integer
#  question :string(255)
#

class PollList < ActiveRecord::Base
  attr_accessible :question, :user_id

  has_many :items
  belongs_to :user

  validates_presence_of :question
  validates_presence_of :user_id

end
