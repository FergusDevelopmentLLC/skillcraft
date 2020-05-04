class ApplicationController < ActionController::Base

  # configure do
  #   set :public_folder, 'public'
  #   set :views, 'app/views'
  #   enable :sessions
  #   set :session_secret, 'secure_password'
  # end

  #helpers do
  
    def logged_in
        !!current_user
    end
    helper_method :logged_in

    def current_user
        @current_user ||= Person.find_by(:id => session[:user_id])
    end
    helper_method :current_user

  #end

end