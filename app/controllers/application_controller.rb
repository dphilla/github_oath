class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :client_id, :client_secret, :current_user

  def client_id
    ######### - from gh dev page
  end

  def client_secret
    ######## from gh dev page
  end

  def current_user
    @current_user ||= User.find(session[:user_id])
  end

end
