class Playlist < ApplicationRecord
  belongs_to :user
  has_many :songs
  validate :spotify_playlist_id, presence: true
end
