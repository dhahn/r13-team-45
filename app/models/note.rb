# == Schema Information
#
# Table name: notes
#
#  id           :integer          not null, primary key
#  user_id      :integer
#  note_type    :string(255)
#  note_type_id :integer
#  body         :string(255)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Note < ActiveRecord::Base
  attr_accessible :user_id, :note_type, :note_type_id, :body

  validates_presence_of :user_id
  validates_presence_of :note_type
  validates_presence_of :note_type_id
  validates_presence_of :body
  belongs_to :user
end
