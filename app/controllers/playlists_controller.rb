class PlaylistsController < ApplicationController
  before_action :set_playlist, only: %i[ show edit update destroy ]

  def index
    # get_user_playlists("rthillman1997")
    # @playlists = policy_scope(Playlist.where(user: current_user))
    @playlists = policy_scope(Playlist.all)
  end

  def show
    @playlist = Playlist.find(params[:id])
    @songs_query = Song.where("playlist_id = #{@playlist.id}")   
    authorize @playlist
  end

  def new
    @playlist = Playlist.new
    authorize @playlist
  end

  def create
    authorize @playlist

    @playlist = Playlist.new(playlist_params)
    @playlist.user = current_user

    authorize @playlist

    if @playlist.save
      redirect_to @playlist, notice: "Your Playlist was successfully created"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    authorize @playlist
  end

  def update
    authorize @playlist
  end

  def destroy
  end

  private

  def set_playlist
    @playlist = Playlist.find(params[:id])
  end

  def playlist_params
    params.require(:playlist).permit(:name)
  end

  def get_user_playlists(user_spotify_id)
    # find user on spotify
    user = RSpotify::User.find(user_spotify_id)
    user_playlists = user.playlists

    user_playlists.each do |playlist|
      store_songs(playlist.tracks, playlist.id)
      tapeplaylist = Playlist.new(
        name: playlist.name,
        spotify_playlist_id: playlist.id,
        playlist_images: playlist.images[0]["url"]
      )
      tapeplaylist.save
    end
  end

  def store_songs(tracks_array, playlist_id)
    tracks_array.each do |track|
      new_track = Song.new(
        playlist_id: playlist_id,
        name: track.name,
        artist: track.artists[0].name,
        image: track.album.images[0]["url"],
        spotify_id: track.id
      )
      new_track.save
    end
  end
end
