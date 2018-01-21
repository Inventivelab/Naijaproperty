class DashboardsController < ApplicationController
  before_action :authenticate_user!

  def index
    @listings = current_user.listings
    #@reviews = current_user.reviews
  end
end
