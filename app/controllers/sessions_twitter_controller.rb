class SessionsTwitterController < ApplicationController
  def new
    redirect_to '/auth/twitter'
  end

  def create
    auth_params = request.env["omniauth.auth"]

    auth = User.where(provider: auth_params['provider'], uid: auth_params['uid']).first

    user = auth || User.create_with_omniauth_twitter(auth_params)

    session[:user_id] = user.id
    session[:provider] = 'twitter'

    redirect_to user_path(user), notice: "Signed in!"
  end

  def destroy
    reset_session
    redirect_to root_url, notice: 'Signed out!'
  end
end
