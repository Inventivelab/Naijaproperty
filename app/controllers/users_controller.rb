class UsersController < ApplicationController
  before_action :set_user, only: [:show, :profile_picture, :phone_verification, :company_logo, :social_connect, :delete]
  before_action :is_authenticated, except: [:show, :index, :agents]
  before_action :user_listing, only: [:show]
  before_action :require_admin, only: [:delete]

  def index
    # @users = User.limit(4).order("created_at DESC")
    if params[:search]
      @users = User.search(params[:search]).order("created_at DESC")
    # else
    #   @users = User.limit(4).order("created_at DESC")
    end
  end

  def agents
    @users = User.limit(2).order("created_at DESC")
  end

  def show
    #@listing = Listing.friendly.find(params[:listing_id])

    #@reviews = Review.where(user_id: @user.id)
    # @review = Review.new
    # @reviews = @user.reviews

    #@hasReview = @reviews.find_by(user_id: current_user.id) if current_user
  end

  def social_connect
  end

  def profile_picture
    @pictures = @user.pictures
  end

  def company_logo
    @logos = @user.logos
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

  def destroy
   @user.destroy
   session[:user_id] = nil
   redirect_to root_url, alert: "Account successfully deleted!"
 end

  private

    def is_authenticated
      authenticate_user! || current_user_admin?
    end


    def user_listing
      @listings = @user.listings.page(params[:page] || 1).per(6).recent
    end

    def user_params
      params.require(:user).permit(:phone, :pin)
    end

    def set_user
      @user = User.friendly.find(params[:id])
    end
end
