class Listing < ApplicationRecord
  belongs_to :user

  validates :listing_type, presence: true

  extend FriendlyId
  friendly_id :slug_listings, use: :slugged

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
end
