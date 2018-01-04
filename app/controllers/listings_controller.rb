class ListingsController < ApplicationController
  before_action :set_listing, except: [:index, :new, :create]
  before_action :authenticate_user!, except: [:show]

  def index
    @listings = current_user.listings
  end

  def new
    @listing = current_user.listings.build
  end

  def create
    @listing = current_user.listings.build(listing_params)
    if @listing.save
      redirect_to listing_listing_path(@listing), notice: "Saved..."
    else
      flash[:alert] = "Something went wrong"
      render :new
    end
  end

  def show
  end

  def listing
    # redirect_to pricing_listing_path(@listing)
  end

  def description
  end

  def photo_upload
  end

  def features
  end

  def location
  end

  def update
  end

  private

    def set_listing
      @listing = Listing.friendly.find(params[:id])
    end

    def listing_params
      params.require(:listing).permit(:listing_title, :listing_type, :property_type, :year_built, :bedroom, :bathroom, :description, :location, :rent_price, :short_stay_price, :price, :garage_size, :number_of_floors, :square_feet, :property_features, :lot_features, :community_features, :parking_type, :video_url, :active, :instant)
    end
end
