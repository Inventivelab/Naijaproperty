class TellAFriendMailer < ApplicationMailer

    def tell_a_friend_created(listing, friend_email, your_name, friend_name, message)
      @listing = listing
      @friend_email = friend_email
      @your_name = your_name
      @friend_name = friend_name
      @message = message
  
      mail(to: @friend_email,
          from: "sales@naijaproperty.com",
          subject: "Your Friend #{your_name} send you a message about a property ")
    end
  end
  