class ClearDbJob < ApplicationJob
  queue_as :default

  def perform(playlist)
    # Do something later
    Vote.where(playlist_id: playlist.id).delete_all
    Song.where(playlist_id: playlist.id).delete_all
    Playlist.find(playlist.id).delete
  end
end
