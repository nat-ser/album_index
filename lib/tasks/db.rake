# frozen_string_literal: true

# Spotify API requires authentication
# Line 13 required to run

namespace :db do
  desc "populate db via the Spotify API"
  task import_from_spotify: :environment do
    # Uncomment and fill in this line
    # RSpotify::authenticate("<your_client_id>", "<your_client_secret>")
    songs = ("a".."z").map do |search_term|
      RSpotify::Track.search(search_term, limit: 50)
    end.flatten

    songs.each do |song|
      next unless song&.name && song.album && song.artists
      Song.find_or_create_by!(
        title: song.name,
        album_title: song.album.name,
        artist_name: song.artists.first.name
      )
    end
  end
end
