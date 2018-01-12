class Chat < ApplicationRecord
  belongs_to :sender, foreign_key: :sender_id, class_name: "User"
  belongs_to :recipent, foreign_key: :recipent_id, class_name: "User"

  has_many :messages, dependent: :destroy
  validates_uniqueness_of :sender_id, :recipent_id

  scope :involving, -> (user) {
    where("chats.sender_id = ? OR chats.recipent_id = ?", user.id, user.id)
  }

  scope :between, -> (user_A, user_B) {
    where("(chats.sender_id = ? AND chats.recipent_id = ?) OR (chats.sender_id = ? AND chats.recipent_id = ?)", user_A, user_B, user_B, user_A)
  }
end
