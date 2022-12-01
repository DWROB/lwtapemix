class VotesController < ApplicationController
  def upvote
    @playlist = Playlist.find(params[:playlist_id])
    @song = Song.find(params[:song_id])
    @song_votes = Vote.find_by(playlist: @playlist, song: @song)

    if @song_votes.nil?
      @song_votes = Vote.new(playlist: @playlist, song: @song, vote: 1)
    else
      @song_votes.votes += 1
    end

    if @song_votes.save
      redirect_to playlist_path(@playlist)
    else
      render "playlists/show"
    end
  end

  def downvote
    @playlist = Playlist.find(params[:playlist_id])
    @song = Song.find(params[:song_id])
    @song_votes = Vote.find_by(playlist: @playlist, song: @song)

    if @song_votes.nil?
      @song_votes = Vote.new(playlist: @playlist, song: @song, vote: -1)
    else
      @song_votes.votes -= 1
    end

    if @song_votes.save
      redirect_to playlist_path(@playlist)
    else
      render "playlists/show"
    end
  end
end
