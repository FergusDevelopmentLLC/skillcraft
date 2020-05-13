class SessionsTwitterController < ApplicationController
  
  def create
    auth_params = request.env["omniauth.auth"]
    auth = User.where(provider: auth_params['provider'], uid: auth_params['uid']).first
    
    is_student = request.env["omniauth.params"]["type"].downcase == "student"
    
    if auth
      is_student = auth["type"].downcase == "student"
    end
    
    user = auth || User.create_with_omniauth_twitter(auth_params, is_student)
    
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
