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

ActiveRecord::Schema.define(version: 2019_06_14_150056) do

  create_table "comments", force: :cascade do |t|
    t.string "text"
    t.integer "shout_id"
    t.integer "comments_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["comments_id"], name: "index_comments_on_comments_id"
    t.index ["shout_id"], name: "index_comments_on_shout_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "likes", force: :cascade do |t|
    t.integer "shout_id"
    t.integer "user_id"
    t.string "likeobject_type"
    t.integer "likeobject_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["likeobject_type", "likeobject_id"], name: "index_likes_on_likeobject_type_and_likeobject_id"
    t.index ["shout_id"], name: "index_likes_on_shout_id"
    t.index ["user_id"], name: "index_likes_on_user_id"
  end

  create_table "shouts", force: :cascade do |t|
    t.string "text"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_shouts_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.date "date_of_birth"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
