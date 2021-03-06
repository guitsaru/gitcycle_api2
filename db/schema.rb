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

ActiveRecord::Schema.define(version: 20140109005611) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "branches", force: true do |t|
    t.text     "body"
    t.string   "name"
    t.string   "state"
    t.string   "title"
    t.integer  "github_issue_id"
    t.string   "lighthouse_namespace"
    t.integer  "lighthouse_project_id"
    t.integer  "lighthouse_ticket_id"
    t.integer  "source_branch_id"
    t.integer  "repo_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "branches", ["github_issue_id"], name: "index_branches_on_github_issue_id", using: :btree
  add_index "branches", ["name"], name: "index_branches_on_name", unique: true, using: :btree
  add_index "branches", ["repo_id"], name: "index_branches_on_repo_id", using: :btree
  add_index "branches", ["source_branch_id"], name: "index_branches_on_source_branch_id", using: :btree
  add_index "branches", ["user_id"], name: "index_branches_on_user_id", using: :btree

  create_table "github_projects", force: true do |t|
    t.string   "owner"
    t.string   "repo"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "github_projects", ["user_id"], name: "index_github_projects_on_user_id", using: :btree

  create_table "lighthouse_users", force: true do |t|
    t.string   "namespace"
    t.string   "token"
    t.integer  "lighthouse_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "lighthouse_users", ["lighthouse_id"], name: "index_lighthouse_users_on_lighthouse_id", using: :btree
  add_index "lighthouse_users", ["namespace"], name: "index_lighthouse_users_on_namespace", using: :btree
  add_index "lighthouse_users", ["token"], name: "index_lighthouse_users_on_token", using: :btree
  add_index "lighthouse_users", ["user_id"], name: "index_lighthouse_users_on_user_id", using: :btree

  create_table "log_entries", force: true do |t|
    t.string   "event"
    t.string   "body",       limit: 10000
    t.string   "backtrace",  limit: 10000
    t.integer  "ran_at",     limit: 8
    t.integer  "log_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "log_entries", ["event"], name: "index_log_entries_on_event", using: :btree
  add_index "log_entries", ["log_id"], name: "index_log_entries_on_log_id", using: :btree
  add_index "log_entries", ["ran_at"], name: "index_log_entries_on_ran_at", using: :btree

  create_table "logs", force: true do |t|
    t.string   "exit_code"
    t.integer  "user_id"
    t.integer  "started_at",  limit: 8
    t.integer  "finished_at", limit: 8
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "logs", ["exit_code"], name: "index_logs_on_exit_code", using: :btree
  add_index "logs", ["finished_at"], name: "index_logs_on_finished_at", using: :btree
  add_index "logs", ["started_at", "finished_at"], name: "index_logs_on_started_at_and_finished_at", using: :btree
  add_index "logs", ["started_at"], name: "index_logs_on_started_at", using: :btree
  add_index "logs", ["user_id"], name: "index_logs_on_user_id", using: :btree

  create_table "pull_requests", force: true do |t|
    t.integer  "number"
    t.string   "status"
    t.string   "url"
    t.integer  "ticket_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "pull_requests", ["ticket_id"], name: "index_pull_requests_on_ticket_id", using: :btree
  add_index "pull_requests", ["user_id"], name: "index_pull_requests_on_user_id", using: :btree

  create_table "repos", force: true do |t|
    t.string   "name"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "repos", ["name", "user_id"], name: "index_repos_on_name_and_user_id", unique: true, using: :btree
  add_index "repos", ["name"], name: "index_repos_on_name", using: :btree
  add_index "repos", ["user_id"], name: "index_repos_on_user_id", using: :btree

  create_table "sessions", force: true do |t|
    t.string   "session_id", null: false
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sessions", ["session_id"], name: "index_sessions_on_session_id", unique: true, using: :btree
  add_index "sessions", ["updated_at"], name: "index_sessions_on_updated_at", using: :btree

  create_table "users", force: true do |t|
    t.string   "gitcycle"
    t.string   "github"
    t.string   "gravatar"
    t.string   "login"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["gitcycle"], name: "index_users_on_gitcycle", unique: true, using: :btree
  add_index "users", ["github", "login"], name: "index_users_on_github_and_login", unique: true, using: :btree
  add_index "users", ["github"], name: "index_users_on_github", unique: true, using: :btree
  add_index "users", ["login"], name: "index_users_on_login", unique: true, using: :btree

end
