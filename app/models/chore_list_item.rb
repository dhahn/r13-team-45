# == Schema Information
#
# Table name: items
#
#  id         :integer          not null, primary key
#  type       :string(255)
#  body       :string(255)
#  value      :integer          default(0)
#  list_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class ChoreListItem < ActiveRecord::Base
  include ValueModuloable

  attr_accessible :body, :value, :chore_list_id

  belongs_to :chore_list

  validates_presence_of :body
  validates_presence_of :value

end
