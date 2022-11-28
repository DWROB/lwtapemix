class Song < ApplicationRecord
  belongs_to :playlists
  validates :playlist_id, presence: true
  validates :spotify_id, presence: true
end
