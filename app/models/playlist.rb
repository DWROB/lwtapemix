class Playlist < ApplicationRecord
  belongs_to :user
  has_many :songs, dependent: :destroy
  has_many :votes, dependent: :destroy
end
