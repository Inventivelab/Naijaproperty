# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20180111172308) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "availabilities", force: :cascade do |t|
    t.bigint "listing_id"
    t.bigint "user_id"
    t.datetime "start_date"
    t.datetime "end_date"
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "phone"
    t.text "message"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["listing_id"], name: "index_availabilities_on_listing_id"
    t.index ["user_id"], name: "index_availabilities_on_user_id"
  end

  create_table "chats", force: :cascade do |t|
    t.integer "sender_id"
    t.integer "recipent_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string "slug", null: false
    t.integer "sluggable_id", null: false
    t.string "sluggable_type", limit: 50
    t.string "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
    t.index ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id"
    t.index ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type"
  end

  create_table "listings", force: :cascade do |t|
    t.string "listing_title"
    t.string "listing_type"
    t.string "property_type"
    t.text "description"
    t.integer "bedroom"
    t.integer "bathroom"
    t.string "year_built"
    t.string "rent_price"
    t.string "price"
    t.string "short_stay_price"
    t.string "garage_size"
    t.string "number_of_floors"
    t.string "square_feet"
    t.string "location"
    t.string "property_features"
    t.string "lot_features"
    t.string "community_features"
    t.string "parking_type"
    t.string "video_url"
    t.boolean "active"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
    t.string "for_sale"
    t.string "for_rent"
    t.string "short_stay"
    t.float "latitude"
    t.float "longitude"
    t.boolean "basement"
    t.boolean "centralair"
    t.boolean "dinning_room"
    t.boolean "walldrobe"
    t.boolean "familyroom"
    t.boolean "guest_toilet"
    t.boolean "laundry_room"
    t.boolean "disability"
    t.boolean "fireplace"
    t.boolean "main_floor"
    t.boolean "pantry"
    t.boolean "access_gate"
    t.boolean "balcony"
    t.boolean "fence"
    t.boolean "pool"
    t.boolean "staff_quarters"
    t.boolean "water_front"
    t.boolean "city_light"
    t.boolean "mountain_view"
    t.boolean "river_view"
    t.boolean "water_view"
    t.boolean "ocean_view"
    t.boolean "fitness_center"
    t.boolean "security_post"
    t.boolean "tennis_court"
    t.boolean "basketball_court"
    t.boolean "pet_allowed"
    t.boolean "recreation_facilities"
    t.boolean "electric_fencing"
    t.boolean "cable_tv"
    t.boolean "borehole"
    t.boolean "alarm"
    t.boolean "senior_community"
    t.boolean "surface_lot"
    t.boolean "covered"
    t.boolean "street_parking"
    t.boolean "garage"
    t.boolean "other_parking"
    t.string "swimming_pool"
    t.index ["slug"], name: "index_listings_on_slug", unique: true
    t.index ["user_id"], name: "index_listings_on_user_id"
  end

  create_table "messages", force: :cascade do |t|
    t.text "context"
    t.bigint "user_id"
    t.bigint "chat_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["chat_id"], name: "index_messages_on_chat_id"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "photos", force: :cascade do |t|
    t.bigint "listing_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image_file_name"
    t.string "image_content_type"
    t.integer "image_file_size"
    t.datetime "image_updated_at"
    t.index ["listing_id"], name: "index_photos_on_listing_id"
  end

  create_table "settings", force: :cascade do |t|
    t.boolean "enable_sms", default: true
    t.boolean "enable_email", default: true
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_settings_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "username"
    t.string "phone"
    t.string "business_name"
    t.string "address"
    t.string "website"
    t.text "bio"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "provider"
    t.string "uid"
    t.string "image"
    t.string "slug"
    t.boolean "admin", default: false
    t.string "pin"
    t.boolean "phone_verified"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["slug"], name: "index_users_on_slug", unique: true
  end

  add_foreign_key "availabilities", "listings"
  add_foreign_key "availabilities", "users"
  add_foreign_key "listings", "users"
  add_foreign_key "messages", "chats"
  add_foreign_key "messages", "users"
  add_foreign_key "photos", "listings"
  add_foreign_key "settings", "users"
end
