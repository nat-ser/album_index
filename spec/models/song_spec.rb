# frozen_string_literal: true

require "rails_helper"

describe "valid Song", type: :model do
  let(:song) do
    Song.create(
      title: "Night Ride",
      artist_name: "The Growlers",
      album_title: "City Club"
    )
  end

  it "is valid with valid attributes" do
    expect(song.valid?).to eq(true)
  end
end

describe "invalid Song", type: :model do
  let(:song_without_title) do
    Song.create(
      artist_name: "The Growlers",
      album_title: "City Club"
    )
  end

  let(:song_without_artist) do
    Song.create(
      title: "Night Ride",
      album_title: "City Club"
    )
  end

  let(:song_without_album) do
    Song.create(
      title: "Night Ride",
      artist_name: "The Growlers"
    )
  end

  it "is not valid without requires attributes" do
    expect(song_without_title.valid?).to eq(false)
    expect(song_without_album.valid?).to eq(false)
    expect(song_without_artist.valid?).to eq(false)
  end
end
