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

ActiveRecord::Schema.define(version: 2021_05_31_053735) do

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

  create_table "entertainers", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "images", force: :cascade do |t|
    t.string "path"
    t.string "title"
    t.integer "tags_id", default: [], null: false, array: true
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "entertainer_id"
    t.index ["entertainer_id"], name: "index_images_on_entertainer_id"
  end

  create_table "pokemon_stats", force: :cascade do |t|
    t.integer "hp", null: false
    t.integer "attack", null: false
    t.integer "defence", null: false
    t.integer "sp_attack", null: false
    t.integer "sp_defence", null: false
    t.integer "speed", null: false
    t.bigint "pokemon_id"
    t.index ["pokemon_id"], name: "index_pokemon_stats_on_pokemon_id"
  end

  create_table "pokemons", force: :cascade do |t|
    t.integer "no", null: false, comment: "図鑑No"
    t.string "name", null: false, comment: "名前"
    t.string "form", comment: "フォーム"
    t.boolean "is_mega_evolution", comment: "メガ進化可否"
    t.integer "evolutions", comment: "進化先図鑑No", array: true
    t.string "types", comment: "タイプ", array: true
    t.string "abilities", comment: "特性", array: true
    t.string "hidden_abilities", comment: "夢特性隠れ特性", array: true
  end

  create_table "tags", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "images", "entertainers"
end
