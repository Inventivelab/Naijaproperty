class ListingsChannel < ApplicationCable::Channel
    def subscribed
      stream_from "listings_#{params['listing_id']}_channel"
    end
  
    def unsubscribed
    end
  
    def send_comment(data)
      current_user.comments.create!(content: data['comment'], listing_id: data['listing_id'])
    end
  end