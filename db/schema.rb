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

ActiveRecord::Schema[7.2].define(version: 2025_03_20_064836) do
  create_table "animal_habitats", force: :cascade do |t|
    t.integer "animal_id", null: false
    t.integer "habitat_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["animal_id"], name: "index_animal_habitats_on_animal_id"
    t.index ["habitat_id"], name: "index_animal_habitats_on_habitat_id"
  end

  create_table "animals", force: :cascade do |t|
    t.string "common_name"
    t.string "scientific_name"
    t.text "description"
    t.string "classification"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image_url"
  end

  create_table "habitats", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "location"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "latitude"
    t.float "longitude"
  end

  create_table "observations", force: :cascade do |t|
    t.string "observer_name"
    t.text "notes"
    t.datetime "observed_at"
    t.integer "animal_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["animal_id"], name: "index_observations_on_animal_id"
  end

  add_foreign_key "animal_habitats", "animals"
  add_foreign_key "animal_habitats", "habitats"
  add_foreign_key "observations", "animals"
end
