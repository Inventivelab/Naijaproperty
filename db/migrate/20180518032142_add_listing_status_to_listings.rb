class AddListingStatusToListings < ActiveRecord::Migration[5.1]
  def change
    add_column :listings, :listing_status, :integer, default: 1
  end
end
