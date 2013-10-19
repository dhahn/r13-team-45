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

require 'test_helper'

class NoteTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
