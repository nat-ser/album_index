# frozen_string_literal: true

class SongsController < ApplicationController
  def index
    @songs = Song.order(artist_name: :asc).page params[:page]
  end

  def search
    unless song_params.present?
      redirect_to(songs_url, alert: empty_params_alert) && return
    end
    SongSearch.run(song_params)
  end

  private

  def song_params
    params.require(:song)
          .permit(:title, :artist_name, :album_title)
          .reject { |_, v| v.blank? }
  end

  def empty_params_alert
    "Please search by at least one param"
  end
end
