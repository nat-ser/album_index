# frozen_string_literal: true

class Song < ApplicationRecord
 validates :title,
  :album_title,
  :artist_name,
  presence: true
end
