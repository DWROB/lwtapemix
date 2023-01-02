class VotesController < ApplicationController
  skip_after_action :verify_authorized, except: %i[upvote downvote]
  before_action :authenticate_user!, except: %i[upvote downvote done]

  def index
    @playlist = Playlist.find(params[:playlist_id])

    skip_policy_scope
    authorize @playlist
    @qr_code = RQRCode::QRCode.new("http://demo.tapemix.fun/playlists/#{@playlist.id}/welcome")
    @svg = @qr_code.as_svg(
      offset: 0,
      color: 'fff',
      shape_rendering: 'crispEdges',
      standalone: true,
      module_size: 6
    )
  end

  def votes_board
    @songs_votes = policy_scope(Song.joins(:votes).where("votes.votes > 0 and votes.playlist_id = ?", params[:playlist_id]))

    # @votes = policy_scope(Vote.where(playlist: params[:playlist_id]))

    results = []
    @songs_votes.each do |song|
    results << {
      id: song.id,
      name: song.name,
      artist: song.artist,
      image: song.image,
      votes: song.votes.first.votes
    }
    end
    render json: results
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
    skip_authorization
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
    skip_authorization
    @song_votes.save
  end

  def done
    skip_authorization
  end
end
