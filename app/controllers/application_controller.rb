class ApplicationController < ActionController::Base
  
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception #???

  helper_method :logged_in?
  helper_method :current_user
  helper_method :is_student?

  private
    def logged_in?
      !!current_user
    end
      
    def is_student?
      if @current_user.type == "Student"
        true
      else
        false
      end
    end
    
    def current_user
      @current_user ||= Person.find_by(:id => session[:user_id])
    end

    # def authenticate_user!
    #   if !current_user
    #     redirect_to root_url, :alert => 'You need to sign in for access to this page.'
    #   end
    # end
end

class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user
  helper_method :user_signed_in?
  helper_method :correct_user?

  private
    

end