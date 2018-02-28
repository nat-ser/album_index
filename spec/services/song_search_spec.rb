require "rails_helper"
require_relative "../../app/services/song_search.rb"

describe "SongSearch .run unsuccessful search" do
  let(:empty_params) { ActionController::Parameters.new({})}
  let(:no_result_params) { ActionController::Parameters.new({title: "sdsdsdsd"}) }

  it "does not run if params are empty" do
    expect(SongSearch.run(empty_params)).to eq(nil)
  end

  it "returns an empty array if none of the params return search result" do
    expect(SongSearch.run(no_result_params)).to eq([])
  end
end

describe "SongSearch .run successful search" do
  let(:title_params) do
    ActionController::Parameters.new(title: "no one")
  end

  let(:partial_title_params) do
    ActionController::Parameters.new(title: "ye")
  end

  let(:artist_params) do
   ActionController::Parameters.new(artist_name: "Coldplay")
  end

  let(:album_params) do
    ActionController::Parameters.new(album_title: "Art Angels")
  end

  let(:title_album_params) do
    ActionController::Parameters.new(
      title: "Tongue Tied",
      album_title: "Never Trust a Happy Song"
    )
  end

  let(:all_criteria_params) do
    ActionController::Parameters.new(
      title: "Particula",
      album_title: "know No Better",
      artist_name: "major lazer"
    )
  end

  let(:params_with_syms) do
   ActionController::Parameters.new(artist_name: "$")
  end

  it "returns results matching title param" do
    result = SongSearch.run(title_params)
    expect(result.first.title).to eq("No One")
  end

  it "returns all results matching partial title param" do
    result = SongSearch.run(partial_title_params)
    expect(result.count).to eq(15)

    titles = result.map(&:title)
    expect(titles.include?("Bodak Yellow")).to eq(true)
  end

  it "returns result matching artist param" do
    result = SongSearch.run(artist_params)
    expect(result.count).to eq(2)
    expect(result.first.artist_name).to eq("Coldplay")
  end

  it "returns results matching album param" do
    result = SongSearch.run(album_params)
    albums = result.map(&:album_title)
    expect(albums.all? {|title| title == "Art Angels"}).to eq(true)
  end

  it "returns results matching tilte and album params" do
    result = SongSearch.run(title_album_params)
    expect(result.first.title) == "Tongue Tied"
  end

  it "returns results matching all params" do
    result = SongSearch.run(all_criteria_params)
    expect(result.first.title).to eq("Particula")
  end

  it "return result matching a param with symbols" do
    result = SongSearch.run(params_with_syms)
    expect(result.first.artist_name.match?("$")).to eq(true)
  end
end
