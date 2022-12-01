class PlaylistsController < ApplicationController
  before_action :set_playlist, only: %i[ show edit update destroy ]

  def index
    if params[:error]
      puts "LOGIN ERROR", params
    elsif params[:code]
      auth_code = ENV['CLIENT_ID'] + ":" + ENV['CLIENT_SECRET']
      form = {
        grant_type: "authorization_code",
        code: params[:code],
        redirect_uri: "http://localhost:3000/playlists/",
        # client_id: ENV['CLIENT_ID'],
        # client_secret: ENV['CLIENT_SECRET']
      }
      headers = {
        Authorization: 'Basic ' + Base64.strict_encode64(auth_code),
        "Content-Type": 'application/x-www-form-urlencoded'
      }
      auth_response = RestClient.post('https://accounts.spotify.com/api/token', form, headers)
      auth_params = JSON.parse(auth_response.body)

      header = {
        Authorization: "Bearer #{auth_params["access_token"]}"
      }
      user_response = RestClient.get("https://api.spotify.com/v1/me", header)

      user_params = JSON.parse(user_response.body)

      @user = User.update(
        spotify_name: user_params["id"],
        spotify_access_token:auth_params["access_token"],
        refresh_token: auth_params["refresh_token"]
      )
      # get user playlists
      redirect_to "http://localhost:3000/playlists/"
    else
      # get_user_playlists("rthillman1997")
      # @playlists = policy_scope(Playlist.where(user: current_user))
      @playlists = policy_scope(Playlist.all)
      @user = User.find(current_user.id)
      query_params = {
        client_id: ENV['CLIENT_ID'],
        response_type: "code",
        redirect_uri: "http://localhost:3000/playlists/",
        scope: "user-library-read ugc-image-upload playlist-read-private playlist-modify-private playlist-modify-public",
        show_dialog: true
      }
      @authorize_spotify_link = "https://accounts.spotify.com/authorize?#{query_params.to_query}"
    end
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
    # https://developer.spotify.com/documentation/web-api/reference/#/operations/get-a-list-of-current-users-playlists
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
