class AvailabilitiesController < ApplicationController

  def create
    @listing = Listing.friendly.find(params[:listing_id])

    @availability = Availability.new(availability_params)
    @availability.user_id = current_user.id
    @availability.listing_id = @listing.id
    if @availability.save
      first_name = params[:availability][:first_name]
      last_name = params[:availability][:last_name]
      email = params[:availability][:email]
      phone = params[:availability][:phone]
      message = params[:availability][:message]
      start_date = params[:availability][:start_date]
      end_date = params[:availability][:end_date]

      AvailabilityMailer.availability_created(@listing.user, @availability.email, @availability.first_name, @availability.last_name, @availability.message, @availability.phone, @availability.start_date, @availability.end_date).deliver
      flash[:notice] = "Thanks for reaching out. Your message sent succefully, We'll get back too you as soon as possible"
      redirect_to @listing
    else
      flash[:danger] = 'Error occured, message could not be sent.'
      render :new
    end
  end

  private
    def availability_params
      params.require(:availability).permit(:email, :first_name, :last_name, :phone, :start_date, :end_date, :message)
    end
end
