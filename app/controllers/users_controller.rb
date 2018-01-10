class UsersController < ApplicationController
  before_action :set_user, only: [:show]
  before_action :authenticate_user!, except: [:show]

  def show
    @listings = @user.listings
  end

  def update_phone_number
    current_user.update_attributes(user_params)
    current_user.generate_pin
    current_user.send_pin

    redirect_to edit_user_registration_path, notice: "Saved..."
  rescue Exception => e
    redirect_to edit_user_registration_path, alert: "#{e.message}"
  end

  def verify_phone_number
    current_user.verify_pin(params[:user][:pin])

    if current_user.phone_verified
      flash[:notice] = "Your phone number is verified."
    else
      flash[:alert] = "Cannot verify your phone number."
    end

    redirect_to edit_user_registration_path

  rescue Exception => e
    redirect_to edit_user_registration_path, alert: "#{e.message}"
  end


  private

    def user_params
      params.require(:user).permit(:phone, :pin)
    end

    def set_user
      @user = User.friendly.find(params[:id])
    end
end
