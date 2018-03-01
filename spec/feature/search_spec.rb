# frozen_string_literal: true

require "rails_helper"

describe "Search", type: :feature do
  describe "searches songs" , js: true do
    it "by title" do
      visit root_path
      fill_in , with:
      click_button "Search"
      expect(page).to have_content()
    end

    it "by artist" do

    end

    it "by album" do

    end

    it "by title and artist" do

    end

    it "by title and album" do

    end

    it "by artist and album" do

    end

    it "by title, artist, and album" do

    end
  end
end
