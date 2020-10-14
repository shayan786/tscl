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

ActiveRecord::Schema.define(version: 2020_10_14_163821) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "clubs", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "acronym"
    t.string "ground"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "map"
  end

  create_table "comments", force: :cascade do |t|
    t.string "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.bigint "game_id"
    t.index ["game_id"], name: "index_comments_on_game_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "documents", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "doc_type"
  end

  create_table "executive_committees", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.string "role"
    t.string "year"
  end

  create_table "games", force: :cascade do |t|
    t.date "date"
    t.integer "home_id"
    t.integer "away_id"
    t.integer "umpire_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "hc"
    t.boolean "ac"
    t.boolean "uc"
    t.boolean "he"
    t.boolean "ae"
    t.boolean "mr"
    t.bigint "season_id"
    t.integer "umpire_user_id"
    t.index ["season_id"], name: "index_games_on_season_id"
  end

  create_table "judiciary_committees", force: :cascade do |t|
    t.string "year"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "match_reports", force: :cascade do |t|
    t.string "start_time"
    t.string "match_result"
    t.string "payment"
    t.string "thirty_circle"
    t.string "boundary"
    t.string "scorecard"
    t.string "water"
    t.string "pitch"
    t.string "condition"
    t.string "wide"
    t.string "behavior"
    t.string "comments"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "game_id"
    t.bigint "user_id"
    t.index ["game_id"], name: "index_match_reports_on_game_id"
    t.index ["user_id"], name: "index_match_reports_on_user_id"
  end

  create_table "moms", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.bigint "game_id"
    t.index ["game_id"], name: "index_moms_on_game_id"
    t.index ["user_id"], name: "index_moms_on_user_id"
  end

  create_table "navigations", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "news", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "points", force: :cascade do |t|
    t.integer "wins"
    t.integer "loses"
    t.integer "tied"
    t.integer "bbowl"
    t.integer "bbat"
    t.integer "ue"
    t.integer "nur"
    t.integer "ss"
    t.integer "lzero"
    t.integer "jc"
    t.integer "nu"
    t.integer "gc"
    t.integer "palm"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "season_id"
    t.bigint "club_id"
    t.float "total_points"
    t.integer "ff"
    t.index ["club_id"], name: "index_points_on_club_id"
    t.index ["season_id"], name: "index_points_on_season_id"
  end

  create_table "seasons", force: :cascade do |t|
    t.integer "year"
    t.string "over_format"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "umpire_evaluations", force: :cascade do |t|
    t.string "start_time"
    t.string "nu_match_result"
    t.string "nu_lbw"
    t.string "nu_caught"
    t.string "nu_run_out"
    t.string "nu_no_balls"
    t.string "nu_consistency"
    t.string "nu_laws"
    t.string "nu_signal"
    t.string "nu_pressure"
    t.string "nu_overall"
    t.string "nu_attire"
    t.string "nu_comm_partner"
    t.string "nu_comm_captain"
    t.string "lu_stump"
    t.string "lu_run_out"
    t.string "lu_no_balls"
    t.string "lu_consistency"
    t.string "lu_laws"
    t.string "lu_signal"
    t.string "lu_overall"
    t.string "lu_comm_nu"
    t.string "lu_fair"
    t.string "comments"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "game_id"
    t.bigint "user_id"
    t.index ["game_id"], name: "index_umpire_evaluations_on_game_id"
    t.index ["user_id"], name: "index_umpire_evaluations_on_user_id"
  end

  create_table "user_club_associations", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "club_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "position"
    t.index ["club_id"], name: "index_user_club_associations_on_club_id"
    t.index ["user_id"], name: "index_user_club_associations_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "is_ec"
    t.boolean "is_captain"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.boolean "is_active"
    t.string "umpire_level"
    t.boolean "admin", default: false
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "winners", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "season_id"
    t.integer "club_id"
    t.index ["season_id"], name: "index_winners_on_season_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
end
