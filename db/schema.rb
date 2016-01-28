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

ActiveRecord::Schema.define(version: 20160127153822) do

  create_table "colonypcrs", force: :cascade do |t|
    t.integer "pcr_id",       limit: 4, null: false
    t.integer "forprimer_id", limit: 4, null: false
    t.integer "revprimer_id", limit: 4, null: false
  end

  create_table "geeks", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
  end

  add_index "geeks", ["email"], name: "index_geeks_on_email", unique: true, using: :btree
  add_index "geeks", ["reset_password_token"], name: "index_geeks_on_reset_password_token", unique: true, using: :btree

  create_table "genes", force: :cascade do |t|
    t.string   "species",    limit: 255
    t.string   "number",     limit: 255
    t.string   "gene_name",  limit: 255
    t.string   "size",       limit: 255
    t.text     "sequence",   limit: 65535
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "ligations", force: :cascade do |t|
    t.integer  "ligatable_id",   limit: 4
    t.string   "ligatable_type", limit: 255
    t.float    "insert_volume",  limit: 24
    t.string   "vector",         limit: 255
    t.float    "vector_volume",  limit: 24
    t.string   "ligase",         limit: 255
    t.string   "temperature",    limit: 255
    t.string   "during_time",    limit: 255
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "managers", force: :cascade do |t|
    t.string   "email",              limit: 255, default: "", null: false
    t.string   "encrypted_password", limit: 255, default: "", null: false
    t.integer  "sign_in_count",      limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip", limit: 255
    t.string   "last_sign_in_ip",    limit: 255
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
  end

  add_index "managers", ["email"], name: "index_managers_on_email", unique: true, using: :btree

  create_table "pcr_conditions", force: :cascade do |t|
    t.integer  "usable_id",    limit: 4
    t.string   "usable_type",  limit: 255
    t.string   "machine",      limit: 255
    t.integer  "break",        limit: 4
    t.integer  "break_t",      limit: 4
    t.integer  "denature",     limit: 4
    t.integer  "denature_t",   limit: 4
    t.integer  "annealing",    limit: 4
    t.integer  "annealing_t",  limit: 4
    t.integer  "elongation",   limit: 4
    t.integer  "elongation_t", limit: 4
    t.integer  "polya",        limit: 4
    t.integer  "polya_t",      limit: 4
    t.integer  "cycles",       limit: 4
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "pcr_primers", force: :cascade do |t|
    t.integer "pcr_id",    limit: 4, null: false
    t.integer "primer_id", limit: 4, null: false
  end

  create_table "pcrs", force: :cascade do |t|
    t.integer  "gene_id",          limit: 4,   null: false
    t.integer  "forprimer_id",     limit: 4,   null: false
    t.integer  "revprimer_id",     limit: 4,   null: false
    t.string   "fragment_name",    limit: 255
    t.string   "product_size",     limit: 255
    t.string   "final_vector",     limit: 255
    t.string   "enzyme",           limit: 255
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.string   "gel_file_name",    limit: 255
    t.string   "gel_content_type", limit: 255
    t.integer  "gel_file_size",    limit: 4
    t.datetime "gel_updated_at"
  end

  add_index "pcrs", ["gene_id"], name: "index_pcrs_on_gene_id", using: :btree

  create_table "posts", force: :cascade do |t|
    t.integer "geek_id", limit: 4
    t.text    "content", limit: 65535
  end

  create_table "primers", force: :cascade do |t|
    t.integer  "gene_id",       limit: 4,   null: false
    t.string   "type",          limit: 255
    t.string   "primer_label",  limit: 255
    t.float    "tm",            limit: 24
    t.string   "restrict_site", limit: 255
    t.string   "sequence",      limit: 255
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "transformations", force: :cascade do |t|
    t.integer  "ligation_id",     limit: 4
    t.string   "bacteria",        limit: 255
    t.time     "chill_time"
    t.time     "heat_shock_time"
    t.time     "recovery_time"
    t.integer  "plating_volume",  limit: 4
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

end
