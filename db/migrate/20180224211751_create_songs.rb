# frozen_string_literal: true

class CreateSongs < ActiveRecord::Migration[5.1]
  def change
    create_table :songs do |t|
      t.string :title
      t.string :album_title
      t.string :artist_name

      t.timestamps
    end
  end
end
