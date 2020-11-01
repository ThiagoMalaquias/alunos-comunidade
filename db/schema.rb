# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_11_01_170838) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string "nome"
    t.string "email"
    t.string "telefone"
    t.string "senha"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "alunos", force: :cascade do |t|
    t.integer "callback_type"
    t.string "hottok"
    t.string "aff"
    t.string "aff_name"
    t.string "currency"
    t.string "transaction"
    t.string "xcode"
    t.string "payment_type"
    t.string "payment_engine"
    t.string "status"
    t.string "prod"
    t.string "prod_name"
    t.string "producer_name"
    t.string "purchase_date"
    t.string "confirmation_purchase_date"
    t.string "original_offer_price"
    t.float "cms_marketplace"
    t.float "cms_vendor"
    t.float "price"
    t.float "full_price"
    t.string "name_subscription_plan"
    t.string "email"
    t.string "name"
    t.string "first_name"
    t.string "last_name"
    t.string "phone_checkout_local_code"
    t.string "phone_checkout_number"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "students", force: :cascade do |t|
    t.integer "callback_type"
    t.string "hottok"
    t.string "aff"
    t.string "aff_name"
    t.string "currency"
    t.string "xcode"
    t.string "payment_type"
    t.string "payment_engine"
    t.string "status"
    t.string "prod"
    t.string "prod_name"
    t.string "producer_name"
    t.string "purchase_date"
    t.string "confirmation_purchase_date"
    t.string "original_offer_price"
    t.float "cms_marketplace"
    t.float "cms_vendor"
    t.float "price"
    t.float "full_price"
    t.string "name_subscription_plan"
    t.string "email"
    t.string "name"
    t.string "first_name"
    t.string "last_name"
    t.string "phone_checkout_local_code"
    t.string "phone_checkout_number"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "testeqs", force: :cascade do |t|
    t.integer "callback_type"
    t.string "hottok"
    t.string "aff"
    t.string "aff_name"
    t.string "currency"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "testes", force: :cascade do |t|
    t.integer "callback_type"
    t.string "hottok"
    t.string "aff"
    t.string "aff_name"
    t.string "currency"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
