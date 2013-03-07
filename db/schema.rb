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

ActiveRecord::Schema.define(:version => 20130305221645) do

  create_table "github_projects", :force => true do |t|
    t.string   "owner"
    t.string   "repo"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "lighthouse_projects", :force => true do |t|
    t.string   "namespace"
    t.integer  "number"
    t.string   "token"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "pull_requests", :force => true do |t|
    t.integer  "number"
    t.string   "status"
    t.string   "url"
    t.integer  "ticket_id"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "tickets", :force => true do |t|
    t.string   "service"
    t.integer  "number"
    t.string   "status"
    t.string   "title"
    t.string   "url",               :limit => 256
    t.string   "body",              :limit => 10240
    t.integer  "user_id"
    t.datetime "ticket_created_at"
    t.datetime "ticket_updated_at"
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "gitcycle"
    t.string   "github"
    t.string   "gravatar"
    t.string   "login"
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
