class Review < ApplicationRecord
  belongs_to :user

  validates :content, presence: true, length: { minimum: 5, maximimum: 1000 }

  after_create_commit { ReviewBroadcastJob.perform_later(self) }
end
