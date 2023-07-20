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

ActiveRecord::Schema[7.0].define(version: 2023_07_20_144457) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "buyer_requests", force: :cascade do |t|
    t.bigint "buyer_id", null: false
    t.string "product"
    t.integer "quantity"
    t.text "other_details"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["buyer_id"], name: "index_buyer_requests_on_buyer_id"
  end

  create_table "buyers", force: :cascade do |t|
    t.string "name"
    t.string "location"
    t.integer "farmer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "deliveries", force: :cascade do |t|
    t.bigint "order_id", null: false
    t.string "status"
    t.date "delivery_date"
    t.string "delivery_address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "index_deliveries_on_order_id"
  end

  create_table "farmer_responses", force: :cascade do |t|
    t.bigint "farmer_id", null: false
    t.bigint "buyer_request_id", null: false
    t.text "message"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["buyer_request_id"], name: "index_farmer_responses_on_buyer_request_id"
    t.index ["farmer_id"], name: "index_farmer_responses_on_farmer_id"
  end

  create_table "farmers", force: :cascade do |t|
    t.string "location"
    t.string "contact_infomation"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "orders", force: :cascade do |t|
    t.integer "quantity"
    t.string "delivery_address"
    t.boolean "payment_status"
    t.integer "buyer_id"
    t.integer "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "payments", force: :cascade do |t|
    t.bigint "order_id", null: false
    t.decimal "amount"
    t.string "payment_status"
    t.date "payment_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "index_payments_on_order_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.decimal "price"
    t.integer "farmer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "buyer_requests", "buyers"
  add_foreign_key "deliveries", "orders"
  add_foreign_key "farmer_responses", "buyer_requests"
  add_foreign_key "farmer_responses", "farmers"
  add_foreign_key "payments", "orders"
end
