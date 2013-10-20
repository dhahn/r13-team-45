# == Schema Information
#
# Table name: bills
#
#  id              :integer          not null, primary key
#  recurring       :boolean          default(FALSE)
#  interval        :string(255)
#  specific_day_of :integer
#  body            :string(255)
#  value           :integer          default(0)
#  user_id         :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  amount          :float
#  room_id         :integer
#

class Bill < ActiveRecord::Base
  include ValueModuloable
  include IntervalValidatable
  include SpecificDayValidatable

  attr_accessible :body, :interval, :recurring, :specific_day_of, :value, :user_id, :amount, :room_id

  belongs_to :user
  belongs_to :room

  validates_presence_of :body
  validates_presence_of :value
  validates_presence_of :amount
  validates_numericality_of :amount, :on => :create, :greater_than_or_equal_to => 0, :message => "Must be a number greater than 0"

  after_save :check_for_tag
  
  def reset_completion
    self.value =  0
    self.save
  end

  def notes
    Note.where(note_type: "Bill", note_type_id: self.id)
  end
  
  def self.all_recurring
    Bill.where(:recurring => true)
  end
  
  private

    def check_for_tag
      tag_regex = /(?:^|\s)@(\w+)(?=\s|$|\.|\?|!|&|,|<)/
      tag_matches = self.body.scan(tag_regex)
      tag_matches.each do |match|
        tagged_user = User.find_by_tag_name(match.first)
        self.body.gsub!(tag_regex, " <span class='tagname'>@#{match.first}</span>")
        self.save
        if self.user.room.users.include? tagged_user
          n = Notification.new(user_id: tagged_user.id, body: "placeholder body")
          n.save
          n.update_attributes(body: "@#{self.user.tag_name} just tagged you in a <a href=\"/#{self.class.name.underscore.pluralize}/#{self.id}\">Bill!</a>")
        end
      end
    end

end
