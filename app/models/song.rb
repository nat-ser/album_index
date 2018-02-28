# frozen_string_literal: true

# == Schema Info
#
# Table name: songs
#
#  id                  :integer   not null, primary key
#  title               :string    not null
#  artist_name         :string    not null
#  album_title         :string    not null
#
class Song < ApplicationRecord
  validates :title,
            :album_title,
            :artist_name,
            presence: true
end
