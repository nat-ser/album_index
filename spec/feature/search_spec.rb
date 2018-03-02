# frozen_string_literal: true

require "rails_helper"

describe "Successful Search by one parameter", type: :feature do
  describe "filters songs", js: true do
    before do
      visit root_path
    end

    it "by title" do
      fill_in "Song", with: "Bye Bye"
      click_button "Search"
      expect(page).to have_content("NSYNC")
    end

    it "by artist" do
      fill_in "Artist", with: "Childish Gambino"
      click_button "Search"
      expect(page).to have_content("Kauai")
    end

    it "by album" do
      fill_in "Album", with: "American V:"
      click_button "Search"
      expect(page).to have_content("Johnny Cash")
    end
  end
end

describe "Successful Search by multiple parameters", js: true, type: :feature do
  before do
    visit root_path
  end

  it "filters by title and artist" do
    fill_in "Song", with: "Breezeblocks"
    fill_in "Artist", with: "alt-J"
    click_button "Search"
    expect(page).to have_content("An Awesome Wave")
  end

  it "filters by artist and album" do
    fill_in "Artist", with: "Damien Rice"
    fill_in "Album", with: "O"

    click_button "Search"
    expect(page).to have_content("Delicate")
  end

  it "filters by title, artist, and album" do
    fill_in "Artist", with: "Cole"
    fill_in "Album", with: "Cole Wor"
    fill_in "Song", with: "work"

    click_button "Search"
    expect(page).to have_content("J. Cole")
  end
end

describe "Unsuccessful Search", type: :feature do
  it "produces error if no results", js: true do
    visit root_path
    fill_in "Artist", with: "????????"
    click_button "Search"
    expect(page).to have_content("No results!")
  end
end
