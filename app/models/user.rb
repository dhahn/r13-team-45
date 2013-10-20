# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  notify_by_email        :boolean          default(FALSE)
#  room_id                :integer
#  provider               :string(255)
#  uid                    :string(255)
#  name                   :string(255)
#  guest                  :boolean
#  tag_name               :string(255)
#

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  devise :omniauthable, :omniauth_providers => [:facebook]

  attr_accessible :email, :password, :password_confirmation, :remember_me, :room_id, :notify_by_email, :provider, :uid, :name, :guest, :tag_name

  belongs_to :room
  has_many :notes, :dependent => :delete_all
  has_many :notifications, :dependent => :delete_all
  has_many :pictures, :dependent => :delete_all
  has_many :check_lists, :dependent => :delete_all
  has_many :poll_lists, :dependent => :delete_all
  has_many :bills, :dependent => :delete_all
  has_many :chore_lists, :dependent => :delete_all

  validate :default_guest
  after_save :default_tag_name
  validates_presence_of :email

  def name_or_email
    self.name || self.email
  end

  def notifications_for_this_week
    self.notifications.where("read = false OR updated_at > ?", Date.today - 7)
  end

  def self.find_for_facebook_oauth(auth, signed_in_resource=nil)
    user = User.where(:provider => auth.provider, :uid => auth.uid).first
    unless user
      user = User.create(:name =>     auth.extra.raw_info.name,
                         :provider => auth.provider,
                         :uid =>      auth.uid,
                         :email =>    auth.info.email,
                         :password => Devise.friendly_token[0,20]
                        )
    end
    user
  end
  
  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end

  def self.deprecated_guests
    where("guest = ? AND last_sign_in_at < ?", true, Date.today - 3)
  end
  
  private
    def default_guest
      unless self.guest
        self.guest = false
      end
    end

    def default_tag_name
      unless self.tag_name
        self.tag_name = self.email.split("@").first
      end
    end
end
