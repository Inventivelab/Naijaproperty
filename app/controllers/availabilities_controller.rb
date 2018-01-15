class AvailabilitiesController < ApplicationController

  def create
    @listing = Listing.friendly.find(params[:listing_id])

    @availability = Availability.new(availability_params)
    @availability.user_id = @listing.user.id
    @availability.listing_id = @listing.id
    if @availability.save
      first_name = params[:availability][:first_name]
      last_name = params[:availability][:last_name]
      email = params[:availability][:email]
      phone = params[:availability][:phone]
      message = params[:availability][:message]
      start_date = params[:availability][:start_date]
      end_date = params[:availability][:end_date]

      AvailabilityMailer.availability_created(@listing, @listing.user, @availability.email, @availability.first_name, @availability.last_name, @availability.message, @availability.phone, @availability.start_date, @availability.end_date).deliver
      #AvailabilityMailer.availability_created(self).deliver_now
      #AvailabilityMailer.send_autoreply_to_user(@listing.user, @availability.email).deliver
      flash[:notice] = "Thanks for reaching out. Your message sent succefully, We'll get back too you as soon as possible"
      redirect_to @listing
    else
      flash[:danger] = 'Error occured, message could not be sent.'
      redirect_to @listing
    end
  end

  private
    def send_sms(listing, availability)
      @client = Twilio::REST::Client.new
      @client.messages.create(
        from: '+1512-640-0359 ',
        to: listing.user.phone,
        body: "#{availability.first_name} send you a meesage about your '#{listing.listing_title}' "
      )
    end
    def availability_params
      params.require(:availability).permit(:email, :first_name, :last_name, :phone, :start_date, :end_date, :message)
    end
end
