class SessionsTwitterController < ApplicationController
  def new
    #redirect_to "/auth/twitter?email=test@test.com"
    redirect_to "/auth/twitter"
  end

  def create
    auth_params = request.env["omniauth.auth"]
    auth = User.where(provider: auth_params['provider'], uid: auth_params['uid']).first
    
    user = auth || User.create_with_omniauth_twitter(auth_params)
    session[:user_id] = user.id
    session[:provider] = 'twitter'
    
    path = if user.type == "student"
             student_path(user)
           else
             teacher_path(user)
           end

    redirect_to path, notice: "Welcome to SkillCraft, a place to craft your skills!"
    
  end

  def destroy
    reset_session
    redirect_to root_url, notice: 'Signed out!'
  end
end
