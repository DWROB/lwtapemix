class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    query_params = {
      client_id: ENV['CLIENT_ID'],
      response_type: "code",
      redirect_uri: "http://localhost:3000/playlists/",
      scope: "user-library-read playlist-read-private playlist-modify-private playlist-modify-public user-read-private user-top-read user-follow-read",
      show_dialog: true
    }
    @authorize_spotify_link = "https://accounts.spotify.com/authorize?#{query_params.to_query}"
  end

  def done
  end
end
