class UsersController < ApplicationController
  before_action :set_user, only: [:show]
  before_action :authenticate_user!, except: [:show]

  def show
  end

  private
  
    def set_user
      @user = User.friendly.find(params[:id])
    end
end
