ActiveAdmin.register Listing do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end
permit_params :listing_title, :listing_type, :property_type,
  :year_built, :bedroom, :bathroom, :description,
  :location, :rent_price, :short_stay_price, :price,
  :garage_size, :number_of_floors, :square_feet,
  :property_features, :lot_features, :community_features,
  :parking_type, :video_url, :active, :instant, :featured,
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


end
