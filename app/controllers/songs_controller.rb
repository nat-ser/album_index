# frozen_string_literal: true

class SongsController < ApplicationController
  def index
    @songs = Song.order(artist_name: :asc).page params[:page]
  end

  def search
    @songs = SongSearch.run(song_params) if song_params.present?
    respond_to :json
    if @songs
      render json: { songs: @songs }
    else
      render json: { error: empty_params_alert}
    end
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
