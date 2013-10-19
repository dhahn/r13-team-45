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
  NOTE_TYPES = %w{Room CheckList PollList ChoreList BillList Picture}
  attr_accessible :user_id, :note_type, :note_type_id, :body

  validates_presence_of :user_id
  validates_presence_of :note_type
  validates_presence_of :note_type_id
  validates_presence_of :body

  validate :known_note_type
  belongs_to :user

  scope :room_notes, ->(room_id) { where(note_type: "Room", note_type_id: room_id) }

  private
    def known_note_type
      unless NOTE_TYPES.include? self.note_type
        errors.add(:note_type, "should be one of #{NOTE_TYPES}")
      end
    end
  
end
