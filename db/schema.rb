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

ActiveRecord::Schema.define(version: 20150831190923) do

  create_table "answers", force: :cascade do |t|
    t.string  "option"
    t.string  "value"
    t.integer "question_id"
    t.integer "survey_id"
  end

  add_index "answers", ["question_id"], name: "index_answers_on_question_id"
  add_index "answers", ["survey_id"], name: "index_answers_on_survey_id"

  create_table "question_answers", force: :cascade do |t|
    t.integer "questions_id"
    t.integer "answers_id"
  end

  create_table "questions", force: :cascade do |t|
    t.string   "question"
    t.string   "input_type"
    t.integer  "answers_id"
    t.integer  "survey_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "questions", ["survey_id"], name: "index_questions_on_survey_id"

  create_table "survey_questions", force: :cascade do |t|
    t.integer "surveys_id"
    t.integer "questions_id"
  end

  create_table "surveys", force: :cascade do |t|
    t.string   "name"
    t.integer  "questions_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

end
