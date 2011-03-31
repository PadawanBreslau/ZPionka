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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110331002838) do

  create_table "allowances", :force => true do |t|
    t.integer  "user_id"
    t.integer  "allowance_level"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "user_login"
  end

  create_table "comments", :force => true do |t|
    t.integer  "user_id"
    t.integer  "info_id"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "data_files", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "gamechats", :force => true do |t|
    t.integer  "user_id"
    t.integer  "game_id"
    t.string   "comment"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "games", :force => true do |t|
    t.integer  "round_id"
    t.integer  "player1_id"
    t.integer  "player2_id"
    t.string   "result"
    t.date     "round_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "infos", :force => true do |t|
    t.integer  "user_id"
    t.string   "title"
    t.string   "lead"
    t.text     "short_content"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "messages", :force => true do |t|
    t.integer  "user1_id"
    t.integer  "user2_id"
    t.string   "title"
    t.text     "message"
    t.boolean  "was_read"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "newsletters", :force => true do |t|
    t.integer  "user_id"
    t.string   "title"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "observedrounds", :force => true do |t|
    t.integer  "user_id"
    t.integer  "tournament_id"
    t.integer  "round_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "observedtournaments", :force => true do |t|
    t.integer  "tournament_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "observes", :force => true do |t|
    t.integer  "user_id"
    t.integer  "game_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "players", :force => true do |t|
    t.string   "name"
    t.string   "surname"
    t.integer  "rating"
    t.string   "country"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "positions", :force => true do |t|
    t.integer  "game_id"
    t.string   "var1"
    t.string   "var2"
    t.string   "var3"
    t.string   "move"
    t.float    "move_eval"
    t.integer  "move_number"
    t.boolean  "white_on_move"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rounds", :force => true do |t|
    t.integer  "tournament_id"
    t.integer  "round_number"
    t.date     "round_date"
    t.boolean  "isFinished"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tourchats", :force => true do |t|
    t.integer  "user_id"
    t.integer  "tournament_id"
    t.string   "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tournaments", :force => true do |t|
    t.string   "name"
    t.string   "place"
    t.date     "start_date"
    t.date     "finish_date"
    t.integer  "prizes"
    t.integer  "time_control"
    t.boolean  "isFinished",    :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "rounds_number", :default => 9
  end

  create_table "tourplaces", :force => true do |t|
    t.integer  "tournament_id"
    t.integer  "player_id"
    t.integer  "place"
    t.float    "points"
    t.float    "buch"
    t.float    "mbuch"
    t.float    "prog"
    t.integer  "rating_performance"
    t.float    "k_coeff"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "encrypted_password"
    t.string   "name"
    t.string   "surname"
    t.integer  "age"
    t.integer  "rating"
    t.text     "about"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "salt"
    t.string   "login"
    t.integer  "allowance",          :default => 1
    t.boolean  "newsletter",         :default => true
  end

  create_table "zpawns", :force => true do |t|
    t.integer  "tournament_id"
    t.string   "content"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

end
