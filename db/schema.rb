# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20140909105925) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "articles", force: true do |t|
    t.string   "title"
    t.string   "body"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "baby_id"
    t.integer  "user_id"
    t.boolean  "priv",       default: false
  end

  create_table "babies", force: true do |t|
    t.string   "name"
    t.date     "date"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "nick"
    t.string   "password_digest"
    t.string   "babyphoto_file_name"
    t.string   "babyphoto_content_type"
    t.integer  "babyphoto_file_size"
    t.datetime "babyphoto_updated_at"
    t.integer  "parent1"
    t.integer  "parent2"
    t.integer  "user_id"
    t.string   "parent1_name"
    t.string   "parent2_name"
    t.string   "how_we_met"
    t.string   "parent1_desc"
    t.string   "parent2_desc"
    t.string   "parent1_photo_file_name"
    t.string   "parent1_photo_content_type"
    t.integer  "parent1_photo_file_size"
    t.datetime "parent1_photo_updated_at"
    t.string   "parent2_photo_file_name"
    t.string   "parent2_photo_content_type"
    t.integer  "parent2_photo_file_size"
    t.datetime "parent2_photo_updated_at"
  end

  create_table "comments", force: true do |t|
    t.string   "nick"
    t.string   "comment"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "articles_id"
    t.integer  "article_id"
    t.boolean  "readed",      default: false
  end

  create_table "families", force: true do |t|
    t.integer  "baby_id"
    t.integer  "parent1"
    t.integer  "parent2"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "families", ["baby_id", "parent1", "parent2"], name: "index_families_on_baby_id_and_parent1_and_parent2", unique: true, using: :btree

  create_table "gifts", force: true do |t|
    t.string   "name"
    t.string   "person"
    t.boolean  "checked"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "baby_id"
  end

  create_table "images", force: true do |t|
    t.integer  "article_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "newimg_file_name"
    t.string   "newimg_content_type"
    t.integer  "newimg_file_size"
    t.datetime "newimg_updated_at"
    t.boolean  "main"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "nick"
    t.string   "email"
    t.date     "date"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.string   "userphoto_file_name"
    t.string   "userphoto_content_type"
    t.integer  "userphoto_file_size"
    t.datetime "userphoto_updated_at"
  end

end
