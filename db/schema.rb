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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120724182535) do

  create_table "customers", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "phone"
    t.text     "address"
    t.integer  "delivery_route"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "orders", :force => true do |t|
    t.integer  "monday_orders"
    t.integer  "tuesday_orders"
    t.integer  "wednesday_orders"
    t.integer  "thursday_orders"
    t.text     "address"
    t.string   "email"
    t.string   "phone"
    t.string   "name"
    t.integer  "customer_id"
    t.integer  "week_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "orders", ["customer_id"], :name => "index_orders_on_customer_id"
  add_index "orders", ["week_id"], :name => "index_orders_on_week_id"

  create_table "settings", :force => true do |t|
    t.string   "key"
    t.string   "value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "weeks", :force => true do |t|
    t.date     "start_date"
    t.string   "monday_item"
    t.float    "monday_price"
    t.string   "tuesday_item"
    t.float    "tuesday_price"
    t.string   "wednesday_item"
    t.float    "wednesday_price"
    t.string   "thursday_item"
    t.float    "thursday_price"
    t.float    "delivery_fee"
    t.text     "comment"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
