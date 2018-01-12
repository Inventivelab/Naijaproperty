class Availability < ApplicationRecord
  # after_create_commit :create_notification
  belongs_to :listing
  belongs_to :user
end
