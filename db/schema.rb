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

ActiveRecord::Schema.define(version: 2022_02_04_162220) do

  create_table "opinions", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "performers", primary_key: "user_id", id: :integer, default: nil, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "image"
    t.text "attack"
    t.integer "age"
    t.string "three_size"
    t.string "identification"
    t.string "full_body"
    t.string "progress"
    t.string "sns"
    t.time "sun_start", default: "2000-01-01 00:00:00", null: false
    t.time "tue_start", default: "2000-01-01 00:00:00", null: false
    t.time "wed_start", default: "2000-01-01 00:00:00", null: false
    t.time "thu_start", default: "2000-01-01 00:00:00", null: false
    t.time "fri_start", default: "2000-01-01 00:00:00", null: false
    t.time "sat_start", default: "2000-01-01 00:00:00", null: false
    t.time "sun_end", default: "2000-01-01 00:00:00", null: false
    t.time "tue_end", default: "2000-01-01 00:00:00", null: false
    t.time "wed_end", default: "2000-01-01 00:00:00", null: false
    t.time "thu_end", default: "2000-01-01 00:00:00", null: false
    t.time "fri_end", default: "2000-01-01 00:00:00", null: false
    t.time "sat_end", default: "2000-01-01 00:00:00", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "nickname", default: "", null: false
    t.string "name", default: "", null: false
    t.string "furigana", default: "", null: false
    t.string "sex", default: "", null: false
    t.string "post_number", default: "", null: false
    t.string "address", default: "", null: false
    t.string "telephone_number", default: "", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.boolean "accepted", default: false, null: false
    t.integer "trade", default: 0, null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
