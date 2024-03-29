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

ActiveRecord::Schema.define(:version => 20110822153332) do

  create_table "access_keys", :force => true do |t|
    t.integer  "user_id"
    t.string   "name"
    t.string   "auth"
    t.datetime "expires_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email"
  end

  create_table "assets", :force => true do |t|
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "uploaded_file_file_name"
    t.string   "uploaded_file_content_type"
    t.integer  "uploaded_file_file_size"
    t.datetime "uploaded_file_updated_at"
    t.integer  "folder_id"
    t.datetime "download_time"
  end

  add_index "assets", ["folder_id"], :name => "index_assets_on_folder_id"
  add_index "assets", ["user_id"], :name => "index_assets_on_user_id"

  create_table "folders", :force => true do |t|
    t.string   "name"
    t.integer  "parent_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "zipped_file"
    t.datetime "zipped_at"
  end

  add_index "folders", ["parent_id"], :name => "index_folders_on_parent_id"
  add_index "folders", ["user_id"], :name => "index_folders_on_user_id"

  create_table "invites", :force => true do |t|
    t.integer  "user_id"
    t.integer  "invited_user_id"
    t.string   "invited_user_email"
    t.string   "message"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "invites", ["invited_user_id"], :name => "index_invites_on_invited_user_id"
  add_index "invites", ["user_id"], :name => "index_invites_on_user_id"

  create_table "keyed_folders", :force => true do |t|
    t.integer  "access_key_id"
    t.integer  "folder_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "public_folders", :force => true do |t|
    t.integer  "user_id"
    t.integer  "folder_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "public_folders", ["folder_id"], :name => "index_public_folders_on_folder_id"
  add_index "public_folders", ["user_id"], :name => "index_public_folders_on_user_id"

  create_table "shared_folders", :force => true do |t|
    t.integer  "user_id"
    t.string   "shared_email"
    t.integer  "shared_user_id"
    t.integer  "folder_id"
    t.string   "message"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "shared_folders", ["folder_id"], :name => "index_shared_folders_on_folder_id"
  add_index "shared_folders", ["shared_user_id"], :name => "index_shared_folders_on_shared_user_id"
  add_index "shared_folders", ["user_id"], :name => "index_shared_folders_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "email",                                 :default => "",    :null => false
    t.string   "encrypted_password",     :limit => 128, :default => "",    :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                         :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "name"
    t.string   "password_salt"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.integer  "failed_attempts",                       :default => 0
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.string   "authentication_token"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "account_active",                        :default => false
    t.string   "username"
  end

  add_index "users", ["authentication_token"], :name => "index_users_on_authentication_token", :unique => true
  add_index "users", ["confirmation_token"], :name => "index_users_on_confirmation_token", :unique => true
  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true
  add_index "users", ["unlock_token"], :name => "index_users_on_unlock_token", :unique => true

end
