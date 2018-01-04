class AddListingCategoriesToListing < ActiveRecord::Migration[5.1]
  def change
    add_column :listings, :for_sale, :string
    add_column :listings, :for_rent, :string
    add_column :listings, :short_stay, :string
  end
end
