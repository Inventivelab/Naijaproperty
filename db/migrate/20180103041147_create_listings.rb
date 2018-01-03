class CreateListings < ActiveRecord::Migration[5.1]
  def change
    create_table :listings do |t|
      t.string :listing_title
      t.string :listing_type
      t.string :property_type
      t.text :description
      t.integer :bedroom
      t.integer :bathroom
      t.string :year_built
      t.string :rent_price
      t.string :price
      t.string :short_stay_price
      t.string :garage_size
      t.string :number_of_floors
      t.string :square_feet
      t.string :location
      t.string :property_features
      t.string :lot_features
      t.string :community_features
      t.string :parking_type
      t.string :video_url
      t.boolean :active
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
