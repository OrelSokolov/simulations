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

ActiveRecord::Schema.define(version: 2019_09_25_121027) do

  create_table "tasks", force: :cascade do |t|
    t.integer "status", default: 0, null: false
    t.integer "simulations_count", default: 0, null: false
    t.string "eta", default: "0", null: false
    t.text "report", default: "", null: false
    t.string "config", default: "", null: false
    t.text "config_json", default: "", null: false
    t.string "benchmark_version", default: "", null: false
    t.boolean "report_table", default: false, null: false
    t.boolean "report_distribution", default: false, null: false
    t.boolean "report_graph", default: false, null: false
    t.boolean "report_w1", default: false, null: false
    t.boolean "report_dragons", default: false, null: false
    t.float "progress", default: 0.0, null: false
    t.string "line_count", default: "1", null: false
    t.string "bet_per_line", default: "1", null: false
    t.string "currency", default: "EUR", null: false
    t.integer "worker_id"
    t.integer "threads", default: 20
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "workers", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
