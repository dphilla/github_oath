class SessionsController < ApplicationController

  def create
    require 'pry'; binding.pry
    @response = Faraday.post("https://github.com/login/oauth/access_token?client_id=#{client_id}&client_secret=#{client_secret}&code=#{params["code"]}")
      token = @response.body.split(/\W+/)[1]

      oauth_response = Faraday.get("https://api.github.com/user?access_token=#{token}")
      auth = JSON.parse(oauth_response.body)

      user = User.find_or_create_by(uid: auth["id"])
      user.username = auth["login"]
      user.uid = auth["id"]
      user.token = token
      user.save

      session[:user_id] = user.id
      #require 'pry'; binding.pry
      redirect_to dashboard_index_path
  end

end
