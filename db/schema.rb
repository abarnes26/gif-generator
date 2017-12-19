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

ActiveRecord::Schema.define(version: 20171219194745) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "name"
  end

  create_table "favorites", force: :cascade do |t|
    t.bigint "gif_id"
    t.bigint "user_id"
    t.index ["gif_id"], name: "index_favorites_on_gif_id"
    t.index ["user_id"], name: "index_favorites_on_user_id"
  end

  create_table "gifs", force: :cascade do |t|
    t.string "image_path"
    t.bigint "category_id"
    t.index ["category_id"], name: "index_gifs_on_category_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.string "username"
    t.integer "role", default: 0
  end

  add_foreign_key "favorites", "gifs"
  add_foreign_key "favorites", "users"
  add_foreign_key "gifs", "categories"
end
