class SessionsTwitterController < ApplicationController
  def new
    redirect_to "/auth/twitter?type=student"
    # redirect_to "/auth/twitter"
  end

  def create
    auth_params = request.env["omniauth.auth"]
    auth = User.where(provider: auth_params['provider'], uid: auth_params['uid']).first
    request.env["omniauth.params"]
    user = auth || User.create_with_omniauth_twitter(auth_params, request.env["omniauth.params"]["type"].downcase == "student")
    session[:user_id] = user.id
    session[:provider] = 'twitter'
    
    path = if user.type == "Student"
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
