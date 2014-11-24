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

ActiveRecord::Schema.define(version: 20141121145351) do

  create_table "answers", force: true do |t|
    t.boolean  "answer"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "question_id"
    t.integer  "questionnaire_id"
  end

  add_index "answers", ["question_id"], name: "index_answers_on_question_id", using: :btree
  add_index "answers", ["questionnaire_id"], name: "index_answers_on_questionnaire_id", using: :btree

  create_table "practices", force: true do |t|
    t.string   "practice_name"
    t.text     "practice_description"
    t.integer  "equivalent_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "question_id"
    t.integer  "route_id"
  end

  add_index "practices", ["question_id"], name: "index_practices_on_question_id", using: :btree
  add_index "practices", ["route_id"], name: "index_practices_on_route_id", using: :btree

  create_table "practices_questionnaires", id: false, force: true do |t|
    t.integer "questionnaire_id", null: false
    t.integer "practice_id",      null: false
  end

  create_table "question_relations", force: true do |t|
    t.string   "question_relation"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "questionnaires", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "route_id"
  end

  add_index "questionnaires", ["route_id"], name: "index_questionnaires_on_route_id", using: :btree

  create_table "questionnaires_questions", id: false, force: true do |t|
    t.integer "questionnaire_id", null: false
    t.integer "question_id",      null: false
    t.boolean "answer"
  end

  create_table "questions", force: true do |t|
    t.string   "question_text"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "route_id"
    t.integer  "question_relation_id"
  end

  add_index "questions", ["question_relation_id"], name: "index_questions_on_question_relation_id", using: :btree
  add_index "questions", ["route_id"], name: "index_questions_on_route_id", using: :btree

  create_table "routes", force: true do |t|
    t.string   "route"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
