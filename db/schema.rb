# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_01_09_124826) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "remind_items", force: :cascade do |t|
    t.string "description"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_remind_items_on_user_id"
  end

  create_table "reminds", force: :cascade do |t|
    t.datetime "remind_at", precision: nil
    t.integer "remind_item_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "notified", default: false
    t.index ["remind_item_id"], name: "index_reminds_on_remind_item_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "remind_items", "users"
  add_foreign_key "reminds", "remind_items"
end
