# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_01_25_025519) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "contributors", force: :cascade do |t|
    t.uuid "uuid", default: -> { "gen_random_uuid()" }, null: false
    t.string "name", limit: 150, null: false
    t.string "title", limit: 150, null: false
    t.string "able_email", limit: 150
    t.string "caring_email", limit: 150
    t.boolean "active", default: true
    t.datetime "start_date"
    t.datetime "end_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["uuid"], name: "index_contributors_on_uuid"
  end

  create_table "metrics", force: :cascade do |t|
    t.uuid "uuid", default: -> { "gen_random_uuid()" }, null: false
    t.string "name", null: false
    t.string "description", limit: 200
    t.string "unit", limit: 5
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["uuid"], name: "index_metrics_on_uuid"
  end

  create_table "project_metrics", force: :cascade do |t|
    t.bigint "project_id", null: false
    t.bigint "metric_id", null: false
    t.decimal "value", default: "0.0"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["metric_id"], name: "index_project_metrics_on_metric_id"
    t.index ["project_id"], name: "index_project_metrics_on_project_id"
  end

  create_table "projects", force: :cascade do |t|
    t.uuid "uuid", default: -> { "gen_random_uuid()" }, null: false
    t.string "name", limit: 120, null: false
    t.string "code", limit: 3, null: false
    t.boolean "is_program", default: false
    t.bigint "project_id"
    t.boolean "active", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_projects_on_project_id"
    t.index ["uuid"], name: "index_projects_on_uuid"
  end

  create_table "roles", force: :cascade do |t|
    t.uuid "uuid", default: -> { "gen_random_uuid()" }, null: false
    t.string "code", null: false
    t.string "name", null: false
    t.boolean "active", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["code"], name: "unique_rolecode", unique: true
    t.index ["uuid"], name: "index_roles_on_uuid"
  end

  create_table "team_members", force: :cascade do |t|
    t.uuid "uuid", default: -> { "gen_random_uuid()" }, null: false
    t.bigint "team_id", null: false
    t.bigint "contributor_id", null: false
    t.bigint "role_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["contributor_id"], name: "index_team_members_on_contributor_id"
    t.index ["role_id"], name: "index_team_members_on_role_id"
    t.index ["team_id"], name: "index_team_members_on_team_id"
    t.index ["uuid"], name: "index_team_members_on_uuid"
  end

  create_table "teams", force: :cascade do |t|
    t.uuid "uuid", default: -> { "gen_random_uuid()" }, null: false
    t.string "code", limit: 3, null: false
    t.string "name", limit: 120, null: false
    t.boolean "active", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["uuid"], name: "index_teams_on_uuid"
  end

  create_table "users", force: :cascade do |t|
    t.uuid "uuid", default: -> { "gen_random_uuid()" }, null: false
    t.string "name", limit: 200, null: false
    t.string "user_name", limit: 80, null: false
    t.string "email", null: false
    t.string "password_digest", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "unique_emails", unique: true
    t.index ["uuid"], name: "index_users_on_uuid"
  end

  add_foreign_key "project_metrics", "metrics"
  add_foreign_key "project_metrics", "projects"
  add_foreign_key "projects", "projects"
  add_foreign_key "team_members", "contributors"
  add_foreign_key "team_members", "roles"
  add_foreign_key "team_members", "teams"
end
