class PagesController < ApplicationController
  before_action :set_search, only: [:home, :search, :search_list]
  layout "application_search", only: :search

  def home
    @blogs = Blog.recent.limit(3)
    @listings_all = Listing.all.recent
    @listing_one = Listing.where(featured: 1).limit(1)
    # @listing_one = Listing.where(active: true).limit(1).near(session[:loc_search], 50000, order: 'distance')
  end

  def About
  end

  def privacy
  end
  def terms
  end

  def search
    #@listings = current_user.listings.build
  end

  def search_list

  end


  def sales
    if params[:sales].present? && params[:sales].strip != ""
      session[:loc_search] = params[:sales]
    end

    if session[:loc_search] && session[:loc_search] != ""
      @listings_address = Listing.all.where(listing_type: "For Sale").near(session[:loc_search], 50, order: 'distance')
      # @listings_address = Listing.all.where(listing_type: "For Sale").near(session[:loc_search], 5000, order: 'distance')
      #&& Listing.where(active: true).near(session[:loc_search], 50000, order: 'distance')
      # includes(:location).where(:location => { active: true } ).all
    else
      @listings_address = Listing.where(active: true).all.recent
    end

    @sales = @listings_address.ransack(params[:q])
    @listings = @sales.result.page(params[:page] || 1).per(3)

    @arrListings = @listings.to_a
    @listings_sales = Listing.all.where(listing_type: "For Sale").limit(4)
    @arrListings = @listings.to_a

  end

  def rent
    if params[:rent].present? && params[:rent].strip != ""
      session[:loc_search] = params[:rent]
    end

    if session[:loc_search] && session[:loc_search] != ""
      @listings_address = Listing.all.where(listing_type: "For Rent" ).near(session[:loc_search], 500, order: 'distance')
    else
      @listings_address = Listing.where(active: true).all.recent
    end

    @rent = @listings_address.ransack(params[:q])
    @listings = @rent.result.page(params[:page] || 1).per(3)

    @arrListings = @listings.to_a
    @listings_rent = Listing.all.where(listing_type: "For Rent").limit(4)
    @arrListings = @listings.to_a

  end

  def short_stay

    if params[:short_stay].present? && params[:short_stay].strip != ""
      session[:loc_search] = params[:short_stay]
    end

    if session[:loc_search] && session[:loc_search] != ""
      @listings_address = Listing.all.where(listing_type: "Short Stay").near(session[:loc_search], 500, order: 'distance')
    else
      @listings_address = Listing.where(active: true).all.recent
    end

    @short_stay = @listings_address.ransack(params[:q])
    @listings = @short_stay.result.page(params[:page] || 1).per(3)

    @arrListings = @listings.to_a
    @listings_short_stay = Listing.all.where(listing_type: "Short Stay").limit(4)
    @arrListings = @listings.to_a

  end


private
  def set_search
    if params[:search].present? && params[:search].strip != ""
      session[:loc_search] = params[:search]
    end

    if session[:loc_search] && session[:loc_search] != ""
      @listings_address = Listing.where(active: true).near(session[:loc_search], 50000, order: 'distance')
    else
      @listings_address = Listing.where(active: true).all.recent
    end

    @search = @listings_address.ransack(params[:q])
    @listings = @search.result.page(params[:page] || 1).per(15)

    @arrListings = @listings.to_a

  end
end
