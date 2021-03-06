# == Schema Information
#
# Table name: check_list_items
#
#  id            :integer          not null, primary key
#  check_list_id :integer
#  body          :string(255)
#  value         :integer          default(0)
#  room_id       :integer
#

class CheckListItem < ActiveRecord::Base
  default_scope order('created_at DESC')
  include ValueModuloable

  attr_accessible :body, :value, :check_list_id, :room_id

  belongs_to :check_list
  belongs_to :room

  validates_presence_of :body
  validates_presence_of :value
  validates_presence_of :room_id
  after_save :check_for_tag

  private

    def check_for_tag
      tag_regex = /(?:^|\s)@(\w+)(?=\s|$|\.|\?|!|&|,|<)/
      tag_matches = self.body.scan(tag_regex)
      tag_matches.each do |match|
        tagged_user = User.find_by_tag_name(match.first)
        self.body.gsub!(tag_regex, " <span class='tagname'>@#{match.first}</span>")
        self.save
        if self.check_list.room.users.include? tagged_user
          n = Notification.new(user_id: tagged_user.id, body: "placeholder body")
          n.save
          n.update_attributes(body: "@#{self.check_list.user.tag_name} just tagged you in a <a href=\"/#{self.check_list.class.name.underscore.pluralize}/#{self.check_list_id}\">List!</a>")
        end
      end
    end

end
