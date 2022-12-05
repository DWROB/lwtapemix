class VotesController < ApplicationController
  skip_after_action :verify_authorized

  def index
    # playlist_votes_path
    # /playlists/:playlist_id/votes (#index)
    @playlist = Playlist.find(params[:playlist_id])
    @votes = Vote.where("playlist_id = #{params[:playlist_id]}")
    @songs = Song.where("playlist_id = #{params[:playlist_id]}")
    authorize @songs
    skip_policy_scope
    authorize @playlist
    @qr_code = RQRCode::QRCode.new(playlist_url(@playlist))
    @svg = @qr_code.as_svg(
      offset: 0,
      color: 'fff',
      shape_rendering: 'crispEdges',
      standalone: true
    )
  end

  def upvote
    @playlist = Playlist.find(params[:playlist_id])
    @song = Song.find(params[:song_id])
    @song_votes = Vote.find_by(playlist: @playlist, song: @song)

    if @song_votes.nil?
      @song_votes = Vote.new(playlist: @playlist, song: @song, votes: 1)
    else
      @song_votes.votes += 1
    end

    @song_votes.save
  end


  def downvote
    @playlist = Playlist.find(params[:playlist_id])
    @song = Song.find(params[:song_id])
    @song_votes = Vote.find_by(playlist: @playlist, song: @song)

    if @song_votes.nil?
      @song_votes = Vote.new(playlist: @playlist, song: @song, votes: -1)
    else
      @song_votes.votes -= 1
    end

    @song_votes.save
  end
end
