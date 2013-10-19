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

class Item < ActiveRecord::Base
  include TypeValidatable
  TYPES = %w{CheckListItem PollListItem}

  attr_accessible :body, :value, :list_id, :type

  belongs_to :list

  validates_presence_of :body
  validates_presence_of :value

  private
    def types
      TYPES
    end
end
