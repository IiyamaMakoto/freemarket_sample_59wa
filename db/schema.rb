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

ActiveRecord::Schema.define(version: 2020_02_02_042512) do

  create_table "brands", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", limit: 40
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "ancestry"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ancestry"], name: "index_categories_on_ancestry"
  end

  create_table "dealings", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "buyer_id", null: false
    t.bigint "item_id", null: false
    t.string "charge", null: false
    t.integer "dealing_status_id", null: false
    t.string "last_name", limit: 40, default: "", null: false
    t.string "first_name", limit: 40, default: "", null: false
    t.string "last_name_kana", limit: 40, default: "", null: false
    t.string "first_name_kana", limit: 40, default: "", null: false
    t.string "postal_number", limit: 10, default: "", null: false
    t.integer "prefecture_id", default: 0, null: false
    t.string "city", limit: 50, default: "", null: false
    t.string "block", limit: 50, default: "", null: false
    t.string "building_name", limit: 50
    t.bigint "phone_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["buyer_id"], name: "index_dealings_on_buyer_id"
    t.index ["item_id"], name: "index_dealings_on_item_id"
  end

  create_table "images", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "image", null: false
    t.bigint "item_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_images_on_item_id"
  end

  create_table "items", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", limit: 80, null: false
    t.text "detail", null: false
    t.integer "price", null: false
    t.bigint "seller_id", null: false
    t.bigint "buyer_id"
    t.boolean "is_seller_shipping", null: false
    t.integer "prefecture_id", null: false
    t.integer "shipping_period_id", null: false
    t.integer "shipping_method_id", null: false
    t.bigint "brand_id"
    t.bigint "category_id", null: false
    t.integer "item_status_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "condition_id", null: false
    t.index ["brand_id"], name: "index_items_on_brand_id"
    t.index ["buyer_id"], name: "index_items_on_buyer_id"
    t.index ["category_id"], name: "index_items_on_category_id"
    t.index ["seller_id"], name: "index_items_on_seller_id"
  end

  create_table "likes", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "item_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_likes_on_item_id"
    t.index ["user_id"], name: "index_likes_on_user_id"
  end

  create_table "sns_credentials", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "provider"
    t.string "uid"
    t.integer "user_id"
    t.string "name"
    t.string "email"
    t.string "token"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_deliveries", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "last_name", limit: 40, default: "", null: false
    t.string "first_name", limit: 40, default: "", null: false
    t.string "last_name_kana", limit: 40, default: "", null: false
    t.string "first_name_kana", limit: 40, default: "", null: false
    t.string "postal_number", limit: 10, default: "", null: false
    t.integer "prefecture_id", default: 0, null: false
    t.string "city", limit: 50, default: "", null: false
    t.string "block", limit: 50, default: "", null: false
    t.string "building_name", limit: 50
    t.bigint "phone_number"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_user_deliveries_on_user_id"
  end

  create_table "user_payments", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "customer_id", null: false
    t.string "card_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_user_payments_on_user_id"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", limit: 40, default: "", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "last_name", limit: 40, default: "", null: false
    t.string "first_name", limit: 40, default: "", null: false
    t.string "last_name_kana", limit: 40, default: "", null: false
    t.string "first_name_kana", limit: 40, default: "", null: false
    t.bigint "mobile_phone_number", default: 1111111111, null: false
    t.date "birthday"
    t.text "profile"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["name"], name: "index_users_on_name"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "dealings", "items"
  add_foreign_key "dealings", "users", column: "buyer_id"
  add_foreign_key "images", "items"
  add_foreign_key "items", "brands"
  add_foreign_key "items", "categories"
  add_foreign_key "items", "users", column: "buyer_id"
  add_foreign_key "items", "users", column: "seller_id"
  add_foreign_key "likes", "items"
  add_foreign_key "likes", "users"
  add_foreign_key "user_deliveries", "users"
  add_foreign_key "user_payments", "users"
end
