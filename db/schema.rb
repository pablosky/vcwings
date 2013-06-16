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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130616194824) do

  create_table "activities", :force => true do |t|
    t.integer  "trackable_id"
    t.string   "trackable_type"
    t.integer  "owner_id"
    t.string   "owner_type"
    t.string   "key"
    t.text     "parameters"
    t.integer  "recipient_id"
    t.string   "recipient_type"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  add_index "activities", ["owner_id", "owner_type"], :name => "index_activities_on_owner_id_and_owner_type"
  add_index "activities", ["recipient_id", "recipient_type"], :name => "index_activities_on_recipient_id_and_recipient_type"
  add_index "activities", ["trackable_id", "trackable_type"], :name => "index_activities_on_trackable_id_and_trackable_type"

  create_table "comments", :force => true do |t|
    t.string   "commenter"
    t.text     "body"
    t.integer  "startup_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "like"
    t.integer  "nolike"
  end

  add_index "comments", ["startup_id"], :name => "index_comments_on_startup_id"

  create_table "friendly_id_slugs", :force => true do |t|
    t.string   "slug",                         :null => false
    t.integer  "sluggable_id",                 :null => false
    t.string   "sluggable_type", :limit => 40
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type"], :name => "index_friendly_id_slugs_on_slug_and_sluggable_type", :unique => true
  add_index "friendly_id_slugs", ["sluggable_id"], :name => "index_friendly_id_slugs_on_sluggable_id"
  add_index "friendly_id_slugs", ["sluggable_type"], :name => "index_friendly_id_slugs_on_sluggable_type"

  create_table "investments", :force => true do |t|
    t.integer  "user_id"
    t.integer  "startup_id"
    t.integer  "vcmoney"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "investments", ["startup_id"], :name => "index_investments_on_startup_id"
  add_index "investments", ["user_id"], :name => "index_investments_on_user_id"

  create_table "members", :force => true do |t|
    t.string   "mtype"
    t.string   "job"
    t.integer  "startup_id"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "email"
    t.string   "name"
    t.integer  "profile_id"
  end

  add_index "members", ["profile_id"], :name => "index_members_on_profile_id"
  add_index "members", ["startup_id"], :name => "index_members_on_startup_id"
  add_index "members", ["user_id"], :name => "index_members_on_user_id"

  create_table "photos", :force => true do |t|
    t.integer  "album_id"
    t.string   "name"
    t.text     "description"
    t.string   "avatar"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "photos", ["album_id"], :name => "index_photos_on_album_id"

  create_table "profiles", :force => true do |t|
    t.string   "fullname"
    t.string   "email"
    t.string   "country"
    t.text     "biography"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "avatar"
    t.integer  "wallet"
    t.integer  "money"
  end

  add_index "profiles", ["user_id"], :name => "index_profiles_on_user_id"

  create_table "roles", :force => true do |t|
    t.string   "role"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "roles", ["user_id"], :name => "index_roles_on_user_id"

  create_table "startups", :force => true do |t|
    t.string   "name"
    t.string   "video"
    t.text     "description"
    t.integer  "vmoney"
    t.string   "website"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.string   "category"
    t.string   "country"
    t.string   "stage"
    t.string   "revenue"
    t.string   "semail"
    t.string   "avatar"
    t.string   "slug"
  end

  add_index "startups", ["slug"], :name => "index_startups_on_slug"

  create_table "ubadges", :force => true do |t|
    t.integer  "earlyadapt"
    t.integer  "advangel"
    t.integer  "ffather"
    t.integer  "vetinvestor"
    t.integer  "feedmaster"
    t.integer  "voiceofwisdom"
    t.integer  "knowit"
    t.integer  "moneywise"
    t.integer  "user_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "ubadges", ["user_id"], :name => "index_ubadges_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "encrypted_password", :limit => 128
    t.string   "salt",               :limit => 128
    t.string   "confirmation_token", :limit => 128
    t.string   "remember_token",     :limit => 128
    t.datetime "created_at",                        :null => false
    t.datetime "updated_at",                        :null => false
    t.string   "role"
  end

  add_index "users", ["email"], :name => "index_users_on_email"
  add_index "users", ["remember_token"], :name => "index_users_on_remember_token"

end
