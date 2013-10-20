# == Schema Information
#
# Table name: poll_list_items
#
#  id           :integer          not null, primary key
#  poll_list_id :integer
#  body         :string(255)
#  value        :integer          default(0)
#  room_id      :integer
#  users_voted  :integer
#

class PollListItem < ActiveRecord::Base
  default_scope order('created_at DESC')
  attr_accessible :body, :value, :poll_list_id, :room_id, :users_voted

  belongs_to :poll_list
  belongs_to :room

  validates_presence_of :body
  validates_presence_of :value
  validates_presence_of :room_id
  validate :unique_array

  before_save :change_users_vote
  after_save :check_for_tag

  private

    def change_users_vote
      if users_voted_changed?
        added_user_id = users_voted - users_voted_was unless users_voted_was.blank?
        added_user_id = users_voted if users_voted_was.blank?
        added_user_id = added_user_id[0].to_i
        PollListItem.where("poll_list_id = ? AND id != ?", self.poll_list_id, self.id).each do |item|
          if !item.users_voted.blank? && item.users_voted.include?(added_user_id)
            final_users_voted = item.users_voted - [added_user_id]
            final_value = item.value - 1 unless item.value == 0
            item.update_attributes(users_voted: final_users_voted, value: final_value) 
          end
        end
      end
    end

    def unique_array
      unless users_voted.blank?
        unless users_voted.uniq.length == users_voted.length
          errors.add(:users_voted, "user can only vote once")
        end
      end
    end

    def check_for_tag
      tag_regex = /(?:^|\s)@(\w+)(?=\s|$|\.|\?|!|&|,|<)/
      tag_matches = self.body.scan(tag_regex)
      tag_matches.each do |match|
        tagged_user = User.find_by_tag_name(match.first)
        self.body.gsub!(tag_regex, " <span class='tagname'>@#{match.first}</span>")
        self.save
        if self.poll_list.room.users.include? tagged_user
          n = Notification.new(user_id: tagged_user.id, body: "placeholder body")
          n.save
          n.update_attributes(body: "You just got <a href=\"/#{self.poll_list.class.name.underscore.pluralize}/#{self.poll_list_id}\">t@gged!</a>")
        end
      end
    end
end
