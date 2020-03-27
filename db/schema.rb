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

ActiveRecord::Schema.define(version: 2020_03_23_145339) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "attires", force: :cascade do |t|
    t.string "title", default: "", null: false
    t.text "description", default: "", null: false
    t.float "price", default: 0.0, null: false
    t.bigint "category_id"
    t.bigint "size_id"
    t.bigint "colour_id"
    t.bigint "fabric_id"
    t.bigint "situation_id"
    t.bigint "condition_id"
    t.bigint "brand_id"
    t.bigint "owner_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["brand_id"], name: "index_attires_on_brand_id"
    t.index ["category_id"], name: "index_attires_on_category_id"
    t.index ["colour_id"], name: "index_attires_on_colour_id"
    t.index ["condition_id"], name: "index_attires_on_condition_id"
    t.index ["fabric_id"], name: "index_attires_on_fabric_id"
    t.index ["owner_id"], name: "index_attires_on_owner_id"
    t.index ["situation_id"], name: "index_attires_on_situation_id"
    t.index ["size_id"], name: "index_attires_on_size_id"
  end

  create_table "borrows", force: :cascade do |t|
    t.datetime "start_date", null: false
    t.integer "duration", default: 0, null: false
    t.bigint "lender_id"
    t.bigint "borrower_id"
    t.bigint "attire_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["attire_id"], name: "index_borrows_on_attire_id"
    t.index ["borrower_id"], name: "index_borrows_on_borrower_id"
    t.index ["lender_id"], name: "index_borrows_on_lender_id"
  end

  create_table "brands", force: :cascade do |t|
    t.string "trademark", default: "", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "carts", force: :cascade do |t|
    t.float "sale_price", default: 0.0, null: false
    t.bigint "customer_id"
    t.bigint "attire_id"
    t.bigint "order_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["attire_id"], name: "index_carts_on_attire_id"
    t.index ["customer_id"], name: "index_carts_on_customer_id"
    t.index ["order_id"], name: "index_carts_on_order_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "kind", default: "", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cities", force: :cascade do |t|
    t.string "town", default: "", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "colours", force: :cascade do |t|
    t.string "tint", default: "", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "conditions", force: :cascade do |t|
    t.string "state", default: "", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "fabrics", force: :cascade do |t|
    t.string "variety", default: "", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "links", force: :cascade do |t|
    t.string "affinity", default: "", null: false
    t.bigint "linker_id"
    t.bigint "linked_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["linked_id"], name: "index_links_on_linked_id"
    t.index ["linker_id"], name: "index_links_on_linker_id"
  end

  create_table "orders", force: :cascade do |t|
    t.float "sold_price", default: 0.0, null: false
    t.string "stripe_customer_id", default: "", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "address"
    t.string "postcode"
    t.string "city"
    t.string "phone_number"
    t.string "email"
  end

  create_table "situations", force: :cascade do |t|
    t.string "scope", default: "", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sizes", force: :cascade do |t|
    t.string "measure", default: "", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name", default: "", null: false
    t.string "last_name", default: "", null: false
    t.text "about_me", default: "", null: false
    t.boolean "is_admin", default: false
    t.bigint "city_id"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "provider"
    t.string "uid"
    t.index ["city_id"], name: "index_users_on_city_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
end
