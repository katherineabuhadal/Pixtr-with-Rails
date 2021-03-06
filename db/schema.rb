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

ActiveRecord::Schema.define(version: 20140703150916) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: true do |t|
    t.text     "body",       null: false
    t.integer  "image_id",   null: false
    t.integer  "user_id",    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "galleries", force: true do |t|
    t.string   "name",        null: false
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id",     null: false
  end

  add_index "galleries", ["user_id"], name: "index_galleries_on_user_id", using: :btree

  create_table "group_images", force: true do |t|
    t.integer  "group_id",   null: false
    t.integer  "image_id",   null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "group_images", ["group_id", "image_id"], name: "index_group_images_on_group_id_and_image_id", unique: true, using: :btree

  create_table "group_memberships", force: true do |t|
    t.integer  "user_id",    null: false
    t.integer  "group_id",   null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "group_memberships", ["user_id", "group_id"], name: "index_group_memberships_on_user_id_and_group_id", unique: true, using: :btree

  create_table "groups", force: true do |t|
    t.string   "name",        null: false
    t.text     "description", null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "groups", ["name"], name: "index_groups_on_name", unique: true, using: :btree

  create_table "images", force: true do |t|
    t.integer  "gallery_id"
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "images", ["gallery_id"], name: "index_images_on_gallery_id", using: :btree

  create_table "likes", force: true do |t|
    t.integer  "user_id",       null: false
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "likeable_type", null: false
    t.integer  "likeable_id",   null: false
  end

  add_index "likes", ["user_id"], name: "index_likes_on_user_id", using: :btree

  create_table "taggings", force: true do |t|
    t.integer "image_id", null: false
    t.integer "tag_id",   null: false
  end

  add_index "taggings", ["image_id", "tag_id"], name: "index_taggings_on_image_id_and_tag_id", unique: true, using: :btree

  create_table "tags", force: true do |t|
    t.string   "name",       null: false
    t.integer  "image_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "tags", ["name"], name: "index_tags_on_name", unique: true, using: :btree

  create_table "users", force: true do |t|
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree

end
