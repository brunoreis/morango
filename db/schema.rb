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

ActiveRecord::Schema[7.1].define(version: 2025_07_01_120000) do
  create_table "brands", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "fertilizers", force: :cascade do |t|
    t.string "name"
    t.integer "brand_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "solubility"
    t.index ["brand_id"], name: "index_fertilizers_on_brand_id"
  end

  create_table "nutrients", force: :cascade do |t|
    t.string "name"
    t.string "chemical_symbol"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "macronutrient"
  end

  create_table "nutritional_contents", force: :cascade do |t|
    t.float "percentage", null: false
    t.integer "fertilizer_id", null: false
    t.integer "nutrient_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["fertilizer_id"], name: "index_nutritional_contents_on_fertilizer_id"
    t.index ["nutrient_id"], name: "index_nutritional_contents_on_nutrient_id"
  end

  create_table "recipe_items", force: :cascade do |t|
    t.float "quantity"
    t.integer "recipe_id", null: false
    t.integer "fertilizer_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["fertilizer_id"], name: "index_recipe_items_on_fertilizer_id"
    t.index ["recipe_id"], name: "index_recipe_items_on_recipe_id"
  end

  create_table "recipes", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "fertilizers", "brands"
  add_foreign_key "nutritional_contents", "fertilizers"
  add_foreign_key "nutritional_contents", "nutrients"
  add_foreign_key "recipe_items", "fertilizers"
  add_foreign_key "recipe_items", "recipes"
end
