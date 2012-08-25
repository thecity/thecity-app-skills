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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120825044013) do

  create_table "skills", :force => true do |t|
    t.integer "external_id", :null => false
    t.string  "name",        :null => false
  end

  create_table "user_skills", :force => true do |t|
    t.integer "skills_id"
    t.integer "users_id"
  end

  create_table "users", :force => true do |t|
    t.integer  "external_id",                            :null => false
    t.boolean  "active",               :default => true, :null => false
    t.string   "first_name",                             :null => false
    t.string   "nickname"
    t.string   "last_name",                              :null => false
    t.string   "gender",                                 :null => false
    t.string   "email"
    t.string   "primary_phone"
    t.string   "primary_phone_type"
    t.string   "secondary_phone"
    t.string   "secondary_phone_type"
    t.string   "primary_campus"
    t.datetime "memberized_at"
    t.datetime "last_engaged_at"
    t.datetime "last_logged_in_at"
    t.string   "password_digest"
  end

end