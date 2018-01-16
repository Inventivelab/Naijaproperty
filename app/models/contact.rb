class Contact < ApplicationRecord
  belongs_to :user

  validates :first_name, presence: true
    validates :email, presence: true,
                  format: /\A\S+@\S+\z/
    validates :message, length: { minimum: 10 }
end
