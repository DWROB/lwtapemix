class PlaylistsController < ApplicationController
  before_action :set_playlist, only: %i[ show edit update destroy ]

  def index
    @playlists = get_user_playlists("rthillman1997")
  end

  def show
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
    user = RSpotify::User.find(user_spotify_id)
    user_playlists = user.playlists
    tapeplaylist = []
    user_playlists.each do |playlist|
      tapeplaylist << Playlist.new(
        name: playlist.name,
        spotify_playlist_id: playlist.id,
        playlist_images: playlist.images[0]["url"]
      )
      policy_scope(tapeplaylist.last)
      tapeplaylist.last.save
    end
    return tapeplaylist
  end

end
