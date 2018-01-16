class TellAFriendsController < ApplicationController
    
    def create
        @listing = Listing.friendly.find(params[:listing_id])
    
        @tell_a_friend = TellAFriend.new(tell_a_friend_params)
        @tell_a_friend.listing_id = @listing.id
        if @tell_a_friend.save
          your_name = params[:tell_a_friend][:your_name]
          friend_name = params[:tell_a_friend][:friend_name]
          friend_email = params[:tell_a_friend][:friend_email]
          message = params[:tell_a_friend][:message]
    
          TellAFriendMailer.tell_a_friend_created(@listing,  @tell_a_friend.friend_email, @tell_a_friend.your_name, @tell_a_friend.friend_name, @tell_a_friend.message).deliver
          flash[:notice] = "Your message/recomendation has been sent to your friend successfully..."
          redirect_to @listing
        else
          flash[:alert] = 'Error occured, message could not be sent.'
          redirect_to @listing
        end
      end
    
      private
        
        def tell_a_friend_params
          params.require(:tell_a_friend).permit(:friend_email, :your_name, :friend_name, :message)
        end
    
end
