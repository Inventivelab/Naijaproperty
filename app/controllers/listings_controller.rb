class ListingsController < ApplicationController
  before_action :set_listing, except: [:index, :new, :create]
  before_action :authenticate_user!, except: [:show]
  before_action :is_authorized, only: [:listing, :pricing, :description, :features, :photo_upload, :location, :update, :destroy]

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
    @photos = @listing.photos
    @listing = Listing.includes(:comments).friendly.find(params[:id])
    @comment = Comment.new
  end

  def listing

  end

  def description

  end

  def photo_upload
    @photos = @listing.photos
  end

  def features
  end

  def location
  end

  def update
    new_params = listing_params
    new_params = listing_params.merge(active: true) if listing_is_ready
    if @listing.update(new_params)
      flash[:notice] = "saved..."
    else
      flash[:notice] = "Something went wrong"
    end
      redirect_back(fallback_location: request.referer)
  end

  def destroy
    @listing.destroy
    flash[:alert] = "Your listing has been removed.."
    redirect_back(fallback_location: request.referer)
  end

  private

    def set_listing
      @listing = Listing.friendly.find(params[:id])
    end

    def listing_is_ready
      !@listing.active && !@listing.price.blank? && !@listing.listing_title.blank? && !@listing.photos.blank? && !@listing.location.blank?
    end

    def listing_params
      params.require(:listing).permit(:listing_title, :listing_type, :property_type,
        :year_built, :bedroom, :bathroom, :description,
        :location, :rent_price, :short_stay_price, :price,
        :garage_size, :number_of_floors, :square_feet,
        :property_features, :lot_features, :community_features,
        :parking_type, :video_url, :active, :instant,
        :basement,
        :centralair,
        :dinning_room,
        :walldrobe,
        :familyroom,
        :guest_toilet,
        :laundry_room,
        :disability,
        :fireplace,
        :main_floor,
        :pantry,
        :access_gate,
        :balcony,
        :fence,
        :pool,
        :staff_quarters,
        :water_front,
        :city_light,
        :mountain_view,
        :river_view,
        :water_view,
        :ocean_view,
        :fitness_center,
        :security_post,
        :tennis_court,
        :basketball_court,
        :pet_allowed,
        :recreation_facilities,
        :electric_fencing,
        :cable_tv,
        :borehole,
        :alarm,
        :senior_community,
        :surface_lot,
        :covered,
        :street_parking,
        :garage,
        :other_parking,
        :swimming_pool, :string

      )
    end

    def is_authorized
      redirect_to root_path, alert: "You don't have permission" unless current_user.id == @listing.user_id
    end
end
