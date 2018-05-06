class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :omniauthable

  attr_accessor :login
  has_many :listings, dependent: :destroy
  has_many :availabilities, dependent: :destroy
  has_many :notifications, dependent: :destroy
  has_many :contacts, dependent: :destroy
  has_many :pictures, dependent: :destroy
  has_many :logos, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :reviews, dependent: :destroy


  # has_one :setting, dependent: :nullify
  after_create :add_setting

  validates :first_name, presence: true, length:{maximum: 20}
  validates :last_name, presence: true,  length:{maximum: 20}
  validates :username, presence: true, uniqueness: { case_sensitive: false }
  validates_format_of :username, with: /^[a-zA-Z0-9_\.]*$/, :multiline => true
  validate :validate_username



   extend FriendlyId
   friendly_id :username, use: :slugged_user

   def validate_username
   if User.where(email: username).exists?
     errors.add(:username, :invalid)
   end
 end

#  def self.search(search)
#   where("name LIKE ? OR ingredients LIKE ? OR cooking_instructions LIKE ?", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%")
# end

 def self.search(search)
  where("email ILIKE ? OR first_name ILIKE ? OR last_name ILIKE ? OR address ILIKE ?", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%")
end

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

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions.to_h).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    elsif conditions.has_key?(:username) || conditions.has_key?(:email)
      conditions[:email].downcase! if conditions[:email]
      where(conditions.to_h).first
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
