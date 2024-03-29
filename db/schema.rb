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

ActiveRecord::Schema.define(version: 0) do

  create_table "libraries", force: :cascade do |t|
    t.string "name"
    t.text "address"
    t.text "photo_url"
    t.text "description"
    t.integer "room_number"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "reservations", force: :cascade do |t|
    t.string "date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "user_id"
    t.integer "library_id"
    t.boolean "canceled", default: false
    t.string "start_time"
    t.string "end_time"
    t.index ["library_id"], name: "index_reservations_on_library_id"
    t.index ["user_id"], name: "index_reservations_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.boolean "is_admin", default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "password_digest"
  end

end
