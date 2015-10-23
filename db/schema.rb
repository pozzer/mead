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

ActiveRecord::Schema.define(version: 20151023103807) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answers", force: :cascade do |t|
    t.text     "content"
    t.integer  "user_id"
    t.integer  "question_id"
    t.boolean  "answers",     default: false, null: false
    t.boolean  "best",        default: false, null: false
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "authorizations", force: :cascade do |t|
    t.string   "provider"
    t.string   "uid"
    t.integer  "user_id"
    t.string   "token"
    t.string   "secret"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "avaliation_trades", force: :cascade do |t|
    t.integer  "rating"
    t.text     "content"
    t.integer  "trade_id"
    t.integer  "assessed_id"
    t.integer  "appraiser_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "bottle_trades", force: :cascade do |t|
    t.integer  "owner_id"
    t.integer  "trade_id"
    t.integer  "bottle_id"
    t.integer  "amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "bottles", force: :cascade do |t|
    t.string   "label"
    t.string   "organization_name"
    t.date     "filling_date"
    t.string   "style"
    t.integer  "amount"
    t.text     "about"
    t.string   "measure"
    t.string   "abv"
    t.boolean  "private"
    t.integer  "user_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "cities", force: :cascade do |t|
    t.string   "name"
    t.integer  "state_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "doc", primary_key: "doc_pk", force: :cascade do |t|
    t.string "name"
  end

  create_table "doc_empl", id: false, force: :cascade do |t|
    t.integer "doc_k",  null: false
    t.integer "empl_k", null: false
  end

  create_table "empl", primary_key: "empl_pk", force: :cascade do |t|
    t.string "name"
  end

  create_table "empl_addr", id: false, force: :cascade do |t|
    t.integer "empl_k",  null: false
    t.string  "type",    null: false
    t.string  "address"
  end

  create_table "empl_doc", id: false, force: :cascade do |t|
    t.integer "empl_k", null: false
    t.integer "doc_k",  null: false
  end

  create_table "favorite_questions", force: :cascade do |t|
    t.integer  "question_id"
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "message_trades", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "trade_id"
    t.text     "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pictures", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "picture_file_name"
    t.string   "picture_content_type"
    t.integer  "picture_file_size"
    t.datetime "picture_update_at"
    t.integer  "attachable_id"
    t.string   "attachable_type"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "profiles", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.date     "birth_date"
    t.string   "state_id"
    t.string   "city_id"
    t.text     "about"
    t.string   "organization_name"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.integer  "user_id"
  end

  create_table "questions", force: :cascade do |t|
    t.string   "title"
    t.text     "content"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rs_evaluations", force: :cascade do |t|
    t.string   "reputation_name"
    t.integer  "source_id"
    t.string   "source_type"
    t.integer  "target_id"
    t.string   "target_type"
    t.float    "value",           default: 0.0
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.text     "data"
  end

  add_index "rs_evaluations", ["reputation_name", "source_id", "source_type", "target_id", "target_type"], name: "index_rs_evaluations_on_reputation_name_and_source_and_target", unique: true, using: :btree
  add_index "rs_evaluations", ["reputation_name"], name: "index_rs_evaluations_on_reputation_name", using: :btree
  add_index "rs_evaluations", ["source_id", "source_type"], name: "index_rs_evaluations_on_source_id_and_source_type", using: :btree
  add_index "rs_evaluations", ["target_id", "target_type"], name: "index_rs_evaluations_on_target_id_and_target_type", using: :btree

  create_table "rs_reputation_messages", force: :cascade do |t|
    t.integer  "sender_id"
    t.string   "sender_type"
    t.integer  "receiver_id"
    t.float    "weight",      default: 1.0
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "rs_reputation_messages", ["receiver_id", "sender_id", "sender_type"], name: "index_rs_reputation_messages_on_receiver_id_and_sender", unique: true, using: :btree
  add_index "rs_reputation_messages", ["receiver_id"], name: "index_rs_reputation_messages_on_receiver_id", using: :btree
  add_index "rs_reputation_messages", ["sender_id", "sender_type"], name: "index_rs_reputation_messages_on_sender_id_and_sender_type", using: :btree

  create_table "rs_reputations", force: :cascade do |t|
    t.string   "reputation_name"
    t.float    "value",           default: 0.0
    t.string   "aggregated_by"
    t.integer  "target_id"
    t.string   "target_type"
    t.boolean  "active",          default: true
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.text     "data"
  end

  add_index "rs_reputations", ["reputation_name", "target_id", "target_type"], name: "index_rs_reputations_on_reputation_name_and_target", unique: true, using: :btree
  add_index "rs_reputations", ["reputation_name"], name: "index_rs_reputations_on_reputation_name", using: :btree
  add_index "rs_reputations", ["target_id", "target_type"], name: "index_rs_reputations_on_target_id_and_target_type", using: :btree

  create_table "states", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "taggings", force: :cascade do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "context",       limit: 128
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "taggings", ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true, using: :btree
  add_index "taggings", ["taggable_id", "taggable_type", "context"], name: "index_taggings_on_taggable_id_and_taggable_type_and_context", using: :btree

  create_table "tags", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.integer  "taggings_count", default: 0
  end

  add_index "tags", ["name"], name: "index_tags_on_name", unique: true, using: :btree

  create_table "trades", force: :cascade do |t|
    t.integer  "negotiator_id"
    t.integer  "negotiant_id"
    t.integer  "status"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name",                   default: "", null: false
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "failed_attempts",        default: 0,  null: false
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "provider"
    t.string   "uid"
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["provider"], name: "index_users_on_provider", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["uid"], name: "index_users_on_uid", using: :btree
  add_index "users", ["unlock_token"], name: "index_users_on_unlock_token", unique: true, using: :btree

  add_foreign_key "doc_empl", "doc", column: "doc_k", primary_key: "doc_pk", name: "doc_empl_doc_k_fkey"
  add_foreign_key "doc_empl", "empl", column: "empl_k", primary_key: "empl_pk", name: "doc_empl_empl_k_fkey"
  add_foreign_key "empl_addr", "empl", column: "empl_k", primary_key: "empl_pk", name: "empl_addr_empl_k_fkey"
  add_foreign_key "empl_doc", "doc", column: "doc_k", primary_key: "doc_pk", name: "empl_doc_doc_k_fkey"
  add_foreign_key "empl_doc", "empl", column: "empl_k", primary_key: "empl_pk", name: "empl_doc_empl_k_fkey"
end
