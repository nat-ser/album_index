# frozen_string_literal: true

require "rails_helper"

RSpec.describe Song, type: :model do
  let(:song) do
    Song.create(
      title: "Night Ride",
      artist_name: "The Growlers",
      album_title: "City Club"
    )
  end

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
      artist_name: "The Growlers",
    )
  end
  it "is valid with valid attributes" do
    expect(song.valid?).to eq(true)
  end

  it "is not valid without a title" do
    binding.pry
    expect(song_without_title.valid?).to eq(false)
  end

  it "is not valid without an album_title" do
    expect(song_without_album.valid?).to eq(false)

  end

  it "is not valid without a artist_name" do
    expect(song_without_artist.valid?).to eq(false)
  end
end
