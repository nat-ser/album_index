require "spec_helper"

describe "SongSearch" do
  it "stops execution if the params are empty" do
    SongSearch.run({})
  end
end