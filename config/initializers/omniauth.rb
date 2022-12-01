require 'rspotify/oauth'

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :spotify, ENV.fetch('CLIENT_ID'), ENV.fetch('CLIENT_SECRET'), scope: 'ugc-image-upload playlist-read-private playlist-modify-private playlist-modify-public'
end

OmniAuth.config.allowed_request_methods = [:post, :get]
