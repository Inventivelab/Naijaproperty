class UsersChannel < ApplicationCable::Channel
    def subscribed
      stream_from "users_#{params['user_id']}_channel"
    end
  
    def unsubscribed
    end
  
    def send_review(data)
      current_user.reviews.create!(content: data['review'], user_id: data['user_id'])
    end
end