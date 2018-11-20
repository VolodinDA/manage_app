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

ActiveRecord::Schema.define(version: 2018_11_04_135604) do

  create_table "abilities", force: :cascade do |t|
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["description"], name: "index_abilities_on_description", unique: true
  end

  create_table "characteristics", force: :cascade do |t|
    t.integer "user_id"
    t.integer "ability_id"
    t.integer "grade"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ability_id"], name: "index_characteristics_on_ability_id"
    t.index ["user_id"], name: "index_characteristics_on_user_id"
  end

  create_table "departments", force: :cascade do |t|
    t.string "designation"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["designation"], name: "index_departments_on_designation", unique: true
  end

  create_table "errands", force: :cascade do |t|
    t.string "address"
    t.boolean "is_finished", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["address"], name: "index_errands_on_address", unique: true
  end

  create_table "languages", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_languages_on_name", unique: true
  end

  create_table "merits", force: :cascade do |t|
    t.integer "user_id"
    t.integer "reward_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["reward_id"], name: "index_merits_on_reward_id"
    t.index ["user_id"], name: "index_merits_on_user_id"
  end

  create_table "objectives", force: :cascade do |t|
    t.string "description"
    t.integer "department_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["department_id"], name: "index_objectives_on_department_id"
  end

  create_table "rewards", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["title"], name: "index_rewards_on_title", unique: true
  end

  create_table "speeches", force: :cascade do |t|
    t.integer "language_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["language_id"], name: "index_speeches_on_language_id"
    t.index ["user_id"], name: "index_speeches_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.string "remember_token"
    t.boolean "admin", default: false
    t.date "employment_date"
    t.integer "department_id"
    t.integer "errand_id"
    t.string "avatar"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["remember_token"], name: "index_users_on_remember_token"
  end

end
