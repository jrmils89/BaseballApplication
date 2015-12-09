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

ActiveRecord::Schema.define(version: 20141207165931) do

  create_table "UMPIRETMP2", force: :cascade do |t|
    t.string "throws", limit: 1
    t.string "stand",  limit: 1,  null: false
    t.string "ball",   limit: 1,  null: false
    t.string "strike", limit: 1,  null: false
    t.float  "px",     limit: 24
    t.float  "pz",     limit: 24
    t.float  "sz_top", limit: 24
    t.float  "sz_bot", limit: 24
    t.string "type",   limit: 1,  null: false
    t.string "des",    limit: 25, null: false
    t.date   "date",              null: false
  end

  create_table "at_bats", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "atbats", primary_key: "ab_id", force: :cascade do |t|
    t.integer "game_id",  limit: 2,   null: false
    t.string  "inning",   limit: 2,   null: false
    t.integer "num",      limit: 1,   null: false
    t.string  "ball",     limit: 1,   null: false
    t.string  "strike",   limit: 1,   null: false
    t.string  "outs",     limit: 1,   null: false
    t.integer "batter",   limit: 3,   null: false
    t.integer "pitcher",  limit: 3,   null: false
    t.string  "stand",    limit: 1,   null: false
    t.string  "des",      limit: 400, null: false
    t.string  "event",    limit: 50,  null: false
    t.float   "hit_x",    limit: 24
    t.float   "hit_y",    limit: 24
    t.string  "hit_type", limit: 1
  end

  add_index "atbats", ["game_id"], name: "game_id", using: :btree

  create_table "averages", id: false, force: :cascade do |t|
    t.string  "type",  limit: 10,                         default: "",  null: false
    t.string  "phand", limit: 50,                                       null: false
    t.integer "scale", limit: 4,                          default: 0,   null: false
    t.float   "avg",   limit: 24
    t.decimal "x1",               precision: 5, scale: 1, default: 0.0, null: false
    t.decimal "x2",               precision: 5, scale: 1, default: 0.0, null: false
    t.decimal "y1",               precision: 5, scale: 1, default: 0.0, null: false
    t.decimal "y2",               precision: 5, scale: 1, default: 0.0, null: false
  end

  create_table "delete_4Bill", id: false, force: :cascade do |t|
    t.integer "pitchid", limit: 4
  end

  create_table "event_list", id: false, force: :cascade do |t|
    t.integer "pitch_id",              limit: 3,   default: 0
    t.string  "pitch_des",             limit: 50
    t.string  "pitch_type",            limit: 1
    t.string  "event_des",             limit: 50
    t.integer "pitch_id_two",          limit: 2
    t.float   "x",                     limit: 24
    t.float   "y",                     limit: 24
    t.float   "start_speed",           limit: 24
    t.float   "end_speed",             limit: 24
    t.float   "sz_top",                limit: 24
    t.float   "sz_bot",                limit: 24
    t.float   "pfx_x",                 limit: 24
    t.float   "pfx_z",                 limit: 24
    t.float   "px",                    limit: 24
    t.float   "pz",                    limit: 24
    t.float   "x0",                    limit: 24
    t.float   "y0",                    limit: 24
    t.float   "z0",                    limit: 24
    t.float   "vx0",                   limit: 24
    t.float   "vy0",                   limit: 24
    t.float   "vz0",                   limit: 24
    t.float   "ax",                    limit: 24
    t.float   "ay",                    limit: 24
    t.float   "az",                    limit: 24
    t.float   "break_y",               limit: 24
    t.float   "break_angle",           limit: 24
    t.float   "break_length",          limit: 24
    t.string  "ball",                  limit: 4
    t.string  "strike",                limit: 4
    t.integer "on_1b",                 limit: 3
    t.integer "on_2b",                 limit: 3
    t.integer "on_3b",                 limit: 3
    t.string  "sv_id",                 limit: 13
    t.string  "pitch_type_str",        limit: 3
    t.float   "type_confidence",       limit: 53
    t.integer "game_id",               limit: 2,   default: 0, null: false
    t.date    "game_date",                                     null: false
    t.integer "game_year",             limit: 4
    t.integer "game_month",            limit: 4
    t.integer "game_day",              limit: 4
    t.string  "home_team",             limit: 7,               null: false
    t.string  "away_team",             limit: 7,               null: false
    t.integer "game_num",              limit: 1,               null: false
    t.integer "umpire",                limit: 2
    t.integer "wind",                  limit: 1
    t.string  "wind_dir",              limit: 20
    t.integer "temp",                  limit: 1
    t.integer "game_type",             limit: 1,   default: 1, null: false
    t.integer "runs_home",             limit: 1
    t.integer "runs_away",             limit: 1
    t.time    "local_time"
    t.integer "away_starting_pitcher", limit: 3
    t.integer "home_starting_pitcher", limit: 3
    t.integer "ab_id",                 limit: 3,   default: 0
    t.string  "ab_inning",             limit: 2
    t.integer "ab_num",                limit: 1
    t.string  "ab_ball",               limit: 1
    t.string  "ab_strike",             limit: 1
    t.string  "ab_outs",               limit: 1
    t.integer "batter",                limit: 3
    t.integer "pitcher",               limit: 3
    t.string  "stand",                 limit: 1
    t.string  "ab_des",                limit: 400
    t.string  "ab_event",              limit: 50
    t.float   "hit_x",                 limit: 24
    t.float   "hit_y",                 limit: 24
    t.string  "hit_type",              limit: 1
    t.string  "home_team_city",        limit: 50
    t.string  "home_team_name",        limit: 50
    t.string  "away_team_city",        limit: 50
    t.string  "away_team_name",        limit: 50
    t.string  "batter_first",          limit: 20
    t.string  "batter_last",           limit: 20
    t.string  "batter_name",           limit: 41
    t.string  "batter_throws",         limit: 1
    t.integer "batter_height",         limit: 1
    t.string  "pitcher_first",         limit: 20
    t.string  "pitcher_last",          limit: 20
    t.string  "pitcher_name",          limit: 41
    t.string  "pitcher_throws",        limit: 1
    t.integer "pitcher_height",        limit: 1
  end

  create_table "game_types", force: :cascade do |t|
    t.string "type", limit: 20, null: false
  end

  create_table "games", primary_key: "game_id", force: :cascade do |t|
    t.date    "date",                                         null: false
    t.string  "home",                  limit: 7,              null: false
    t.string  "away",                  limit: 7,              null: false
    t.integer "game",                  limit: 1,              null: false
    t.integer "umpire",                limit: 2
    t.integer "wind",                  limit: 1
    t.string  "wind_dir",              limit: 20
    t.integer "temp",                  limit: 1
    t.integer "type",                  limit: 1,  default: 1, null: false
    t.integer "runs_home",             limit: 1
    t.integer "runs_away",             limit: 1
    t.time    "local_time"
    t.integer "away_starting_pitcher", limit: 3
    t.integer "home_starting_pitcher", limit: 3
  end

  add_index "games", ["date"], name: "date", using: :btree

  create_table "height", primary_key: "eliasid", force: :cascade do |t|
    t.integer "height2", limit: 2
  end

  create_table "last_pa_pitch", id: false, force: :cascade do |t|
    t.integer "last_pitch_id", limit: 2
    t.integer "game_id",       limit: 2, default: 0, null: false
    t.integer "ab_id",         limit: 3, default: 0
  end

  create_table "pitch_types", force: :cascade do |t|
    t.string "pitch", limit: 25, null: false
  end

  create_table "pitches", primary_key: "pitch_id", force: :cascade do |t|
    t.integer "ab_id",           limit: 3,  null: false
    t.string  "des",             limit: 50, null: false
    t.string  "type",            limit: 1,  null: false
    t.integer "id",              limit: 2,  null: false
    t.float   "x",               limit: 24, null: false
    t.float   "y",               limit: 24, null: false
    t.float   "start_speed",     limit: 24
    t.float   "end_speed",       limit: 24
    t.float   "sz_top",          limit: 24
    t.float   "sz_bot",          limit: 24
    t.float   "pfx_x",           limit: 24
    t.float   "pfx_z",           limit: 24
    t.float   "px",              limit: 24
    t.float   "pz",              limit: 24
    t.float   "x0",              limit: 24
    t.float   "y0",              limit: 24
    t.float   "z0",              limit: 24
    t.float   "vx0",             limit: 24
    t.float   "vy0",             limit: 24
    t.float   "vz0",             limit: 24
    t.float   "ax",              limit: 24
    t.float   "ay",              limit: 24
    t.float   "az",              limit: 24
    t.float   "break_y",         limit: 24
    t.float   "break_angle",     limit: 24
    t.float   "break_length",    limit: 24
    t.string  "ball",            limit: 4
    t.string  "strike",          limit: 4
    t.integer "on_1b",           limit: 3
    t.integer "on_2b",           limit: 3
    t.integer "on_3b",           limit: 3
    t.string  "sv_id",           limit: 13
    t.string  "pitch_type",      limit: 3
    t.float   "type_confidence", limit: 53
    t.integer "my_pitch_type",   limit: 1
  end

  add_index "pitches", ["ab_id"], name: "ab_id", using: :btree

  create_table "player_names", id: false, force: :cascade do |t|
    t.string  "names",   limit: 41
    t.integer "eliasid", limit: 3,  null: false
  end

  create_table "players", primary_key: "eliasid", force: :cascade do |t|
    t.string  "first",    limit: 20, null: false
    t.string  "last",     limit: 20, null: false
    t.string  "lahmanid", limit: 10
    t.string  "throws",   limit: 1
    t.integer "height",   limit: 1
  end

  add_index "players", ["first", "last"], name: "first_last", using: :btree
  add_index "players", ["throws"], name: "throws", using: :btree

  create_table "players_copy", primary_key: "eliasid", force: :cascade do |t|
    t.string  "first",    limit: 20, null: false
    t.string  "last",     limit: 20, null: false
    t.string  "lahmanid", limit: 10
    t.string  "throws",   limit: 1
    t.integer "height",   limit: 1
  end

  add_index "players_copy", ["first", "last"], name: "first_last", using: :btree
  add_index "players_copy", ["throws"], name: "throws", using: :btree

  create_table "teams", primary_key: "team", force: :cascade do |t|
    t.string "city", limit: 50
    t.string "name", limit: 50
  end

  create_table "umpires", primary_key: "ump_id", force: :cascade do |t|
    t.string "first", limit: 20, null: false
    t.string "last",  limit: 20, null: false
  end

  add_index "umpires", ["first", "last"], name: "first", unique: true, using: :btree

end
