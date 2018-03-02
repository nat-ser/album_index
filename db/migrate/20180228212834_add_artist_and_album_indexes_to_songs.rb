class AddArtistAndAlbumIndexesToSongs < ActiveRecord::Migration[5.1]
  def change
    add_index :songs, :album_title
    add_index :songs, :artist_name
  end
end
