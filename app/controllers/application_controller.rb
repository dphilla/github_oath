class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :client_id, :client_secret, :current_user

  def client_id
    "aef031459b047bd01314"
  end

  def client_secret
    "b0d36606843106c11e9468df261d55f1d151c54d"
  end

  def current_user
    #require 'pry'; binding.pry
    @current_user ||= User.find(session[:user_id])
  end

end
