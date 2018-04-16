class Listing < ApplicationRecord
  belongs_to :user
  has_many :photos
  has_many :availabilities
  has_many :tell_a_friends
  has_many :comments, dependent: :destroy

  validates :listing_type, presence: true
  # self.per_page = 4
  geocoded_by :location
  after_validation :geocode, if: :location_changed?

  extend FriendlyId
  friendly_id :slug_listings, use: :slugged_listing

   def slug_listings
     [
       :listing_title,
       [:listing_title, :property_type],
       [:listing_title, :property_type, :listing_type,],
       [:listing_title, :property_type, :listing_type, :bedroom],
       [:listing_title, :property_type, :listing_type, :bedroom, :bathroom],
       [:listing_title, :property_type, :listing_type, :bedroom, :bathroom, :year_built],
       [:listing_title, :property_type, :listing_type, :bedroom, :bathroom, :year_built, :location]
     ]
   end

   def prices
      if self.price
        self.price
      elsif self.rent_price
        self.rent_price
      else self.short_stay_price
        self.short_stay_price
      end
    end

   def backgroud_image(size)
    if self.photos.length > 0
      self.photos[0].image.url(size)
    else
      "listings-blank.jpg"
    end
  end
end
