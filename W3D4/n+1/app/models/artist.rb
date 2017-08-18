class Artist < ApplicationRecord
  has_many :albums,
    class_name: 'Album',
    foreign_key: :artist_id,
    primary_key: :id

  def n_plus_one_tracks
    albums = self.albums
    tracks_count = {}
    albums.each do |album|
      tracks_count[album.title] = album.tracks.length
    end

    tracks_count
  end

  def better_tracks_query
    albums = self
      .albums
      # everything added will be a QUERY, which brings data all at once as a table
      # rather than
      .select('albums.*, COUNT(*) AS tracks_count')
      .joins(:tracks)
      .group('album_id')

      tracks_count = {}
      albums.each do |album|
        tracks_count[album.title] = album.tracks_count
      end
    tracks_counts
  end
end
