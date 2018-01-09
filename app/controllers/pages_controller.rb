class PagesController < ApplicationController
  def home
    @listings = Listing.where(active: true).limit(4)
  end

  def search
    # STEP 1
    if params[:search].present? && params[:search].strip != ""
      session[:loc_search] = params[:search]
    end

    # STEP 2
    if session[:loc_search] && session[:loc_search] != ""
      @listings_address = Listing.where(active: true).near(session[:loc_search], 5, order: 'distance')
    else
      @listings_address = Listing.where(active: true).all
    end

    # STEP 3
    @search = @listings_address.ransack(params[:q])
    @listings = @search.result

    @arrListings = @listings.to_a
  end

  def search_for_rent
    # STEP 1
    if params[:search].present? && params[:search].strip != ""
      session[:loc_search] = params[:search]
    end

    # STEP 2
    if session[:loc_search] && session[:loc_search] != ""
      @listings_address = Listing.where(active: true).near(session[:loc_search], 5, order: 'distance')
    else
      @listings_address = Listing.where(active: true).all
    end

    # STEP 3
    @search = @listings_address.ransack(params[:q])
    @listings = @search.result

    @arrListings = @listings.to_a
  end
end
