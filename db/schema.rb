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

ActiveRecord::Schema[7.0].define(version: 2023_07_30_141250) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cross_references", force: :cascade do |t|
    t.string "item_description"
    t.integer "supplier_id"
    t.integer "maveko_id"
    t.integer "customer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "currencies", force: :cascade do |t|
    t.string "name"
    t.string "symbol"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "customer_formulas", force: :cascade do |t|
    t.boolean "active"
    t.float "formula"
    t.bigint "customer_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "label", null: false
    t.index ["customer_id"], name: "index_customer_formulas_on_customer_id"
  end

  create_table "customer_item_pricings", force: :cascade do |t|
    t.bigint "customer_id", null: false
    t.bigint "pricing_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_customer_item_pricings_on_customer_id"
    t.index ["pricing_id"], name: "index_customer_item_pricings_on_pricing_id"
  end

  create_table "customers", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.index ["user_id"], name: "index_customers_on_user_id"
  end

  create_table "dimensions", force: :cascade do |t|
    t.integer "length"
    t.integer "width"
    t.integer "height"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "items", force: :cascade do |t|
    t.string "item_code"
    t.string "decor_code"
    t.string "item_name"
    t.text "item_description"
    t.string "image"
    t.string "article_group"
    t.string "tax_class"
    t.string "weight"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "base_unit_id"
    t.bigint "target_unit_id"
    t.bigint "main_item_pricing_id", null: false
    t.bigint "customer_item_pricing_id", null: false
    t.bigint "dimension_id"
    t.index ["base_unit_id"], name: "index_items_on_base_unit_id"
    t.index ["customer_item_pricing_id"], name: "index_items_on_customer_item_pricing_id"
    t.index ["dimension_id"], name: "index_items_on_dimension_id"
    t.index ["main_item_pricing_id"], name: "index_items_on_main_item_pricing_id"
    t.index ["target_unit_id"], name: "index_items_on_target_unit_id"
  end

  create_table "main_item_pricings", force: :cascade do |t|
    t.bigint "pricing_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["pricing_id"], name: "index_main_item_pricings_on_pricing_id"
  end

  create_table "notifications", force: :cascade do |t|
    t.string "title", null: false
    t.text "body", null: false
    t.string "sender", null: false
    t.string "status", null: false
    t.date "delivery_date", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.index ["user_id"], name: "index_notifications_on_user_id"
  end

  create_table "pricings", force: :cascade do |t|
    t.integer "price_in_euro"
    t.integer "old_purchase_price"
    t.date "valid_from_old_purchase"
    t.integer "new_purchase_price"
    t.date "valid_from_new_purchase"
    t.date "valid_to_new_purchase"
    t.integer "old_retail_price"
    t.integer "new_retail_price"
    t.date "new_retail_price_valid_from"
    t.date "new_retail_price_valid_to"
    t.integer "change_in_percentage"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "currency_id"
    t.index ["currency_id"], name: "index_pricings_on_currency_id"
  end

  create_table "sales_order_documents", force: :cascade do |t|
    t.string "so_num", null: false
    t.string "status", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "supplier_documents", force: :cascade do |t|
    t.string "reference_no"
    t.bigint "supplier_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "status", default: "pending"
    t.date "effective_date"
    t.index ["supplier_id"], name: "index_supplier_documents_on_supplier_id"
  end

  create_table "supplier_formulas", force: :cascade do |t|
    t.boolean "active"
    t.float "margin"
    t.bigint "supplier_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "label", null: false
    t.index ["supplier_id"], name: "index_supplier_formulas_on_supplier_id"
  end

  create_table "supplier_item_pricings", force: :cascade do |t|
    t.string "status"
    t.bigint "supplier_id", null: false
    t.bigint "pricing_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "item_id", null: false
    t.string "reference_number"
    t.index ["item_id"], name: "index_supplier_item_pricings_on_item_id"
    t.index ["pricing_id"], name: "index_supplier_item_pricings_on_pricing_id"
    t.index ["supplier_id"], name: "index_supplier_item_pricings_on_supplier_id"
  end

  create_table "supplier_item_requests", force: :cascade do |t|
    t.string "item_code"
    t.string "item_description"
    t.string "dimensions"
    t.string "price_per_pc"
    t.string "base_unit"
    t.string "target_unit"
    t.string "currency"
    t.bigint "supplier_document_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "valid_from"
    t.date "valid_to"
    t.integer "new_price"
    t.index ["supplier_document_id"], name: "index_supplier_item_requests_on_supplier_document_id"
  end

  create_table "suppliers", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "unit_of_measures", force: :cascade do |t|
    t.string "name"
    t.string "unit"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "role", default: "user", null: false
  end

  add_foreign_key "customer_formulas", "customers"
  add_foreign_key "customer_item_pricings", "customers"
  add_foreign_key "customer_item_pricings", "pricings"
  add_foreign_key "customers", "users"
  add_foreign_key "items", "customer_item_pricings"
  add_foreign_key "items", "dimensions"
  add_foreign_key "items", "main_item_pricings"
  add_foreign_key "items", "unit_of_measures", column: "base_unit_id"
  add_foreign_key "items", "unit_of_measures", column: "target_unit_id"
  add_foreign_key "main_item_pricings", "pricings"
  add_foreign_key "notifications", "users"
  add_foreign_key "pricings", "currencies"
  add_foreign_key "supplier_documents", "suppliers"
  add_foreign_key "supplier_formulas", "suppliers"
  add_foreign_key "supplier_item_pricings", "items"
  add_foreign_key "supplier_item_pricings", "pricings"
  add_foreign_key "supplier_item_pricings", "suppliers"
  add_foreign_key "supplier_item_requests", "supplier_documents"
end
