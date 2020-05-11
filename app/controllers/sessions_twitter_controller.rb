class SessionsTwitterController < ApplicationController

    def new
      redirect_to '/auth/twitter'
    end
  
    def create
      
      auth_params = request.env["omniauth.auth"]
      
      auth = User.where(provider: auth_params['provider'], uid: auth_params['uid']).first

      if auth
        user = auth
      else
        user = User.create_with_omniauth_twitter(auth_params)
      end

      session[:user_id] = user.id
      session[:provider] = 'twitter'
      
      redirect_to user_path(user), :notice => "Signed in!"
    end
  
    def destroy
      reset_session
      redirect_to root_url, notice: 'Signed out!'
    end
  end