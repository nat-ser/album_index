# frozen_string_literal: true
class SongSearch

  def self.run(params)
    return unless params.present?
    songs = Song.all
    params.each do |key, param|
      songs = filter_by_param(songs, key, param)
    end
    songs
  end

  private

  def self.filter_by_param(songs, key, param)
    songs.where(
      "#{key} like ?", "%#{param}%"
    )
  end
end