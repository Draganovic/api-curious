ActiveRecord::Schema.define(version: 20160525005337) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "users", force: :cascade do |t|
    t.string   "nickname"
    t.string   "email"
    t.string   "image"
    t.string   "token"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "uid"
    t.string   "provider"
    t.string   "name"
    t.integer  "following"
    t.integer  "followers"
  end

end
