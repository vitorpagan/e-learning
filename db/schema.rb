# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20151111015153) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "zipcode",    limit: 10
    t.string   "address",    limit: 255
    t.integer  "number"
    t.string   "complement", limit: 50
    t.string   "district",   limit: 100
    t.string   "city",       limit: 100
    t.string   "state",      limit: 100
    t.string   "country",    limit: 100
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "addresses", ["user_id"], name: "index_addresses_on_user_id", using: :btree

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.string   "slug"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "parent_id"
    t.string   "identifier"
  end

  add_index "categories", ["slug"], name: "index_categories_on_slug", unique: true, using: :btree

  create_table "courses", force: :cascade do |t|
    t.string   "name"
    t.integer  "category_id"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.integer  "level_id"
    t.decimal  "price",        default: 0.0
    t.string   "slug"
    t.string   "description"
    t.string   "thumbnail"
    t.string   "certificate"
    t.integer  "order_number"
    t.boolean  "active",       default: true
  end

  add_index "courses", ["category_id"], name: "index_courses_on_category_id", using: :btree
  add_index "courses", ["level_id"], name: "index_courses_on_level_id", using: :btree

  create_table "courses_video_classes", id: false, force: :cascade do |t|
    t.integer "course_id"
    t.integer "video_class_id"
  end

  add_index "courses_video_classes", ["course_id"], name: "index_courses_video_classes_on_course_id", using: :btree
  add_index "courses_video_classes", ["video_class_id"], name: "index_courses_video_classes_on_video_class_id", using: :btree

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true, using: :btree
  add_index "friendly_id_slugs", ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type", using: :btree
  add_index "friendly_id_slugs", ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id", using: :btree
  add_index "friendly_id_slugs", ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type", using: :btree

  create_table "levels", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "logs", force: :cascade do |t|
    t.string   "id_transaction"
    t.integer  "status"
    t.string   "content"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "orders", force: :cascade do |t|
    t.integer  "shopping_cart_id"
    t.integer  "status"
    t.integer  "payment_method_id"
    t.string   "order_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.string   "payment_code"
    t.string   "url"
    t.string   "token"
    t.string   "id_transaction"
  end

  add_index "orders", ["shopping_cart_id"], name: "index_orders_on_shopping_cart_id", using: :btree

  create_table "prerequisites", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "prerequisites_video_classes", id: false, force: :cascade do |t|
    t.integer "prerequisite_id"
    t.integer "video_class_id"
  end

  add_index "prerequisites_video_classes", ["prerequisite_id"], name: "index_prerequisites_video_classes_on_prerequisite_id", using: :btree
  add_index "prerequisites_video_classes", ["video_class_id"], name: "index_prerequisites_video_classes_on_video_class_id", using: :btree

  create_table "professionals", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "thumbnail"
    t.string   "description"
  end

  create_table "providers", force: :cascade do |t|
    t.integer  "name"
    t.string   "uid"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "providers", ["user_id"], name: "index_providers_on_user_id", using: :btree

  create_table "public_targets", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "public_targets_video_classes", id: false, force: :cascade do |t|
    t.integer "public_target_id"
    t.integer "video_class_id"
  end

  add_index "public_targets_video_classes", ["public_target_id"], name: "index_public_targets_video_classes_on_public_target_id", using: :btree
  add_index "public_targets_video_classes", ["video_class_id"], name: "index_public_targets_video_classes_on_video_class_id", using: :btree

  create_table "shopping_cart_items", force: :cascade do |t|
    t.integer  "shopping_cart_id"
    t.integer  "course_id"
    t.integer  "video_class_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "shopping_cart_items", ["course_id"], name: "index_shopping_cart_items_on_course_id", using: :btree
  add_index "shopping_cart_items", ["shopping_cart_id"], name: "index_shopping_cart_items_on_shopping_cart_id", using: :btree
  add_index "shopping_cart_items", ["video_class_id"], name: "index_shopping_cart_items_on_video_class_id", using: :btree

  create_table "shopping_carts", force: :cascade do |t|
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "shopping_carts", ["user_id"], name: "index_shopping_carts_on_user_id", using: :btree

  create_table "user_courses", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "course_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "user_courses", ["course_id"], name: "index_user_courses_on_course_id", using: :btree
  add_index "user_courses", ["user_id"], name: "index_user_courses_on_user_id", using: :btree

  create_table "user_videos", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "video_class_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "user_videos", ["user_id"], name: "index_user_videos_on_user_id", using: :btree
  add_index "user_videos", ["video_class_id"], name: "index_user_videos_on_video_class_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.boolean  "status",                 default: true
    t.boolean  "admin",                  default: false
    t.string   "phone"
    t.string   "uid"
    t.string   "image"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "vaults", force: :cascade do |t|
    t.integer  "final_digits"
    t.string   "code"
    t.string   "flag"
    t.boolean  "active",       default: true
    t.integer  "user_id"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_index "vaults", ["user_id"], name: "index_vaults_on_user_id", using: :btree

  create_table "video_classes", force: :cascade do |t|
    t.string   "title"
    t.string   "description"
    t.integer  "duration"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.decimal  "price",           default: 0.0
    t.integer  "professional_id"
    t.string   "slug"
    t.string   "thumbnail"
    t.text     "embed_ios"
    t.text     "embed_android"
    t.text     "embed"
    t.string   "handout"
    t.boolean  "free",            default: false
  end

  add_index "video_classes", ["professional_id"], name: "index_video_classes_on_professional_id", using: :btree

  add_foreign_key "courses", "categories"
  add_foreign_key "orders", "shopping_carts"
  add_foreign_key "shopping_cart_items", "courses"
  add_foreign_key "shopping_cart_items", "shopping_carts"
  add_foreign_key "shopping_cart_items", "video_classes"
  add_foreign_key "shopping_carts", "users"
  add_foreign_key "user_courses", "courses"
  add_foreign_key "user_courses", "users"
  add_foreign_key "user_videos", "users"
  add_foreign_key "user_videos", "video_classes"
  add_foreign_key "vaults", "users"
  add_foreign_key "video_classes", "professionals"
end
