class PagesController < ApplicationController
  def home
    @listings_all = Listing.all
    #@listings = Listing.where(active: true).limit(3)
    # @listings = Listing.where(active: true).all
    # if params[:search].present? && params[:search].strip != ""
    #   session[:loc_search] = params[:search]
    # end

    # STEP 2
    if params[:search].present? && params[:search].strip != ""
      session[:loc_search] = params[:search]
    end

    # STEP 2
    if session[:loc_search] && session[:loc_search] != ""
      @listings_address = Listing.where(active: true).near(session[:loc_search], 50, order: 'distance')
    else
      @listings_address = Listing.where(active: true).all
    end

    # STEP 3
    @search = @listings_address.ransack(params[:q])
    @listings = @search.result

    @arrListings = @listings.to_a
  end

  def search
    # STEP 1
    if params[:search].present? && params[:search].strip != ""
      session[:loc_search] = params[:search]
    end

    # STEP 2
    if session[:loc_search] && session[:loc_search] != ""
      @listings_address = Listing.where(active: true).near(session[:loc_search], 50, order: 'distance')
    else
      @listings_address = Listing.where(active: true).all
    end

    # STEP 3
    @search = @listings_address.ransack(params[:q])
    @listings = @search.result

    @arrListings = @listings.to_a
  end

  def sales
    # STEP 1
    if params[:sales].present? && params[:sales].strip != ""
      session[:loc_search] = params[:sales]
    end

    # STEP 2
    if session[:loc_search] && session[:loc_search] != ""
      @listings_address = Listing.all.where(listing_type: "For Sale")
      # @listings_address = Listing.all.where(listing_type: "For Sale").near(session[:loc_search], 5000, order: 'distance')
      #&& Listing.where(active: true).near(session[:loc_search], 50000, order: 'distance')
    else
      @listings_address = Listing.where(active: true).all
    end

    # STEP 3
    @sales = @listings_address.ransack(params[:q])
    @listings = @sales.result

    @arrListings = @listings.to_a
  end

  def for_sales
    # STEP 1
    if params[:sales].present? && params[:sales].strip != ""
      session[:loc_search] = params[:sales]
    end

    # STEP 2
    if session[:loc_search] && session[:loc_search] != ""
      @listings_address = Listing.all.where(listing_type: "For Sale").near(session[:loc_search], 5000, order: 'distance')
      #&& Listing.where(active: true).near(session[:loc_search], 50000, order: 'distance')
    else
      @listings_address = Listing.where(active: true).all
    end

    # STEP 3
    @sales = @listings_address.ransack(params[:q])
    @listings = @sales.result

    @arrListings = @listings.to_a
  end

  def rent
    # STEP 1

      if params[:rent].present? && params[:rent].strip != ""
        session[:loc_search] = params[:rent]
      end

      # STEP 2
      # if (@listing_type == "For Rent")
        if session[:loc_search] && session[:loc_search] != ""
          @listings_address = Listing.all.where(listing_type: "For Rent")
          #&& Listing.where(active: true).near(session[:loc_search], 5, order: 'distance')
        else
          @listings_address = Listing.where(active: true).all
        end

      # STEP 3
      @rent = @listings_address.ransack(params[:q])
      @listings = @rent.result

      @arrListings = @listings.to_a
  end

  def for_rent
    # STEP 1

      if params[:rent].present? && params[:rent].strip != ""
        session[:loc_search] = params[:rent]
      end

      # STEP 2
      # if (@listing_type == "For Rent")
        if session[:loc_search] && session[:loc_search] != ""
          @listings_address = Listing.all.where(listing_type: "For Rent")
          #&& Listing.where(active: true).near(session[:loc_search], 5, order: 'distance')
        else
          @listings_address = Listing.where(active: true).all
        end

      # STEP 3
      @rent = @listings_address.ransack(params[:q])
      @listings = @rent.result

      @arrListings = @listings.to_a
  end

  def short_stay
    # STEP 1

      if params[:short_stay].present? && params[:short_stay].strip != ""
        session[:loc_search] = params[:short_stay]
      end

      # STEP 2
      # if (@listing_type == "For Rent")
        if session[:loc_search] && session[:loc_search] != ""
          @listings_address = Listing.all.where(listing_type: "Short Stay")
          #&& Listing.where(active: true).near(session[:loc_search], 5, order: 'distance')
        else
          @listings_address = Listing.where(active: true).all
        end

      # STEP 3
      @short_stay = @listings_address.ransack(params[:q])
      @listings = @short_stay.result

      @arrListings = @listings.to_a
  end

def for_short_stay
  # STEP 1

    if params[:short_stay].present? && params[:short_stay].strip != ""
      session[:loc_search] = params[:short_stay]
    end

    # STEP 2
    # if (@listing_type == "For Rent")
      if session[:loc_search] && session[:loc_search] != ""
        @listings_address = Listing.all.where(listing_type: "Short Stay")
        #&& Listing.where(active: true).near(session[:loc_search], 5, order: 'distance')
      else
        @listings_address = Listing.where(active: true).all
      end

    # STEP 3
    @short_stay = @listings_address.ransack(params[:q])
    @listings = @short_stay.result

    @arrListings = @listings.to_a
  end
end
