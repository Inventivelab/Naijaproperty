class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

   validates :first_name, presence: true, length:{maximum: 20}
   validates :last_name, presence: true,  length:{maximum: 20}

   extend FriendlyId
   friendly_id :slug_users, use: :slugged

   def slug_users
     if self.username
       self.username
     else
       [first_name, last_name, id].join("")
     end
   end

   def full_name
    [first_name, last_name].join(" ")
  end
end
