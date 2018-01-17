class Availability < ApplicationRecord
  # after_create_commit :create_notification
  belongs_to :listing
  belongs_to :user

  validates :first_name, :last_name, :email,  presence: true
  validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
end
