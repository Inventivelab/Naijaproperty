class LogosController < ApplicationController

  def create
    @user = User.friendly.find(params[:user_id])
    if params[:banners]
      params[:banners].each do |img|
        @user.logos.create(banner: img)
      end

      @logos = @user.logos
      redirect_back(fallback_location: request.referer, notice: "Save...")
    end
  end

  def destroy
    @logo = Logo.find(params[:id])
    @user = @logo.user

    @logo.destroy
    @logos = Logo.where(user_id: @user.id)

    respond_to :js
  end


end
