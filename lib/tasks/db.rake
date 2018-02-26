# Spotify API requires authentication, as a workaround for having to check private keys into source control/ send the keys over email, I use the rake task to populate db locally
# Then I use the gem 'seed_dump' to create seedfile from my local db
# Below is where I inserted the keys

namespace :db do
  desc "populate db via the Spotify API"
  task import_from_spotify: :environment do
    # Needed to run this rake task
    # RSpotify::authenticate("<your_client_id>", "<your_client_secret>")
    songs = ("a".."z").map do |search_term|
      RSpotify::Track.search(search_term, limit:50)
    end.flatten

    songs.each do |song|
      next unless song && song.name && song.album && song.artists
      Song.find_or_create_by!(
        title: song.name,
        album_title: song.album.name,
        artist_name: song.artists.first.name
      )
    end
  end
end
