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

ActiveRecord::Schema.define(version: 20180611075628) do

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "project_backers", force: :cascade do |t|
    t.integer "user_id"
    t.integer "project_id"
    t.integer "amount_invested"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_project_backers_on_project_id"
    t.index ["user_id"], name: "index_project_backers_on_user_id"
  end

  create_table "project_creators", force: :cascade do |t|
    t.integer "user_id"
    t.integer "project_id"
    t.boolean "owner"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_project_creators_on_project_id"
    t.index ["user_id"], name: "index_project_creators_on_user_id"
  end

  create_table "projects", force: :cascade do |t|
    t.string "name"
    t.integer "approved_by"
    t.integer "money_goal"
    t.datetime "finish_date"
    t.text "description"
    t.boolean "approved", default: false
    t.float "rating"
    t.boolean "founded", default: false
    t.datetime "foundation_date"
    t.datetime "approval_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "main_image_file_name"
    t.string "main_image_content_type"
    t.integer "main_image_file_size"
    t.datetime "main_image_updated_at"
  end

  create_table "promise_buyers", force: :cascade do |t|
    t.integer "user_id"
    t.integer "promise_id"
    t.integer "amount_invested"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["promise_id"], name: "index_promise_buyers_on_promise_id"
    t.index ["user_id"], name: "index_promise_buyers_on_user_id"
  end

  create_table "promises", force: :cascade do |t|
    t.string "name"
    t.integer "project_id"
    t.text "decription"
    t.integer "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_promises_on_project_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "last_name"
    t.string "nickname"
    t.string "phone_number"
    t.string "user_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "avatar_file_name"
    t.string "avatar_content_type"
    t.integer "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string "description"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
