class Message < ApplicationRecord
  belongs_to :user
  belongs_to :chat

  validates_presence_of :context, :chat_id, :user_id
  after_create_commit :create_notification

  def message_time
    self.created_at.strftime("%v")
  end

  private

    def create_notification
      if self.chat.sender_id == self.user_id
        sender = User.find(self.chat.sender_id)
        Notification.create(content: "New message from #{sender.full_name}", user_id: self.chat.recipent_id)
      else
        sender = User.find(self.chat.recipent_id)
        Notification.create(content: "New message from #{sender.full_name}", user_id: self.chat.sender_id)
      end
    end
end
