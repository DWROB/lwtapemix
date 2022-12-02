class Song < ApplicationRecord
  belongs_to :playlist
  has_many :votes
end
