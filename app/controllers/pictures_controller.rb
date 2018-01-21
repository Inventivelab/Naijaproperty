class PicturesController < ApplicationController

  def create
    @user = User.friendly.find(params[:user_id])
    if params[:avatars]
      params[:avatars].each do |img|
        @user.pictures.create(avatar: img)
      end

      @pictures = @user.pictures
      redirect_back(fallback_location: request.referer, notice: "Save...")
    end
  end

  def destroy
    @picture = Picture.find(params[:id])
    @user = @picture.user

    @picture.destroy
    @pictures = Picture.where(user_id: @user.id)

    respond_to :js
  end


end
