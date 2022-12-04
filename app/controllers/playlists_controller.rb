class PlaylistsController < ApplicationController
  before_action :set_playlist, only: %i[ show edit update destroy ]

  def index
    if params[:error]
      puts "LOGIN ERROR", params
    elsif params[:code]
      # delete the user's existing playlists to avoid doubling up
      Playlist.where("user_id = #{current_user.id}").delete_all
      # auth code received - combine client_id and client_secret ...
      # and encode to request token
      auth_code = ENV['CLIENT_ID'] + ":" + ENV['CLIENT_SECRET']
      form = {
        grant_type: "authorization_code",
        code: params[:code],
        redirect_uri: "http://localhost:3000/playlists/"
      }
      headers = {
        Authorization: 'Basic ' + Base64.strict_encode64(auth_code),
        "Content-Type": 'application/x-www-form-urlencoded'
      }

      # post to spotify with all headers and form to receive token
      auth_response = RestClient.post('https://accounts.spotify.com/api/token', form, headers)
      auth_params = JSON.parse(auth_response.body)

      # auth_params 200 then return the access token from auth_params

      header = {
        Authorization: "Bearer #{auth_params["access_token"]}"
      }
      user_response = RestClient.get("https://api.spotify.com/v1/me", header)
      user_params = JSON.parse(user_response.body)

      # user_params have access_token, user_spotify_id and the refresh_token.
      # update the user.
      @user = User.update(
        spotify_name: user_params["id"],
        spotify_access_token: auth_params["access_token"],
        refresh_token: auth_params["refresh_token"]
      )
      fetch_user_playlists

      @playlists = policy_scope(Playlist.all)
    else
      # get_user_playlists("rthillman1997")
      # @playlists = policy_scope(Playlist.where(user: current_user))
      @playlists = policy_scope(Playlist.where("user_id = #{current_user.id}"))
      @user = User.find(current_user.id)
      query_params = {
        client_id: ENV['CLIENT_ID'],
        response_type: "code",
        redirect_uri: "http://localhost:3000/playlists/",
        scope: "user-library-read ugc-image-upload playlist-read-private playlist-modify-private playlist-modify-public user-read-private user-top-read user-follow-read",
        show_dialog: true
      }
      @authorize_spotify_link = "https://accounts.spotify.com/authorize?#{query_params.to_query}"
    end
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
    skip_policy_scope
    @new_tape = Playlist.new(
      name: params["name"],
      user_id: current_user.id,
      owner: current_user.spotify_name,
      playlist_images: 'home_picture.png'
    )
    if @new_tape.save!
      @playlist_id_array = params["playlistIds"].split(",")
      merge_playlists
      skip_authorization
      redirect_to playlist_path(@new_tape)
    else
      render :index, status: :unprocessable_entity
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

  def fetch_user_playlists
    # https://developer.spotify.com/documentation/web-api/reference/#/operations/get-a-list-of-current-users-playlists
    # find user on spotify
    headers = {
      Authorization: "Bearer #{@user[0].spotify_access_token}",
      "Content-Type": "application/json"
    }

    playlist_response = RestClient.get("https://api.spotify.com/v1/me/playlists", headers)
    playlist_params = JSON.parse(playlist_response.body)
    @playlist_items = playlist_params["items"]
    create_playlists
  end

  def create_playlists
    @playlist_items.map do |item|
      unless item["images"].empty?
        @new_playlist = Playlist.create!(
          name: item["name"],
          spotify_playlist_id: item["id"],
          owner: item["owner"]["display_name"],
          playlist_images: item["images"][0]["url"],
          user_id: current_user.id
        )
        fetch_songs
      end
    end
  end

  def fetch_songs
    playlist_id = @new_playlist.spotify_playlist_id
    headers = {
      Authorization: "Bearer #{@user[0].spotify_access_token}",
      "Content-Type": "application/json"
    }
    songs_response = RestClient.get("https://api.spotify.com/v1/playlists/#{playlist_id}/tracks", headers)
    songs_params = JSON.parse(songs_response.body)
    @songs_details = songs_params["items"]
    store_songs
  end

  def store_songs
    @songs_details.each do |song|
      unless song["track"]["id"] == nil
        Song.create(
          playlist_id: @new_playlist.id,
          name: song["track"]["name"],
          artist: song["track"]["artists"][0]["name"],
          image: song["track"]["album"]["images"][0]["url"],
          spotify_id: song["track"]["id"]
        )
      end
    end
  end

  def merge_playlists
    # convert value to int
    @playlist_id_array.each do |playlist_id|
      @id_find = playlist_id.to_i
      set_songs
    end
  end

  def set_songs
    # @id_find
    playlist_to_copy = Song.where("playlist_id = ?", @id_find)
    playlist_to_copy.each do |song|
      Song.create!(
        playlist_id: Playlist.last.id,
        name: song.name,
        image: song.image,
        spotify_id: song.spotify_id,
        artist: song.artist
      )
    end
  end

  def merge_playlists
    # convert value to int
    @playlist_id_array.each do |playlist_id|
      @id_find = playlist_id.to_i
      set_songs
    end
  end

  def set_songs
    # @id_find
    playlist_to_copy = Song.where("playlist_id = ?", @id_find)
    playlist_to_copy.each do |song|
      Song.create!(
        playlist_id: Playlist.last.id,
        name: song.name,
        image: song.image,
        spotify_id: song.spotify_id,
        artist: song.artist
      )
    end
  end

end
