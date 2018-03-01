# frozen_string_literal: true

ActiveRecord::Schema.define(version: 20180228212834) do

  create_table "songs", force: :cascade do |t|
    t.string "title", null: false
    t.string "album_title", null: false
    t.string "artist_name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["album_title"], name: "index_songs_on_album_title"
    t.index ["artist_name"], name: "index_songs_on_artist_name"
  end

end
