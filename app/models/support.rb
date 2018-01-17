class Support < ApplicationRecord
    validates :name, presence: true
    validates :email, presence: true,
                  format: /\A\S+@\S+\z/
    validates :message, length: { minimum: 10 }
end
