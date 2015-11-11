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

ActiveRecord::Schema.define(version: 20151110161300) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "contracts", force: :cascade do |t|
    t.text     "company_status"
    t.string   "headquarters_address"
    t.string   "company_name"
    t.integer  "share_capital"
    t.integer  "rcs_number"
    t.string   "rcs_city"
    t.text     "company_object"
    t.date     "company_created_on"
    t.integer  "amount_to_be_raised"
    t.integer  "founders_receivables"
    t.text     "specific_engagment"
    t.text     "investisors_right"
    t.text     "juridiction_law"
    t.date     "signed_on"
    t.string   "signature_localization"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "investors", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "nationality"
    t.string   "address"
    t.integer  "amount_raised"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "contract_id"
    t.text     "email"
  end

  add_index "investors", ["contract_id"], name: "index_investors_on_contract_id", using: :btree

  create_table "partners", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.integer  "phone"
    t.string   "address"
    t.datetime "birth_date"
    t.string   "birth_location"
    t.string   "nationality"
    t.boolean  "admin"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "investors", "contracts"
end
