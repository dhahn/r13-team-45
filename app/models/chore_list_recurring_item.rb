# == Schema Information
#
# Table name: chore_list_recurring_items
#
#  id              :integer          not null, primary key
#  chore_list_id   :integer
#  interval        :string(255)
#  specific_day_of :integer
#  body            :string(255)
#  value           :integer          default(0)
#  room_id         :integer
#

class ChoreListRecurringItem < ActiveRecord::Base
  include ValueModuloable
  include IntervalValidatable
  include SpecificDayValidatable

  attr_accessible :interval, :specific_day_of, :body, :value, :chore_list_id, :room_id

  belongs_to :chore_list
  belongs_to :room

  validates_presence_of :body
  validates_presence_of :value
  validates_presence_of :interval
  validates_presence_of :room_id
  after_save :check_for_tag
  
  def reset_completion
    self.value = 0
    self.save
  end

  private

    def check_for_tag
      tag_matches = self.body.scan(/(?:^|\s)@(\w+)(?=\s|$|\.|\?|!|&|,|<)/)
      tag_matches.each do |match|
        tagged_user = User.find_by_tag_name(match.first)
        if self.chore_list.room.users.include? tagged_user
          n = Notification.new(user_id: tagged_user.id, body: "placeholder body")
          n.save
          n.update_attributes(body: "You just got <a href=\"/#{self.chore_list.class.name.underscore.pluralize}/#{self.chore_list_id}\">t@gged!</a>")
        end
      end
    end

end
