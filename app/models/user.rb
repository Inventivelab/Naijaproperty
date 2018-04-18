class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :omniauthable

  has_many :listings, dependent: :destroy
  has_many :availabilities, dependent: :destroy
  has_many :notifications, dependent: :destroy
  has_many :contacts, dependent: :destroy
  has_many :pictures, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :reviews, dependent: :destroy


  has_one :setting, dependent: :nullify
  after_create :add_setting

  validates :first_name, presence: true, length:{maximum: 20}
  validates :last_name, presence: true,  length:{maximum: 20}
  validates :username, presence: true, uniqueness: { case_sensitive: false }



   extend FriendlyId
   friendly_id :username, use: :slugged_user

  def full_name
   [first_name, last_name].join(" ")
  end

  def add_setting
    Setting.create(user: self, enable_sms: true, enable_email: true)
  end

  def self.from_omniauth(auth)
    user = User.where(email: auth.info.email).first

    if user
      return user
    else
      where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
        user.email = auth.info.email
        user.password = Devise.friendly_token[0,20]
        user.first_name = auth.info.first_name
        user.last_name = auth.info.last_name
        user.username = [auth.info.name, auth.uid].join("-")
        #user.username = auth.extra.raw_info.username
        user.image = auth.info.image
        user.uid = auth.uid
        user.provider = auth.provider

        # If you are using confirmable and the provider(s) you use validate emails,
        # uncomment the line below to skip the confirmation emails.
        user.skip_confirmation!
      end
    end
  end
  def profile_image
   if self.pictures.length > 0
     self.pictures[0].avatar.url
   else
     avatar_url(user)
   end
 end

  def generate_pin
    self.pin = SecureRandom.hex(2)
    self.phone_verified = false
    save
  end

  def send_pin
    @client = Twilio::REST::Client.new
    @client.messages.create(
      from: '5126400359',
      to: self.phone,
      body: "Your pin is #{self.pin}"
    )
  end

  def verify_pin(entered_pin)
    update(phone_verified: true) if self.pin == entered_pin
  end

end
