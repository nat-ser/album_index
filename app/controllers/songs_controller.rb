# frozen_string_literal: true

class SongsController < ApplicationController
  def index
    @songs = Song.order(artist_name: :asc).page params[:page]
  end

  def search
    song_params = params["song"].reject{ |_, v| v.blank? }
    SongSearch.run(song_params)
  end
end
