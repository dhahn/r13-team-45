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
#  room_id      :integer
#

class Note < ActiveRecord::Base
  default_scope order('created_at DESC')
  NOTE_TYPES = %w{Room CheckList PollList ChoreList Bill Picture Note}
  attr_accessible :user_id, :note_type, :note_type_id, :body, :room_id, :created_at

  validates_presence_of :user_id
  validates_presence_of :note_type
  validates_presence_of :note_type_id
  validates_presence_of :body
  validates_presence_of :room_id

  validate :known_note_type
  validate :updatable_note_type_id
  after_save :check_for_tag
  belongs_to :user
  belongs_to :room

  scope :room_notes, ->(room_id) { where(note_type: "Room", note_type_id: room_id) }

  def notes
    Note.where(note_type: "Note", note_type_id: self.id)
  end

  private
    def known_note_type
      unless NOTE_TYPES.include? self.note_type
        errors.add(:note_type, "should be one of #{NOTE_TYPES}")
      end
    end

    def updatable_note_type_id
      current_user = User.find(self.user_id)
      note_type_ids_for_room = self.note_type == "Room" ?
        [current_user.room_id] :
        Room.where(id: current_user.room_id).first.send(self.note_type.underscore.pluralize).pluck(:id)
      unless note_type_ids_for_room.include? self.note_type_id
        errors.add(:note_type_id, "should match an item in the current user's room")
      end
    end

    def check_for_tag
      tag_regex = /(?:^|\s)@(\w+)(?=\s|$|\.|\?|!|&|,|<)/
      tag_matches = self.body.scan(tag_regex)
      tag_matches.each do |match|
        tagged_user = User.find_by_tag_name(match.first)
        self.body.gsub!(tag_regex, " <span class='tagname'>@#{match.first}</span>")
        self.save
        if self.user.room.users.include? tagged_user
          if self.note_type == "Room"
            notification_path = "/notes/#{self.id}"
            type_of_note = "Note"
          else
            notification_path = "/#{self.note_type.underscore.pluralize}/#{self.note_type_id}"
            type_of_note = self.note_type
          end
          n = Notification.new(user_id: tagged_user.id, body: "placeholder body")
          n.save
          n.update_attributes(body: "@#{self.user.tag_name} just tagged you in a <a href=\"#{notification_path}\">#{type_of_note}!</a>")
        end
      end
    end
  
end
