# frozen_string_literal: true

class SongsController < ApplicationController
  def index
    @songs = Song.order(artist_name: :asc).page params[:page]
  end

  def search
    redirect_to(songs_url) && return unless song_params.present?
    @songs = SongSearch.run(song_params).page
    @error = no_results_alert if @songs == []
  end

  private

  def song_params
    params.require(:song)
          .permit(:title, :artist_name, :album_title)
          .reject { |_, v| v.blank? }
  end

  def no_results_alert
    "No results!"
  end
end
