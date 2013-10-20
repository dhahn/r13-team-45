# == Schema Information
#
# Table name: invitations
#
#  id              :integer          not null, primary key
#  recipient_email :string(255)
#  token           :string(255)
#  room_id         :string(255)
#  sender          :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

require 'test_helper'

class InvitationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
