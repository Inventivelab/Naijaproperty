class UsersController < ApplicationController
  before_action :set_user, only: [:show, :profile_picture, :phone_verification]
  before_action :authenticate_user!, except: [:show]
  before_action :user_listing, only: [:show]

  def show
    #@listing = Listing.friendly.find(params[:listing_id])

    #@reviews = Review.where(user_id: @user.id)
    # @review = Review.new
    # @reviews = @user.reviews

    #@hasReview = @reviews.find_by(user_id: current_user.id) if current_user
  end

  def profile_picture
    @pictures = @user.pictures
  end

  def phone_verification
  end

  def update_phone_number
    current_user.update_attributes(user_params)
    current_user.generate_pin
    current_user.send_pin

    redirect_to phone_verification_user_path, notice: "Saved..."
  rescue Exception => e
    redirect_to phone_verification_user_path, alert: "#{e.message}"
  end

  def verify_phone_number
    current_user.verify_pin(params[:user][:pin])

    if current_user.phone_verified
      flash[:notice] = "Your phone number is verified."
    else
      flash[:alert] = "Cannot verify your phone number."
    end

    redirect_to phone_verification_user_path

  rescue Exception => e
    redirect_to phone_verification_user_path, alert: "#{e.message}"
  end


  private

    def user_listing
      @listings = @user.listings
    end

    def user_params
      params.require(:user).permit(:phone, :pin)
    end

    def set_user
      @user = User.friendly.find(params[:id])
    end
end
