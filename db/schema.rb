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

ActiveRecord::Schema[7.0].define(version: 2023_02_23_151408) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pgcrypto"
  enable_extension "plpgsql"

  create_table "book_contents", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "book_section_id", null: false
    t.string "text"
    t.string "content_type", null: false
    t.integer "sequence", null: false
    t.json "metadata"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "bookmark_count", default: 0, null: false
    t.integer "comment_count", default: 0, null: false
    t.index ["book_section_id"], name: "index_book_contents_on_book_section_id"
  end

  create_table "book_sections", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "book_id", null: false
    t.string "ref_id"
    t.string "title"
    t.integer "sequence"
    t.integer "length"
    t.string "section_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "icon"
    t.index ["book_id"], name: "index_book_sections_on_book_id"
  end

  create_table "books", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "title", null: false
    t.string "language"
    t.string "author"
    t.string "subjects", array: true
    t.string "publisher"
    t.string "description"
    t.string "date_published"
    t.string "rights"
    t.string "length_unit"
    t.integer "length"
    t.integer "content_count", null: false
    t.jsonb "identifiers", null: false
    t.json "contributors"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "bookmark_count", default: 0, null: false
  end

  create_table "comments", force: :cascade do |t|
    t.uuid "book_contents_id", null: false
    t.uuid "user_id", null: false
    t.string "text", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["book_contents_id"], name: "index_comments_on_book_contents_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "user_book_metadata", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "book_id", null: false
    t.uuid "user_id", null: false
    t.uuid "current_section_id"
    t.string "content_bookmarks", default: [], null: false, array: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["book_id"], name: "index_user_book_metadata_on_book_id"
    t.index ["current_section_id"], name: "index_user_book_metadata_on_current_section_id"
    t.index ["user_id"], name: "index_user_book_metadata_on_user_id"
  end

  create_table "users", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.string "username", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "book_contents", "book_sections"
  add_foreign_key "book_sections", "books"
  add_foreign_key "comments", "book_contents", column: "book_contents_id"
  add_foreign_key "comments", "users"
  add_foreign_key "user_book_metadata", "book_sections", column: "current_section_id"
  add_foreign_key "user_book_metadata", "books"
  add_foreign_key "user_book_metadata", "users"
end
