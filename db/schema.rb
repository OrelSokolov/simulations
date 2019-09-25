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

ActiveRecord::Schema.define(version: 2019_09_25_065644) do

  create_table "tasks", force: :cascade do |t|
    t.integer "status"
    t.integer "simulations_count"
    t.string "eta"
    t.text "report"
    t.string "config"
    t.text "config_json"
    t.string "benchmark_version"
    t.boolean "report_table"
    t.boolean "report_distribution"
    t.boolean "report_graph"
    t.boolean "report_w1"
    t.boolean "report_dragons"
    t.float "progress"
    t.string "line_count"
    t.string "bet_per_line"
    t.string "currency"
    t.integer "worker_id"
    t.integer "threads"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "workers", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
