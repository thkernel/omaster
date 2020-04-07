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

ActiveRecord::Schema.define(version: 2020_04_06_062657) do

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

  create_table "agents", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "gender"
    t.string "address"
    t.string "phone"
    t.string "city"
    t.string "country"
    t.string "email"
    t.text "description"
    t.string "status"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_agents_on_user_id"
  end

  create_table "checkouts", force: :cascade do |t|
    t.string "uid"
    t.string "name"
    t.float "minimum_balance"
    t.float "maximum_balance"
    t.string "current_balance"
    t.string "status"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_checkouts_on_user_id"
  end

  create_table "cities", force: :cascade do |t|
    t.string "name"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "companies", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "phone"
    t.string "fax"
    t.string "po_box"
    t.string "city"
    t.string "country"
    t.string "website"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_companies_on_user_id"
  end

  create_table "customer_types", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "status"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_customer_types_on_user_id"
  end

  create_table "customers", force: :cascade do |t|
    t.bigint "customer_type_id"
    t.string "company_name"
    t.string "contact_name"
    t.string "address"
    t.string "personal_phone"
    t.string "work_phone"
    t.string "fleet_number"
    t.string "city"
    t.string "country"
    t.string "email"
    t.bigint "agent_id"
    t.bigint "user_id"
    t.text "description"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["agent_id"], name: "index_customers_on_agent_id"
    t.index ["customer_type_id"], name: "index_customers_on_customer_type_id"
    t.index ["user_id"], name: "index_customers_on_user_id"
  end

  create_table "head_pont_types", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "status"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_head_pont_types_on_user_id"
  end

  create_table "head_ponts", force: :cascade do |t|
    t.bigint "head_pont_type_id"
    t.string "number"
    t.string "status"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["head_pont_type_id"], name: "index_head_ponts_on_head_pont_type_id"
    t.index ["user_id"], name: "index_head_ponts_on_user_id"
  end

  create_table "localities", force: :cascade do |t|
    t.bigint "city_id"
    t.string "name"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["city_id"], name: "index_localities_on_city_id"
  end

  create_table "payment_types", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "payments", force: :cascade do |t|
    t.string "uid"
    t.bigint "send_unit_value_id"
    t.bigint "payment_type_id"
    t.bigint "checkout_id"
    t.float "amount"
    t.integer "shop_id"
    t.string "status"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["checkout_id"], name: "index_payments_on_checkout_id"
    t.index ["payment_type_id"], name: "index_payments_on_payment_type_id"
    t.index ["send_unit_value_id"], name: "index_payments_on_send_unit_value_id"
    t.index ["user_id"], name: "index_payments_on_user_id"
  end

  create_table "permission_roles", force: :cascade do |t|
    t.bigint "role_id"
    t.bigint "permission_id"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["permission_id"], name: "index_permission_roles_on_permission_id"
    t.index ["role_id"], name: "index_permission_roles_on_role_id"
  end

  create_table "permissions", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "profiles", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "gender"
    t.string "address"
    t.string "phone"
    t.string "country"
    t.string "city"
    t.bigint "service_id"
    t.text "about"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["service_id"], name: "index_profiles_on_service_id"
    t.index ["user_id"], name: "index_profiles_on_user_id"
  end

  create_table "remote_nafamas", force: :cascade do |t|
    t.string "uid"
    t.float "amount"
    t.bigint "customer_id"
    t.string "status"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_remote_nafamas_on_customer_id"
    t.index ["user_id"], name: "index_remote_nafamas_on_user_id"
  end

  create_table "remote_unit_values", force: :cascade do |t|
    t.string "uid"
    t.string "sender"
    t.string "receiver"
    t.float "amount"
    t.string "status"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_remote_unit_values_on_user_id"
  end

  create_table "return_unit_values", force: :cascade do |t|
    t.string "uid"
    t.string "reason"
    t.bigint "customer_id"
    t.float "amount"
    t.bigint "agent_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["agent_id"], name: "index_return_unit_values_on_agent_id"
    t.index ["customer_id"], name: "index_return_unit_values_on_customer_id"
    t.index ["user_id"], name: "index_return_unit_values_on_user_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "send_unit_values", force: :cascade do |t|
    t.string "uid"
    t.string "reason"
    t.bigint "customer_id"
    t.float "amount"
    t.bigint "agent_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["agent_id"], name: "index_send_unit_values_on_agent_id"
    t.index ["customer_id"], name: "index_send_unit_values_on_customer_id"
    t.index ["user_id"], name: "index_send_unit_values_on_user_id"
  end

  create_table "services", force: :cascade do |t|
    t.string "name"
    t.integer "parent"
    t.text "description"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "shops", force: :cascade do |t|
    t.bigint "locality_id"
    t.string "name"
    t.string "phone_number"
    t.string "status"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["locality_id"], name: "index_shops_on_locality_id"
    t.index ["user_id"], name: "index_shops_on_user_id"
  end

  create_table "sub_head_pont_types", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "status"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_sub_head_pont_types_on_user_id"
  end

  create_table "sub_head_ponts", force: :cascade do |t|
    t.bigint "sub_head_pont_type_id"
    t.string "number"
    t.text "description"
    t.string "status"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["sub_head_pont_type_id"], name: "index_sub_head_ponts_on_sub_head_pont_type_id"
    t.index ["user_id"], name: "index_sub_head_ponts_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "login"
    t.string "uui"
    t.bigint "role_id", null: false
    t.integer "created_by"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["role_id"], name: "index_users_on_role_id"
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "agents", "users"
  add_foreign_key "checkouts", "users"
  add_foreign_key "companies", "users"
  add_foreign_key "customer_types", "users"
  add_foreign_key "customers", "agents"
  add_foreign_key "customers", "customer_types"
  add_foreign_key "customers", "users"
  add_foreign_key "head_pont_types", "users"
  add_foreign_key "head_ponts", "head_pont_types"
  add_foreign_key "head_ponts", "users"
  add_foreign_key "localities", "cities"
  add_foreign_key "payments", "checkouts"
  add_foreign_key "payments", "payment_types"
  add_foreign_key "payments", "send_unit_values"
  add_foreign_key "payments", "users"
  add_foreign_key "permission_roles", "permissions"
  add_foreign_key "permission_roles", "roles"
  add_foreign_key "profiles", "services"
  add_foreign_key "profiles", "users"
  add_foreign_key "remote_nafamas", "customers"
  add_foreign_key "remote_nafamas", "users"
  add_foreign_key "remote_unit_values", "users"
  add_foreign_key "return_unit_values", "agents"
  add_foreign_key "return_unit_values", "customers"
  add_foreign_key "return_unit_values", "users"
  add_foreign_key "send_unit_values", "agents"
  add_foreign_key "send_unit_values", "customers"
  add_foreign_key "send_unit_values", "users"
  add_foreign_key "shops", "localities"
  add_foreign_key "shops", "users"
  add_foreign_key "sub_head_pont_types", "users"
  add_foreign_key "sub_head_ponts", "sub_head_pont_types"
  add_foreign_key "sub_head_ponts", "users"
  add_foreign_key "users", "roles"
end
