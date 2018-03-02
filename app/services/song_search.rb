# frozen_string_literal: true

# Service responsible for conducting the song search by parameters
class SongSearch
  def self.run(params)
    return unless params.present?
    songs = Song.all
    params.each do |key, param|
      songs = filter_by_param(songs, key, param)
    end
    songs
  end

  private_class_method

  def self.filter_by_param(songs, key, param)
    songs.where(
      "#{key} like ?", "%#{param}%"
    )
  end
end
