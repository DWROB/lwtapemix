class RefreshJob < ApplicationJob
  queue_as :default

  def perform(user)
    @user = User.find(user.id)
    # Do something later
    refresh_access_token unless access_token_expired?
  end

  private

  def refresh_access_token
    body = set_body
    header = set_header

    auth_response = RestClient.post('https://accounts.spotify.com/api/token', body, header)
    auth_params = JSON.parse(auth_response.body)
    user.update(spotify_access_token: auth_params['access_token'])
  end

  def set_body
    {
      grant_type: "refresh_token",
      refresh_token: @user.refresh_token,
      client_id: ENV['CLIENT_ID']
    }
  end

  def set_header
    auth_code = "#{ENV['CLIENT_ID']}:#{ENV['CLIENT_SECRET']}"

    return {
      Authorization: "Basic #{Base64.strict_encode64(auth_code)}",
      'Content-Type': 'application/x-www-form-urlencoded'
    }
  end
end
