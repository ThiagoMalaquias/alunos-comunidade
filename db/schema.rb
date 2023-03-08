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

ActiveRecord::Schema.define(version: 2023_01_09_134302) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "administradors", force: :cascade do |t|
    t.string "nome"
    t.string "email"
    t.string "senha"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "alunos", force: :cascade do |t|
    t.string "callback_type"
    t.string "hottok"
    t.string "aff"
    t.string "aff_name"
    t.string "currency"
    t.string "xcode"
    t.string "payment_type"
    t.string "status"
    t.string "prod"
    t.string "prod_name"
    t.string "producer_name"
    t.string "purchase_date"
    t.string "original_offer_price"
    t.string "cms_marketplace"
    t.string "cms_vendor"
    t.string "price"
    t.string "full_price"
    t.string "name_subscription_plan"
    t.string "email"
    t.string "name"
    t.string "first_name"
    t.string "last_name"
    t.string "phone_checkout_local_code"
    t.string "phone_checkout_number"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.date "confirmation_purchase_date"
    t.string "vencimento"
    t.string "category"
    t.text "description"
    t.string "discord"
  end

end
