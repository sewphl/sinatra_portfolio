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

ActiveRecord::Schema.define(version: 20190225183035) do

  create_table "customers", force: :cascade do |t|
    t.string "username"
    t.string "first_name"
    t.string "last_name"
    t.string "address"
    t.string "email"
    t.string "password_digest"
  end

  create_table "herbs", force: :cascade do |t|
    t.string "name"
    t.string "plant_part"
    t.string "latin_name"
  end

  create_table "orders", force: :cascade do |t|
    t.integer "customer_id"
    t.integer "completed_order"
  end

  create_table "orders_tinctures", force: :cascade do |t|
    t.integer "order_id"
    t.integer "tincture_id"
  end

  create_table "tinctures", force: :cascade do |t|
    t.string  "name"
    t.string  "supports"
    t.integer "inventory"
  end

  create_table "tinctures_herbs", force: :cascade do |t|
    t.integer "tincture_id"
    t.integer "herb_id"
  end

end
