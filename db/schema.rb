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

ActiveRecord::Schema.define(version: 20180423093534) do

  create_table "basic_infos", force: :cascade do |t|
    t.integer "resume_id"
    t.integer "user_id"
    t.string "user_avatar"
    t.string "full_name"
    t.string "headline"
    t.string "description"
    t.string "location"
    t.string "website"
    t.integer "salary"
    t.integer "age"
    t.string "phone"
    t.string "email_address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "companies", force: :cascade do |t|
    t.string "name"
    t.string "headline"
    t.string "description"
    t.string "location"
    t.integer "employee"
    t.string "website"
    t.integer "founder"
    t.integer "phone"
    t.string "email"
    t.string "avatar"
    t.string "cover_image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "company_details", force: :cascade do |t|
    t.integer "company_id"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "company_users", force: :cascade do |t|
    t.integer "company_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "educations", force: :cascade do |t|
    t.integer "resume_id"
    t.string "avatar"
    t.string "degree"
    t.string "major"
    t.string "school_name"
    t.string "description"
    t.datetime "date_from"
    t.datetime "date_to"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "job_details", force: :cascade do |t|
    t.integer "job_id"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "jobs", force: :cascade do |t|
    t.integer "user_id"
    t.string "company_name"
    t.string "company_avatar"
    t.string "title"
    t.string "description"
    t.string "url"
    t.string "location"
    t.string "employment_type"
    t.string "salary"
    t.integer "working_hour"
    t.integer "experience"
    t.string "education_level"
    t.string "status", default: "Pending approval"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "resume_jobs", force: :cascade do |t|
    t.integer "resume_id"
    t.integer "job_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "resumes", force: :cascade do |t|
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "skills", force: :cascade do |t|
    t.integer "resume_id"
    t.string "name"
    t.integer "proficiency"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "social_companies", force: :cascade do |t|
    t.integer "company_id"
    t.string "facebook_link"
    t.string "twitter_link"
    t.string "google_link"
    t.string "github_link"
    t.string "youtube_link"
    t.string "instagram_link"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "socials", force: :cascade do |t|
    t.integer "resume_id"
    t.string "facebook_link"
    t.string "google_link"
    t.string "twitter_link"
    t.string "github_link"
    t.string "instagram_link"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tag_lists", force: :cascade do |t|
    t.string "tag_name"
    t.integer "user_id"
    t.integer "resume_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "account_name"
    t.boolean "admin", default: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "work_experiences", force: :cascade do |t|
    t.string "resume_id"
    t.string "company"
    t.string "position"
    t.datetime "date_from"
    t.datetime "date_to"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
